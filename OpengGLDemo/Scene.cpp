#include "Scene.h"

#include "Model.h"
#include "Mesh.h"

Scene::Scene()
{
	auto model = Model::loadModel("Models/model.obj");
	models.push_back(std::move(model));
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
