#pragma once

#include <vector>
#include <memory>
#include <filesystem>

#include <assimp/scene.h>
#include <assimp/mesh.h>

#include "Mesh.h"
#include "Texture.h"
#include "Shader.h"

class Model
{
public:
	Model(std::vector<std::unique_ptr<Mesh>>&& meshes, std::vector<std::unique_ptr<Material>>&& materials);
	Model(const Model&) = delete;
	Model& operator=(const Model&) = delete;
	Model(Model&& reference) noexcept;
	Model& operator=(Model&& reference) noexcept;

	static std::unique_ptr<Model> loadModel(std::filesystem::path filePath);

	void render(const Shader& shader) const;

private:
	std::vector<std::unique_ptr<Mesh>> meshes;
	std::vector<std::unique_ptr<Material>> materials;

	static std::vector<std::unique_ptr<Mesh>> loadMeshes(aiNode* node, const aiScene* scene, const std::vector<std::unique_ptr<Material>>& materials);
	static std::unique_ptr<Mesh> loadMesh(aiMesh* mesh, const std::vector<std::unique_ptr<Material>>& materials);
	static std::vector<std::unique_ptr<Material>> loadMaterials(const aiScene* scene);

	// TODO should be a Mesh constant
	static constexpr int VERTEX_COMPONENTS = 8;
};

