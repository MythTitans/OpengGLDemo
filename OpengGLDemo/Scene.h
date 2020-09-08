#pragma once

#include <vector>

#include "Entity.h"

class Scene
{
public:
	Scene();

	void addEntity(Entity entity);
	void setAmbientColor(const glm::vec3& ambientColor);

	const glm::vec3& getAmbientColor() const;

	inline const std::vector<Entity>& getEntities() const
	{
		return entities;
	}

private:
	std::vector<Entity> entities;
	glm::vec3 ambientColor;
};
