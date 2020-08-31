#include "RenderSystem.h"

#include <stdexcept>

#include <GL/glew.h>
#include <glm/gtc/matrix_transform.hpp>

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

	// TODO model transform should be stored in an entity and applied to the shader
	glm::mat4 model(1);
	model = glm::rotate(model, -90.0f * 3.14159265359f / 180.0f, glm::vec3{ 1, 0, 0 });
	phongLightShader->setModel(model);

	scene.render();
	phongLightShader->unuse();
}
