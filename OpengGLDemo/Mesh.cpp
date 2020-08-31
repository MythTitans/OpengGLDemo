#include "Mesh.h"

Mesh::Mesh(const std::vector<GLfloat>& vertices, const std::vector<GLuint> indices)
{
	indexCount = (GLsizei)indices.size();

	glGenVertexArrays(1, &vao);
	glBindVertexArray(vao);

	glGenBuffers(1, &vbo);
	glBindBuffer(GL_ARRAY_BUFFER, vbo);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices[0]) * vertices.size(), vertices.data(), GL_STATIC_DRAW);

	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(vertices[0]) * 3, 0);
	glEnableVertexAttribArray(0);

	glGenBuffers(1, &ibo);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ibo);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices[0]) * indexCount, indices.data(), GL_STATIC_DRAW);

	glBindVertexArray(0);
	glBindBuffer(GL_ARRAY_BUFFER, 0);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
}

Mesh::Mesh(Mesh&& reference) noexcept
{
	vao = reference.vao;
	vbo = reference.vbo;
	ibo = reference.ibo;
	indexCount = reference.indexCount;

	reference.vao = 0;
	reference.vbo = 0;
	reference.ibo = 0;
	reference.indexCount = 0;
}

Mesh& Mesh::operator=(Mesh&& reference) noexcept
{
	if (this != &reference)
	{
		vao = reference.vao;
		vbo = reference.vbo;
		ibo = reference.ibo;
		indexCount = reference.indexCount;

		reference.vao = 0;
		reference.vbo = 0;
		reference.ibo = 0;
		reference.indexCount = 0;
	}

	return *this;
}

Mesh::~Mesh()
{
	glDeleteBuffers(1, &ibo);
	glDeleteBuffers(1, &vbo);
	glDeleteVertexArrays(1, &vao);
}

void Mesh::render() const
{
	glBindVertexArray(vao);
	glDrawElements(GL_TRIANGLES, indexCount, GL_UNSIGNED_INT, nullptr);
	glBindVertexArray(0);
}