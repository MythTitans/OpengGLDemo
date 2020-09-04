#pragma once

#include <vector>
#include <memory>

#include <GL/glew.h>

class Material;
class Shader;

class Mesh
{
public:
	Mesh(const std::vector<GLfloat>& vertices, const std::vector<GLuint> indices, std::unique_ptr<Material> material);
	Mesh(const Mesh&) = delete;
	Mesh& operator=(const Mesh&) = delete;
	Mesh(Mesh&& reference) noexcept;
	Mesh& operator=(Mesh&& reference) noexcept;
	~Mesh();

	void render(const Shader& shader) const;

private:
	GLuint vao;
	GLuint vbo;
	GLuint ibo;
	GLsizei indexCount;
	std::unique_ptr<Material> material;
};

