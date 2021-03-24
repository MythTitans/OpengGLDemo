#include "SkyboxShader.h"

#include <glm/gtc/type_ptr.hpp>

#include "Common.h"

SkyboxShader::SkyboxShader() :
	Shader{ readFileContent("Shaders/skybox.vert"), readFileContent("Shaders/skybox.frag") },
	uniformProjectionLocation{ getUniformLocation("projection") },
	uniformViewLocation{ getUniformLocation("view") },
	uniformCubeMapLocation{ getUniformLocation("cubeMap") }
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
	glActiveTexture(GL_TEXTURE0);
	skyboxMap->use();
	glUniform1i(uniformCubeMapLocation, 0);
}

void SkyboxShader::unuseSkyboxMap(const CubeMap* skyboxMap) const
{
	skyboxMap->unuse();
}