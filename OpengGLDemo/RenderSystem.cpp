#include "RenderSystem.h"

#include <stdexcept>

#include <GL/glew.h>

#include "Window.h"
#include "Camera.h"
#include "Scene.h"

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

	glClearColor(0.3f, 0.2f, 0.6f, 1.0f);

	phongLightShader = std::make_unique<PhongLightShader>();
}

void RenderSystem::render(const Scene& scene, const Camera& camera) const
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	phongLightShader->use();
	phongLightShader->setProjection(camera.getProjection());
	phongLightShader->setView(camera.getView());
	scene.render();
	phongLightShader->unuse();
}
