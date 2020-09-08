#include "Scene.h"

Scene::Scene() : ambientColor{0, 0, 0}
{
}

void Scene::addEntity(Entity entity)
{
	entities.push_back(entity);
}

void Scene::setAmbientColor(const glm::vec3& ambientColor)
{
	this->ambientColor = ambientColor;
}

const glm::vec3& Scene::getAmbientColor() const
{
	return ambientColor;
}
