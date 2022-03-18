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
    GLuint ambientColorLocation;
    GLuint diffuseColorLocation;
    GLuint specularColorLocation;
    GLuint specularPowerLocation;
    GLuint diffuseMapLocation;
    GLuint normalMapLocation;
    GLuint specularMapLocation;
    GLuint opacityLocation;
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
    std::unique_ptr<Texture> dummyDiffuse;
    std::unique_ptr<Texture> dummyNormal;
    std::unique_ptr<Texture> dummySpecularEnabled;
    std::unique_ptr<Texture> dummySpecularDisabled;

    PBRUniformMaterial uniformMaterial;
};
