#include "include/DirectionalShadowMapShader.h"

#include <glm/gtc/type_ptr.hpp>

#include "include/Common.h"

DirectionalShadowMapShader::DirectionalShadowMapShader()
    : Shader{readFileContent("../../resources/shaders/directional_shadow_map.vert"), readFileContent("../../resources/shaders/directional_shadow_map.frag")},
      uniformTransformLocation{getUniformLocation("model")},
      uniformLightTransformLocation{getUniformLocation("lightTransform")}
{
}

void DirectionalShadowMapShader::setTransform(const glm::mat4& model) const
{
    glUniformMatrix4fv(uniformTransformLocation, 1, GL_FALSE, glm::value_ptr(model));
}

void DirectionalShadowMapShader::setLightTransform(const glm::mat4& lightTransform) const
{
    glUniformMatrix4fv(uniformLightTransformLocation, 1, GL_FALSE, glm::value_ptr(lightTransform));
}