#include "PhongLightShader.h"

#include <glm/gtc/type_ptr.hpp>

#include "Common.h"
#include "Material.h"

PhongLightShader::PhongLightShader() :
	Shader{ readFileContent("Shaders/phong.vert"), readFileContent("Shaders/phong.frag") },
	uniformProjectionLocation{ getUniformLocation("projection") },
	uniformViewLocation{ getUniformLocation("view") },
	uniformTransformLocation{ getUniformLocation("model") },
	uniformAmbientColorLocation{ getUniformLocation("ambientColor") },
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

void PhongLightShader::setTransform(const glm::mat4& transform) const
{
	glUniformMatrix4fv(uniformTransformLocation, 1, GL_FALSE, glm::value_ptr(transform));
}

void PhongLightShader::setAmbientColor(const glm::vec3& ambientColor)
{
	this->ambientColor = ambientColor;
}

void PhongLightShader::useMaterial(const Material* material) const
{
	if (material)
	{
		glUniform3fv(uniformAmbientColorLocation, 1, glm::value_ptr(ambientColor));

		auto* texture = material->getTexture();
		if (texture)
		{
			texture->use();
		}

		glUniform1i(uniformDiffuseTextureLocation, 0);
	}
}

void PhongLightShader::unuseMaterial(const Material* material) const
{
	if (material)
	{
		auto* texture = material->getTexture();
		if (texture)
		{
			texture->unuse();
		}
	}
}
