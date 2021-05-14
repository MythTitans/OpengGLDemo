#include "Scene.h"

static const int SHADOW_MAP_SIZE = 2048;

Scene::Scene(std::unique_ptr<CubeMap> skyboxMap) : ambientColor{ 0, 0, 0 }, skybox{ std::move(skyboxMap) }
{
}

void Scene::addEntity(Entity entity)
{
	entities.push_back(entity);
}

void Scene::addLight(Light light)
{
	switch (light.getType())
	{
	case Light::Type::DIRECTIONAL_LIGHT:
		directionalLights.push_back(light);
		directionalLightShadowMaps.push_back(ShadowMap{ SHADOW_MAP_SIZE, SHADOW_MAP_SIZE });
		break;

	case Light::Type::POINT_LIGHT:
		pointLights.push_back(light);
		break;

	case Light::Type::SPOT_LIGHT:
		spotLights.push_back(light);
		break;
	}
}

void Scene::setAmbientColor(const glm::vec3& ambientColor)
{
	this->ambientColor = ambientColor;
}

const glm::vec3& Scene::getAmbientColor() const
{
	return ambientColor;
}
