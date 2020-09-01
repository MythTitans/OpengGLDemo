#pragma once

#include <vector>
#include <memory>
#include <filesystem>

#include <assimp/scene.h>
#include <assimp/mesh.h>

class Mesh;

class Model
{
public:
	Model(std::vector<std::unique_ptr<Mesh>>&& meshes);
	Model(const Model&) = delete;
	Model& operator=(const Model&) = delete;
	Model(Model&& reference) noexcept;
	Model& operator=(Model&& reference) noexcept;
	~Model();

	static std::unique_ptr<Model> loadModel(std::filesystem::path filePath);

	void render() const;

private:
	std::vector<std::unique_ptr<Mesh>> meshes;

	static std::vector<std::unique_ptr<Mesh>> loadNode(aiNode* node, const aiScene* scene);
	static std::unique_ptr<Mesh> loadMesh(aiMesh* mesh);

	static constexpr int VERTEX_COMPONENTS = 5;
};

