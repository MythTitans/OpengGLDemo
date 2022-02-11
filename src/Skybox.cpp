#include "include/Skybox.h"

#include <GL/glew.h>

const std::vector<GLfloat> vertices = {
	// Up
	1, 1, 1,		0, 0,		0, 0, 0,		0, 0, 0,		0, 0, 0,
	-1, 1, 1,		0, 0,		0, 0, 0,		0, 0, 0,		0, 0, 0,
	- 1, 1, -1,		0, 0,		0, 0, 0,		0, 0, 0,		0, 0, 0,
	1, 1, -1,		0, 0,		0, 0, 0,		0, 0, 0,		0, 0, 0,
	// Down
	1, -1, 1,		0, 0,		0, 0, 0,		0, 0, 0,		0, 0, 0,
	-1, -1, 1,		0, 0,		0, 0, 0,		0, 0, 0,		0, 0, 0,
	-1, -1, -1,		0, 0,		0, 0, 0,		0, 0, 0,		0, 0, 0,
	1, -1, -1,		0, 0,		0, 0, 0,		0, 0, 0,		0, 0, 0
};

const std::vector<GLuint> indices = {
	// Top
	0, 1, 2,
	0, 2, 3,

	// Bottom
	6, 5, 4,
	7, 6, 4,

	// Front
	3, 2, 6,
	3, 6, 7,

	// Back
	5, 1, 0,
	4, 5, 0,

	// Left
	6, 2, 1,
	5, 6, 1,

	// Right
	0, 3, 7,
	0, 7, 4
};

Skybox::Skybox(std::unique_ptr<CubeMap> skyboxMap) : skyboxMap{ std::move(skyboxMap) }, skyboxMesh{ vertices, indices, nullptr }
{
}

void Skybox::render(const SkyboxShader& skyboxShader) const
{
	glDepthMask(GL_FALSE);
	skyboxShader.useSkyboxMap(skyboxMap.get());

	skyboxMesh.render();

	skyboxShader.unuseSkyboxMap(skyboxMap.get());
	glDepthMask(GL_TRUE);
}