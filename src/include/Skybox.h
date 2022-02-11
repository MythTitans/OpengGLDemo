#pragma once

#include <memory>

#include "Mesh.h"
#include "SkyboxShader.h"

class Skybox
{
  public:
    Skybox(std::unique_ptr<CubeMap> skyboxMap);
    void render(const SkyboxShader& skyboxShader) const;

  private:
    std::unique_ptr<CubeMap> skyboxMap;
    Mesh skyboxMesh;
};
