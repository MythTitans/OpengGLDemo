#include "Model.h"

#include <assimp/Importer.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>

Model::Model(std::vector<std::unique_ptr<Mesh>>&& meshes, std::vector<std::unique_ptr<Texture>>&& textures) : meshes{ std::move(meshes) }, textures{ std::move(textures) }
{
}

Model::Model(Model&& reference) noexcept : meshes{ std::move(reference.meshes) }, textures{ std::move(reference.textures) }
{
}

Model& Model::operator=(Model&& reference) noexcept
{
	if (this != &reference)
	{
		this->meshes = std::move(reference.meshes);
		this->textures = std::move(reference.textures);
	}
	
	return *this;
}

std::unique_ptr<Model> Model::loadModel(std::filesystem::path filePath)
{
	Assimp::Importer importer;

	auto* scene = importer.ReadFile(filePath.string(), aiProcess_Triangulate | aiProcess_FlipUVs | aiProcess_GenSmoothNormals | aiProcess_JoinIdenticalVertices);
	if (!scene)
	{
		throw std::runtime_error("Failed to load model " + filePath.string());
	}

	auto textures = loadTextures(scene);
	auto meshes = loadMeshes(scene->mRootNode, scene, textures);

	return std::make_unique<Model>(std::move(meshes), std::move(textures));
}

void Model::render() const
{
	for (const auto& mesh : meshes)
	{
		mesh->render();
	}
}

std::vector<std::unique_ptr<Mesh>> Model::loadMeshes(aiNode* node, const aiScene* scene, const std::vector<std::unique_ptr<Texture>>& textures)
{
	std::vector<std::unique_ptr<Mesh>> meshes;

	for (size_t i = 0; i < node->mNumMeshes; ++i)
	{
		auto mesh = loadMesh(scene->mMeshes[node->mMeshes[i]], textures);
		meshes.push_back(std::move(mesh));
	}

	for (size_t i = 0; i < node->mNumChildren; ++i)
	{
		auto childrenMeshes = loadMeshes(node->mChildren[i], scene, textures);
		for (auto& childMesh : childrenMeshes)
		{
			meshes.push_back(std::move(childMesh));
		}
	}

	return meshes;
}

std::unique_ptr<Mesh> Model::loadMesh(aiMesh* mesh, const std::vector<std::unique_ptr<Texture>>& textures)
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

	auto* texture = textures[mesh->mMaterialIndex].get();

	return std::make_unique<Mesh>(vertices, indices, texture);
}

std::vector<std::unique_ptr<Texture>> Model::loadTextures(const aiScene* scene)
{
	size_t textureCount = scene->mNumMaterials;

	std::vector<std::unique_ptr<Texture>> textures(textureCount);

	for (int i = 0; i < textureCount; ++i)
	{
		textures[i] = nullptr;

		auto* material = scene->mMaterials[i];
		if (material->GetTextureCount(aiTextureType_DIFFUSE) != 0)
		{
			aiString file;
			if (material->GetTexture(aiTextureType_DIFFUSE, 0, &file) == AI_SUCCESS)
			{
				std::filesystem::path filePath{ file.C_Str() };
				textures[i] = Texture::loadTexture("Textures" / filePath.filename());
			}
		}
	}

	return textures;
}
