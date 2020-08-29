#pragma once

#include <GL/glew.h>

class Mesh
{
public:
	Mesh();
	~Mesh();

	void render() const;

private:
	GLuint vao;
	GLuint vbo;
	GLuint ibo;
	GLsizei indexCount;
};

