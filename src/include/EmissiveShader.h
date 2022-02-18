#pragma once

#include <array>

#include <GL/glew.h>
#include <glm/glm.hpp>

#include "MaterialShader.h"

struct UniformEmissiveMaterial
{
    GLuint emissiveColorLocation;
    GLuint emissivePowerLocation;
    GLuint emissiveMapLocation;
};

class EmissiveShader : public MaterialShader
{
  public:
    EmissiveShader();
    EmissiveShader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode) = delete;
    void setProjection(const glm::mat4& projection) const;
    void setView(const glm::mat4& view) const;
    void setTransform(const glm::mat4& transform) const;
    void useMaterial(const Material* material) const override;
    void unuseMaterial(const Material* material) const override;

  private:
    std::unique_ptr<Texture> dummyEmissive;

    GLuint uniformProjectionLocation;
    GLuint uniformViewLocation;
    GLuint uniformTransformLocation;
    UniformEmissiveMaterial uniformMaterial;
};
