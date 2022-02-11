#include "include/Model.h"

#include <assimp/Importer.hpp>
#include <assimp/postprocess.h>
#include <assimp/scene.h>

Model::Model(std::vector<std::shared_ptr<Mesh>>&& meshes, std::vector<std::shared_ptr<Material>>&& materials)
    : meshes{std::move(meshes)}, materials{std::move(materials)}
{
    filterTransparentMeshes();
}

Model::Model(Model&& reference) noexcept : meshes{std::move(reference.meshes)}, materials{std::move(reference.materials)}
{
    filterTransparentMeshes();
}

Model& Model::operator=(Model&& reference) noexcept
{
    if (this != &reference)
    {
        this->meshes = std::move(reference.meshes);
        this->materials = std::move(reference.materials);
    }

    filterTransparentMeshes();

    return *this;
}

void Model::filterTransparentMeshes()
{
    for (const auto& mesh : this->meshes)
    {
        if (mesh->isTransparent())
        {
            transparentMeshes.push_back(mesh.get());
        }
        else
        {
            opaqueMeshes.push_back(mesh.get());
        }
    }
}

std::unique_ptr<Model> Model::loadModel(std::filesystem::path filePath)
{
    Assimp::Importer importer;

    auto* scene = importer.ReadFile(filePath.string(),
                                    aiProcess_Triangulate | aiProcess_FlipUVs | aiProcess_GenSmoothNormals | aiProcess_JoinIdenticalVertices |
                                        aiProcess_CalcTangentSpace);
    if (!scene)
    {
        throw std::runtime_error("Failed to load model " + filePath.string());
    }

    auto materials = loadMaterials(scene);
    auto meshes = loadMeshes(scene->mRootNode, scene, materials);

    return std::make_unique<Model>(std::move(meshes), std::move(materials));
}

std::vector<std::shared_ptr<Mesh>> Model::loadMeshes(aiNode* node, const aiScene* scene, const std::vector<std::shared_ptr<Material>>& materials)
{
    std::vector<std::shared_ptr<Mesh>> meshes;

    for (size_t i = 0; i < node->mNumMeshes; ++i)
    {
        auto mesh = loadMesh(scene->mMeshes[node->mMeshes[i]], materials);
        meshes.push_back(std::move(mesh));
    }

    for (size_t i = 0; i < node->mNumChildren; ++i)
    {
        auto childrenMeshes = loadMeshes(node->mChildren[i], scene, materials);
        for (auto& childMesh : childrenMeshes)
        {
            meshes.push_back(std::move(childMesh));
        }
    }

    return meshes;
}

std::shared_ptr<Mesh> Model::loadMesh(aiMesh* mesh, const std::vector<std::shared_ptr<Material>>& materials)
{
    size_t vertexCount = mesh->mNumVertices;

    std::vector<GLfloat> vertices(VERTEX_COMPONENTS * vertexCount);

    for (size_t i = 0; i < vertexCount; ++i)
    {
        auto vertex = mesh->mVertices[i];
        vertices[VERTEX_COMPONENTS * i] = vertex.x;
        vertices[VERTEX_COMPONENTS * i + 1] = vertex.y;
        vertices[VERTEX_COMPONENTS * i + 2] = vertex.z;

        if (mesh->mTextureCoords[0])
        {
            auto texCoords = mesh->mTextureCoords[0][i];
            vertices[VERTEX_COMPONENTS * i + 3] = texCoords.x;
            vertices[VERTEX_COMPONENTS * i + 4] = texCoords.y;
        }
        else
        {
            vertices[VERTEX_COMPONENTS * i + 3] = 0;
            vertices[VERTEX_COMPONENTS * i + 4] = 0;
        }

        auto normal = mesh->mNormals[i];
        vertices[VERTEX_COMPONENTS * i + 5] = normal.x;
        vertices[VERTEX_COMPONENTS * i + 6] = normal.y;
        vertices[VERTEX_COMPONENTS * i + 7] = normal.z;

        auto binormal = mesh->mBitangents[i];
        vertices[VERTEX_COMPONENTS * i + 8] = binormal.x;
        vertices[VERTEX_COMPONENTS * i + 9] = binormal.y;
        vertices[VERTEX_COMPONENTS * i + 10] = binormal.z;

        auto tangent = mesh->mTangents[i];
        vertices[VERTEX_COMPONENTS * i + 11] = tangent.x;
        vertices[VERTEX_COMPONENTS * i + 12] = tangent.y;
        vertices[VERTEX_COMPONENTS * i + 13] = tangent.z;
    }

    size_t faceCount = mesh->mNumFaces;

    std::vector<GLuint> indices;

    for (size_t i = 0; i < faceCount; ++i)
    {
        auto face = mesh->mFaces[i];

        size_t indexCount = face.mNumIndices;

        for (size_t j = 0; j < indexCount; ++j)
        {
            indices.push_back(face.mIndices[j]);
        }
    }

    auto* material = materials[mesh->mMaterialIndex].get();
    return std::make_unique<Mesh>(vertices, indices, material);
}

std::vector<std::shared_ptr<Material>> Model::loadMaterials(const aiScene* scene)
{
    size_t materialCount = scene->mNumMaterials;

    std::vector<std::shared_ptr<Material>> materials(materialCount);

    for (int i = 0; i < materialCount; ++i)
    {
        auto* material = scene->mMaterials[i];

        aiColor3D ambientColor;
        material->Get(AI_MATKEY_COLOR_AMBIENT, ambientColor);
        aiColor3D diffuseColor;
        material->Get(AI_MATKEY_COLOR_DIFFUSE, diffuseColor);
        aiColor3D specularColor;
        material->Get(AI_MATKEY_COLOR_SPECULAR, specularColor);
        ai_real specularPower;
        material->Get(AI_MATKEY_SHININESS, specularPower);
        ai_real opacity;
        material->Get(AI_MATKEY_OPACITY, opacity);

        std::unique_ptr<Texture> diffuseMap;
        if (material->GetTextureCount(aiTextureType_DIFFUSE) != 0)
        {
            aiString file;
            if (material->GetTexture(aiTextureType_DIFFUSE, 0, &file) == AI_SUCCESS)
            {
                std::filesystem::path filePath{file.C_Str()};
                diffuseMap = Texture::loadTexture("Textures" / filePath.filename());
            }
        }

        std::unique_ptr<Texture> normalMap;
        if (material->GetTextureCount(aiTextureType_NORMALS) != 0)
        {
            aiString file;
            if (material->GetTexture(aiTextureType_NORMALS, 0, &file) == AI_SUCCESS)
            {
                std::filesystem::path filePath{file.C_Str()};
                normalMap = Texture::loadTexture("Textures" / filePath.filename());
            }
        }

        std::unique_ptr<Texture> specularMap;
        if (material->GetTextureCount(aiTextureType_SPECULAR) != 0)
        {
            aiString file;
            if (material->GetTexture(aiTextureType_SPECULAR, 0, &file) == AI_SUCCESS)
            {
                std::filesystem::path filePath{file.C_Str()};
                specularMap = Texture::loadTexture("Textures" / filePath.filename());
            }
        }

        auto colorToGlm = [](const aiColor3D& color) -> glm::vec3 { return {color.r, color.g, color.b}; };

        materials[i] = std::make_unique<Material>(colorToGlm(ambientColor),
                                                  colorToGlm(diffuseColor),
                                                  colorToGlm(specularColor),
                                                  specularPower,
                                                  std::move(diffuseMap),
                                                  std::move(normalMap),
                                                  std::move(specularMap),
                                                  opacity);
    }

    return materials;
}
