#pragma once

#include <filesystem>
#include <memory>
#include <vector>

#include <assimp/mesh.h>
#include <assimp/scene.h>

#include "Mesh.h"
#include "Shader.h"
#include "Texture.h"

class Model
{
  public:
    Model(std::vector<std::shared_ptr<Mesh>>&& meshes, std::vector<std::shared_ptr<Material>>&& materials);
    Model(const Model&) = delete;
    Model& operator=(const Model&) = delete;
    Model(Model&& reference) noexcept;
    Model& operator=(Model&& reference) noexcept;

    static std::shared_ptr<Model> loadModel(std::filesystem::path filePath);

    static std::shared_ptr<Model> loadModel(std::filesystem::path filePath, std::vector<std::shared_ptr<Material>> materials);

    inline const std::vector<const Mesh*>& getOpaqueMeshes() const
    {
        return opaqueMeshes;
    }

    inline const std::vector<const Mesh*>& getTransparentMeshes() const
    {
        return transparentMeshes;
    }

    inline const std::vector<const Mesh*>& getEmissiveMeshes() const
    {
        return emissiveMeshes;
    }

    inline const bool hasTransparentMeshes() const
    {
        return transparentMeshes.size() > 0;
    }

    inline const bool hasEmissiveMeshes() const
    {
        return emissiveMeshes.size() > 0;
    }

  private:
    std::vector<std::shared_ptr<Mesh>> meshes;
    std::vector<std::shared_ptr<Material>> materials;
    std::vector<const Mesh*> opaqueMeshes;
    std::vector<const Mesh*> transparentMeshes;
    std::vector<const Mesh*> emissiveMeshes;

    void detectSpecialMeshes();

    static std::vector<std::shared_ptr<Mesh>> loadMeshes(aiNode* node, const aiScene* scene, const std::vector<std::shared_ptr<Material>>& materials);
    static std::shared_ptr<Mesh> loadMesh(aiMesh* mesh, const std::vector<std::shared_ptr<Material>>& materials);
    static std::vector<std::shared_ptr<Material>> loadMaterials(const aiScene* scene);

    static constexpr int VERTEX_COMPONENTS = Mesh::VERTEX_COMPONENTS;
};
