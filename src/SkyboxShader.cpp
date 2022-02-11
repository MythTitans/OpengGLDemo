#include "include/SkyboxShader.h"

#include <glm/gtc/type_ptr.hpp>

#include "include/Common.h"

SkyboxShader::SkyboxShader()
    : Shader{readFileContent("../../resources/shaders/skybox.vert"), readFileContent("../../resources/shaders/skybox.frag")},
      uniformProjectionLocation{getUniformLocation("projection")},
      uniformViewLocation{getUniformLocation("view")},
      uniformCubeMapLocation{getUniformLocation("cubeMap")}
{
}

void SkyboxShader::setProjection(const glm::mat4& projection) const
{
    glUniformMatrix4fv(uniformProjectionLocation, 1, GL_FALSE, glm::value_ptr(projection));
}

void SkyboxShader::setView(const glm::mat4& view) const
{
    glUniformMatrix4fv(uniformViewLocation, 1, GL_FALSE, glm::value_ptr(view));
}

void SkyboxShader::useSkyboxMap(const CubeMap* skyboxMap) const
{
    skyboxMap->use(0);
    glUniform1i(uniformCubeMapLocation, 0);
}

void SkyboxShader::unuseSkyboxMap(const CubeMap* skyboxMap) const
{
    skyboxMap->unuse();
}