#pragma once

#include <vector>

#include <GL/glew.h>

class Mesh
{
public:
	Mesh(const std::vector<GLfloat>& vertices, const std::vector<GLuint> indices);
	Mesh(const Mesh&) = delete;
	Mesh& operator=(const Mesh&) = delete;
	Mesh(Mesh&& reference) noexcept;
	Mesh& operator=(Mesh&& reference) noexcept;
	~Mesh();

	void render() const;

private:
	GLuint vao;
	GLuint vbo;
	GLuint ibo;
	GLsizei indexCount;
};

