#pragma once

#include <array>

#include <GL/glew.h>
#include <glm/glm.hpp>

#include "Light.h"
#include "LightShader.h"
#include "MaterialShader.h"
#include "ShadowMap.h"

struct PBRUniformMaterial
{
    GLuint albedoLocation;
    GLuint normalLocation;
    GLuint metallicLocation;
    GLuint roughnessLocation;
    GLuint aoLocation;
};

class PBRLightShader : public LightShader
{
  public:
    PBRLightShader();
    PBRLightShader(const std::string& fragmentShaderCode) = delete;
    PBRLightShader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode) = delete;
    void useMaterial(const Material* material) const override;
    void unuseMaterial(const Material* material) const override;

  private:
    std::unique_ptr<Texture> dummyAlbedo;
    std::unique_ptr<Texture> dummyNormal;
    std::unique_ptr<Texture> dummyMetallic;
    std::unique_ptr<Texture> dummyRoughness;
    std::unique_ptr<Texture> dummyAO;

    PBRUniformMaterial uniformMaterial;
};
