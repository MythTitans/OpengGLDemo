#pragma once

#include "Shader.h"

#include "RenderTarget.h"

class BlurShader : public Shader
{
  public:
    BlurShader();
    BlurShader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode) = delete;
    void useSource(const RenderTarget& source) const;
    void unuseSource(const RenderTarget& source) const;
    void setHorizontal(bool horizontal) const;

  private:
    GLuint uniformSourceLocation;
    GLuint uniformHorizontalLocation;
};