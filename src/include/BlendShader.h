#pragma once

#include "Shader.h"

#include "RenderTarget.h"

class BlendShader : public Shader
{
  public:
    BlendShader();
    BlendShader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode) = delete;
    void useRenderTargets(const RenderTarget& sourceA, const RenderTarget& sourceB) const;
    void unuseRenderTargets(const RenderTarget& sourceA, const RenderTarget& sourceB) const;

  private:
    GLuint uniformSourceALocation;
    GLuint uniformSourceBLocation;
};
