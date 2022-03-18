#pragma once

#include <array>

#include <GL/glew.h>
#include <glm/glm.hpp>

#include "Light.h"
#include "LightShader.h"
#include "MaterialShader.h"
#include "ShadowMap.h"

struct PhongUniformMaterial
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

class PhongLightShader : public LightShader
{
  public:
    PhongLightShader();
    PhongLightShader(const std::string& fragmentShaderCode) = delete;
    PhongLightShader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode) = delete;
    void setAmbientColor(const glm::vec3& ambientColor) const;
    void useMaterial(const Material* material) const override;
    void unuseMaterial(const Material* material) const override;

  private:
    std::unique_ptr<Texture> dummyDiffuse;
    std::unique_ptr<Texture> dummyNormal;
    std::unique_ptr<Texture> dummySpecularEnabled;
    std::unique_ptr<Texture> dummySpecularDisabled;

    GLuint uniformAmbientColorLocation;
    PhongUniformMaterial uniformMaterial;
};
