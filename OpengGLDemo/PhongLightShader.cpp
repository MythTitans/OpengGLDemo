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
	uniformDiffuseTextureLocation{ getUniformLocation("diffuseTexture") },
	uniformDirectionLightCount{ getUniformLocation("directionalLightCount") },
	uniformPointLightCount{ getUniformLocation("pointLightCount") },
	uniformSpotLightCount{ getUniformLocation("spotLightCount") }
{
	char buffer[128];
	auto indexedLocation = [&buffer](const std::string& location, int index) {
		snprintf(buffer, 128, location.c_str(), index);
		return buffer;
	};

	for (int i = 0; i < MAX_DIRECTIONAL_LIGHTS; ++i)
	{
		uniformDirectionalLights[i].intensityLocation = getUniformLocation(indexedLocation("directionalLights[%d].base.intensity", i));
		uniformDirectionalLights[i].colorLocation = getUniformLocation(indexedLocation("directionalLights[%d].base.color", i));
		uniformDirectionalLights[i].directionLocation = getUniformLocation(indexedLocation("directionalLights[%d].direction", i));
	}

	for (int i = 0; i < MAX_POINT_LIGHTS; ++i)
	{
		uniformPointLights[i].intensityLocation = getUniformLocation(indexedLocation("pointLights[%d].base.intensity", i));
		uniformPointLights[i].colorLocation = getUniformLocation(indexedLocation("pointLights[%d].base.color", i));
		uniformPointLights[i].positionLocation = getUniformLocation(indexedLocation("pointLights[%d].position", i));
		uniformPointLights[i].constantAttenuationLocation = getUniformLocation(indexedLocation("pointLights[%d].constantAttenuation", i));
		uniformPointLights[i].linearAttenuationLocation = getUniformLocation(indexedLocation("pointLights[%d].linearAttenuation", i));
		uniformPointLights[i].quadricAttenuationLocation = getUniformLocation(indexedLocation("pointLights[%d].quadricAttenuation", i));
	}

	for (int i = 0; i < MAX_SPOT_LIGHTS; ++i)
	{
		uniformSpotLights[i].intensityLocation = getUniformLocation(indexedLocation("spotLights[%d].base.base.intensity", i));
		uniformSpotLights[i].colorLocation = getUniformLocation(indexedLocation("spotLights[%d].base.base.color", i));
		uniformSpotLights[i].positionLocation = getUniformLocation(indexedLocation("spotLights[%d].base.position", i));
		uniformSpotLights[i].directionLocation = getUniformLocation(indexedLocation("spotLights[%d].direction", i));
		uniformSpotLights[i].constantAttenuationLocation = getUniformLocation(indexedLocation("spotLights[%d].base.constantAttenuation", i));
		uniformSpotLights[i].linearAttenuationLocation = getUniformLocation(indexedLocation("spotLights[%d].base.linearAttenuation", i));
		uniformSpotLights[i].quadricAttenuationLocation = getUniformLocation(indexedLocation("spotLights[%d].base.quadricAttenuation", i));
		uniformSpotLights[i].edgeLocation = getUniformLocation(indexedLocation("spotLights[%d].edge", i));
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

	glUniform1i(uniformDirectionLightCount, (int) directionalLights.size());

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

	glUniform1i(uniformPointLightCount, (int) pointLights.size());

	for (size_t i = 0; i < pointLights.size(); ++i)
	{
		const Light& light = pointLights[i];
		UniformPointLight uniformLight = uniformPointLights[i];

		glUniform1f(uniformLight.intensityLocation, light.getIntensity());
		glUniform3fv(uniformLight.colorLocation, 1, glm::value_ptr(light.getColor()));
		glUniform3fv(uniformLight.positionLocation, 1, glm::value_ptr(light.getPosition()));
		glUniform1f(uniformLight.constantAttenuationLocation, light.getConstantAttenuation());
		glUniform1f(uniformLight.linearAttenuationLocation, light.getLinearAttenuation());
		glUniform1f(uniformLight.quadricAttenuationLocation, light.getQuadricAttenuation());
	}
}

void PhongLightShader::setSpotLights(const std::vector<Light>& spotLights)
{
	if (spotLights.size() >= MAX_SPOT_LIGHTS)
	{
		throw std::runtime_error("Too many spot lights !");
	}

	glUniform1i(uniformSpotLightCount, (int) spotLights.size());

	for (int i = 0; i < (int) spotLights.size(); ++i)
	{
		const Light& light = spotLights[i];
		UniformSpotLight uniformLight = uniformSpotLights[i];

		glUniform1f(uniformLight.intensityLocation, light.getIntensity());
		glUniform3fv(uniformLight.colorLocation, 1, glm::value_ptr(light.getColor()));
		glUniform3fv(uniformLight.positionLocation, 1, glm::value_ptr(light.getPosition()));
		glUniform3fv(uniformLight.directionLocation, 1, glm::value_ptr(light.getDirection()));
		glUniform1f(uniformLight.constantAttenuationLocation, light.getConstantAttenuation());
		glUniform1f(uniformLight.linearAttenuationLocation, light.getLinearAttenuation());
		glUniform1f(uniformLight.quadricAttenuationLocation, light.getQuadricAttenuation());
		glUniform1f(uniformLight.edgeLocation, light.getEdge());
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
