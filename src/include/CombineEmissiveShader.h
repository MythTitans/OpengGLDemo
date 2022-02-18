#pragma once

#include "Shader.h"

#include "RenderTarget.h"

class CombineEmissiveShader : public Shader
{
  public:
    CombineEmissiveShader();
    CombineEmissiveShader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode) = delete;
    void useRenderTargets(const RenderTarget& colorSource, const RenderTarget& emissiveSource) const;
    void unuseRenderTargets(const RenderTarget& colorSource, const RenderTarget& emissiveSource) const;

  private:
    GLuint uniformColorSourceLocation;
    GLuint uniformEmissiveSourceLocation;
};
