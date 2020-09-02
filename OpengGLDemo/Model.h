#pragma once

#include <vector>
#include <memory>
#include <filesystem>

#include <assimp/scene.h>
#include <assimp/mesh.h>

#include "Mesh.h"
#include "Texture.h"

class Model
{
public:
	Model(std::vector<std::unique_ptr<Mesh>>&& meshes, std::vector<std::unique_ptr<Texture>>&& textures);
	Model(const Model&) = delete;
	Model& operator=(const Model&) = delete;
	Model(Model&& reference) noexcept;
	Model& operator=(Model&& reference) noexcept;

	static std::unique_ptr<Model> loadModel(std::filesystem::path filePath);

	void render() const;

private:
	std::vector<std::unique_ptr<Mesh>> meshes;
	std::vector<std::unique_ptr<Texture>> textures;

	static std::vector<std::unique_ptr<Mesh>> loadMeshes(aiNode* node, const aiScene* scene, const std::vector<std::unique_ptr<Texture>>& textures);
	static std::unique_ptr<Mesh> loadMesh(aiMesh* mesh, const std::vector<std::unique_ptr<Texture>>& textures);
	static std::vector<std::unique_ptr<Texture>> loadTextures(const aiScene* scene);

	static constexpr int VERTEX_COMPONENTS = 5;
};

