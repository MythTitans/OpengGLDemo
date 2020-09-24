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
	char buffer[128];
	auto indexedLocation = [&buffer](const std::string& location, int index) {
		snprintf(buffer, 128, location.c_str(), index);
		return buffer;
	};

	for (size_t i = 0; i < MAX_DIRECTIONAL_LIGHTS; ++i)
	{
		uniformDirectionalLights[i].intensityLocation = getUniformLocation(indexedLocation("directionalLights[%d].base.intensity", i));
		uniformDirectionalLights[i].colorLocation = getUniformLocation(indexedLocation("directionalLights[%d].base.color", i));
		uniformDirectionalLights[i].directionLocation = getUniformLocation(indexedLocation("directionalLights[%d].direction", i));
	}

	for (size_t i = 0; i < MAX_POINT_LIGHTS; ++i)
	{

	}

	for (size_t i = 0; i < MAX_SPOT_LIGHTS; ++i)
	{

	}
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
	glUniform3fv(uniformAmbientColorLocation, 1, glm::value_ptr(ambientColor));
}

void PhongLightShader::setDirectionalLights(const std::vector<Light>& directionalLights)
{
	if (directionalLights.size() > MAX_DIRECTIONAL_LIGHTS)
	{
		throw std::runtime_error("Too many directional lights !");
	}

	for (size_t i = 0; i < directionalLights.size(); ++i)
	{
		const Light& light = directionalLights[i];
		UniformDirectionalLight& uniformLight = uniformDirectionalLights[i];

		glUniform1f(uniformLight.intensityLocation, light.getIntensity());
		glUniform3fv(uniformLight.colorLocation, 1, glm::value_ptr(light.getColor()));
		glUniform3fv(uniformLight.directionLocation, 1, glm::value_ptr(light.getDirection()));
	}
}

void PhongLightShader::setPointLights(const std::vector<Light>& pointLights)
{
	if (pointLights.size() > MAX_POINT_LIGHTS)
	{
		throw std::runtime_error("Too many point lights !");
	}

	for (const Light& light : pointLights)
	{
		// TODO uniform for light parameters

			// position
			// intensity
			// color
			// attenuation
	}
}

void PhongLightShader::setSpotLights(const std::vector<Light>& spotLights)
{
	if (spotLights.size() >= MAX_SPOT_LIGHTS)
	{
		throw std::runtime_error("Too many spot lights !");
	}

	for (const Light& light : spotLights)
	{
		// TODO uniform for light parameters

			// position
			// direction
			// intensity
			// color
			// attenuation
			// angle
	}
}

void PhongLightShader::useMaterial(const Material* material) const
{
	if (material)
	{
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
