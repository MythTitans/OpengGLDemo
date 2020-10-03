#include "RenderSystem.h"

#include <stdexcept>

#include <GL/glew.h>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/norm.hpp>

#include "Window.h"
#include "Camera.h"
#include "Scene.h"
#include "Entity.h"
#include "Model.h"

RenderSystem::RenderSystem(const Window& window)
{
	glewExperimental = GL_TRUE;

	if (glewInit() != GLEW_OK)
	{
		throw std::runtime_error("Error initializing GLEW !");
	}

	glViewport(0, 0, window.getFramebufferWidth(), window.getFramebufferHeight());

	glEnable(GL_DEPTH_TEST);
	glEnable(GL_CULL_FACE);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

	glClearColor(0.25f, 0.25f, 0.25f, 1);

	phongLightShader = std::make_unique<PhongLightShader>();
}

void RenderSystem::render(const Scene& scene, const Camera& camera) const
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	phongLightShader->use();
	phongLightShader->setProjection(camera.getProjection());
	phongLightShader->setView(camera.getView());
	phongLightShader->setEye(camera.getPosition());
	phongLightShader->setAmbientColor(scene.getAmbientColor());
	phongLightShader->setDirectionalLights(scene.getDirectionalLights());
	phongLightShader->setPointLights(scene.getPointLights());
	phongLightShader->setSpotLights(scene.getSpotLights());

	std::vector<const Entity*> transparentEntities;
	for (const auto& entity : scene.getEntities())
	{
		phongLightShader->setTransform(entity.computeTransform());
		auto* model = entity.getModel();
		if (model)
		{
			for (const auto* mesh : model->getOpaqueMeshes())
			{
				mesh->render(*phongLightShader);
			}

			if (model->hasTransparentMeshes())
			{
				transparentEntities.push_back(&entity);
			}
		}
	}

	auto frontToBack = [&camera](const Entity* entity1, const Entity* entity2) {
		auto distance1 = glm::length2(entity1->getPosition() - camera.getPosition());
		auto distance2 = glm::length2(entity2->getPosition() - camera.getPosition());
		return distance1 > distance2;
	};

	std::sort(transparentEntities.begin(), transparentEntities.end(), frontToBack);

	glEnable(GL_BLEND);

	for (const auto* entity : transparentEntities)
	{
		phongLightShader->setTransform(entity->computeTransform());
		auto* model = entity->getModel();
		if (model)
		{
			for (const auto* mesh : entity->getModel()->getTransparentMeshes())
			{
				mesh->render(*phongLightShader);
			}
		}
	}
	
	glDisable(GL_BLEND);

	phongLightShader->unuse();
}
