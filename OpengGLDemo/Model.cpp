#include "Model.h"

#include <assimp/Importer.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>

#include "Mesh.h"

Model::Model(std::vector<std::unique_ptr<Mesh>>&& meshes) : meshes{ std::move(meshes) }
{
}

Model::Model(Model&& reference) noexcept : meshes{ std::move(reference.meshes) }
{
}

Model& Model::operator=(Model&& reference) noexcept
{
	this->meshes = std::move(reference.meshes);
	return *this;
}

Model::~Model()
{
	meshes.clear();
}

std::unique_ptr<Model> Model::loadModel(std::filesystem::path filePath)
{
	Assimp::Importer importer;

	auto* scene = importer.ReadFile(filePath.string(), aiProcess_Triangulate | aiProcess_FlipUVs | aiProcess_GenSmoothNormals | aiProcess_JoinIdenticalVertices);
	if (!scene)
	{
		throw std::runtime_error("Failed to load model " + filePath.string());
	}

	auto meshes = loadNode(scene->mRootNode, scene);

	return std::make_unique<Model>(std::move(meshes));
}

std::vector<std::unique_ptr<Mesh>> Model::loadNode(aiNode* node, const aiScene* scene)
{
	std::vector<std::unique_ptr<Mesh>> meshes;

	for (size_t i = 0; i < node->mNumMeshes; ++i)
	{
		auto mesh = loadMesh(scene->mMeshes[node->mMeshes[i]]);
		meshes.push_back(std::move(mesh));
	}

	for (size_t i = 0; i < node->mNumChildren; ++i)
	{
		auto childrenMeshes = loadNode(node->mChildren[i], scene);
		for (auto& childMesh : childrenMeshes)
		{
			meshes.push_back(std::move(childMesh));
		}
	}

	return meshes;
}

std::unique_ptr<Mesh> Model::loadMesh(aiMesh* mesh)
{
	size_t vertexCount = mesh->mNumVertices;

	std::vector<GLfloat> vertices(VERTEX_COMPONENTS * vertexCount);

	for (size_t i = 0; i < vertexCount; ++i)
	{
		auto vertex = mesh->mVertices[i];
		vertices[VERTEX_COMPONENTS * i] = vertex.x;
		vertices[VERTEX_COMPONENTS * i + 1] = vertex.y;
		vertices[VERTEX_COMPONENTS * i + 2] = vertex.z;
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

	return std::make_unique<Mesh>(vertices, indices);
}

void Model::render() const
{
	for (const auto& mesh : meshes)
	{
		mesh->render();
	}
}
