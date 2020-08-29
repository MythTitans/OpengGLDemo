#include "Scene.h"

#include "Model.h"

Scene::Scene()
{
	models.push_back(std::make_unique<Model>());
}

Scene::~Scene()
{
	models.clear();
}

void Scene::render() const
{
	for (const auto& model : models)
	{
		model->render();
	}
}
