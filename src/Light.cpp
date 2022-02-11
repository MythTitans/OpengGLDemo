#include "include/Light.h"

#include <glm/gtc/matrix_transform.hpp>

Light::Light(Type type, float intensity, glm::vec3 color, glm::mat4 lightProjection) : type{ type }, intensity{ intensity }, color{ color }, position{ 0, 0, 0 }, direction{ 0, 0, 1 }, constantAttenuation{ 0 }, linearAttenuation{ 0 }, quadricAttenuation{ 0 }, angle{ 0 }, edge{ 0 }, lightProjection{ lightProjection }
{
}

Light Light::directionalLight(float intensity, glm::vec3 color, glm::vec3 position, glm::vec3 direction)
{
	Light light{ Type::DIRECTIONAL_LIGHT, intensity, color, glm::ortho(-20.0f, 20.0f, -20.0f, 20.0f, 0.1f, 100.0f) };
	light.setPosition(position);
	light.setDirection(direction);

	return light;
}

Light Light::pointLight(float intensity, glm::vec3 color, glm::vec3 position, float constantAttenuation, float linearAttenuation, float quadricAttenuation)
{
	Light light{ Type::POINT_LIGHT, intensity, color, glm::perspective(glm::radians(90.0f), 1.0f, 0.1f, 100.0f) }; // TODO near far
	light.setPosition(position);
	light.setConstantAttenuation(constantAttenuation);
	light.setLinearAttenuation(linearAttenuation);
	light.setQuadricAttenutation(quadricAttenuation);

	return light;
}

Light Light::spotLight(float intensity, glm::vec3 color, glm::vec3 position, glm::vec3 direction, float constantAttenuation, float linearAttenuation, float quadricAttenuation, float angle)
{
	Light light{ Type::SPOT_LIGHT, intensity, color, glm::perspective(glm::radians(90.0f), 1.0f, 0.1f, 100.0f) }; // TODO near far
	light.setPosition(position);
	light.setDirection(direction);
	light.setConstantAttenuation(constantAttenuation);
	light.setLinearAttenuation(linearAttenuation);
	light.setQuadricAttenutation(quadricAttenuation);
	light.setAngle(angle);

	return light;
}

std::vector<glm::mat4> Light::computeLightTransform() const
{
	if (type == Type::DIRECTIONAL_LIGHT) {
		return { lightProjection * glm::lookAt(position, position + direction, {0, 1, 0}) };
	}

	return {};
}
