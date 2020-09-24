#include "RenderSystem.h"

#include <stdexcept>

#include <GL/glew.h>
#include <glm/gtc/matrix_transform.hpp>

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

	glClearColor(0.25f, 0.25f, 0.25f, 1);

	phongLightShader = std::make_unique<PhongLightShader>();
}

void RenderSystem::render(const Scene& scene, const Camera& camera) const
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	phongLightShader->use();
	phongLightShader->setProjection(camera.getProjection());
	phongLightShader->setView(camera.getView());
	phongLightShader->setAmbientColor(scene.getAmbientColor());
	phongLightShader->setDirectionalLights(scene.getDirectionalLights());
	phongLightShader->setPointLights(scene.getPointLights());
	phongLightShader->setSpotLights(scene.getSpotLights());

	for (const auto& entity : scene.getEntities())
	{
		phongLightShader->setTransform(entity.computeTransform());
		auto* model = entity.getModel();
		if (model)
		{
			model->render(*phongLightShader);
		}
	}

	phongLightShader->unuse();
}
