#pragma once

#include <vector>
#include <memory>

#include <GL/glew.h>

class Material;
class Shader;

class Mesh
{
public:
	Mesh(const std::vector<GLfloat>& vertices, const std::vector<GLuint> indices, const Material* material);
	Mesh(const Mesh&) = delete;
	Mesh& operator=(const Mesh&) = delete;
	Mesh(Mesh&& reference) noexcept;
	Mesh& operator=(Mesh&& reference) noexcept;
	~Mesh();

	void render(const Shader& shader) const;

	static constexpr int VERTEX_COMPONENTS = 14;

private:
	GLuint vao;
	GLuint vbo;
	GLuint ibo;
	GLsizei indexCount;
	const Material* material;
};

