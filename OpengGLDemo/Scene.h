#pragma once

#include <vector>

#include "Entity.h"

class Scene
{
public:
	void addEntity(Entity entity);

	inline const std::vector<Entity>& getEntities() const
	{
		return entities;
	}

private:
	std::vector<Entity> entities;
};
