#pragma once

#include "Shader.h"

class DirectionalShadowMapShader : public Shader
{
  public:
    DirectionalShadowMapShader();
    void setTransform(const glm::mat4 &transform);
    void setLightTransform(const glm::mat4 &lightTransform);

  private:
    GLuint uniformTransformLocation;
    GLuint uniformLightTransformLocation;
};
