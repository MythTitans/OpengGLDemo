#include "PhongLightShader.h"

#include <glm/gtc/type_ptr.hpp>

#include "Common.h"

PhongLightShader::PhongLightShader() :
	Shader{ readFileContent("Shaders/phong.vert"), readFileContent("Shaders/phong.frag") },
	uniformProjectionLocation{ getUniformLocation("projection") },
	uniformViewLocation{ getUniformLocation("view") },
	uniformModelLocation{ getUniformLocation("model") },
	uniformDiffuseTextureLocation{ getUniformLocation("diffuseTexture") }
{
}

void PhongLightShader::setProjection(const glm::mat4& projection) const
{
	glUniformMatrix4fv(uniformProjectionLocation, 1, GL_FALSE, glm::value_ptr(projection));
}

void PhongLightShader::setView(const glm::mat4& view) const
{
	glUniformMatrix4fv(uniformViewLocation, 1, GL_FALSE, glm::value_ptr(view));
}

void PhongLightShader::setModel(const glm::mat4& model) const
{
	glUniformMatrix4fv(uniformModelLocation, 1, GL_FALSE, glm::value_ptr(model));
}

void PhongLightShader::setDiffuseTexture(int textureUnit) const
{
	glUniform1i(uniformDiffuseTextureLocation, textureUnit);
}
