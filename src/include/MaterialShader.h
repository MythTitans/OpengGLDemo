#pragma once

#include "Shader.h"

class MaterialShader : public Shader
{
  public:
    MaterialShader(const std::string &vertexShaderCode, const std::string &fragmentShaderCode);
    virtual void useMaterial(const Material *material) const = 0;
    virtual void unuseMaterial(const Material *material) const = 0;
};
