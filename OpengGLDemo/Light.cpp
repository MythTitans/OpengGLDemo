#include "Light.h"

Light Light::directionalLight(float intensity, glm::vec3 color, glm::vec3 direction)
{
	Light light{ Type::DIRECTIONAL_LIGHT, intensity, color };
	light.setDirection(direction);

	return light;
}

Light Light::pointLight(float intensity, glm::vec3 color, glm::vec3 position, float constantAttenuation, float linearAttenuation, float quadricAttenuation)
{
	Light light{ Type::POINT_LIGHT, intensity, color };
	light.setPosition(position);
	light.setConstantAttenuation(constantAttenuation);
	light.setLinearAttenuation(linearAttenuation);
	light.setQuadricAttenutation(quadricAttenuation);

	return light;
}

Light Light::spotLight(float intensity, glm::vec3 color, glm::vec3 position, glm::vec3 direction, float constantAttenuation, float linearAttenuation, float quadricAttenuation, float angle)
{
	Light light{ Type::SPOT_LIGHT, intensity, color };
	light.setPosition(position);
	light.setDirection(direction);
	light.setConstantAttenuation(constantAttenuation);
	light.setLinearAttenuation(linearAttenuation);
	light.setQuadricAttenutation(quadricAttenuation);
	light.setAngle(angle);

	return light;
}

Light::Light(Type type, float intensity, glm::vec3 color) : type{ type }, intensity{ intensity }, color{ color }, position{ 0, 0, 0 }, direction{ 0, 0, 1 }, constantAttenuation{ 0 }, linearAttenuation{ 0 }, quadricAttenuation{ 0 }, angle{ 0 }
{
}
