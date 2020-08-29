#pragma once

#include <string>
#include <filesystem>

#include <gl/glew.h>

class Shader
{
public:
	Shader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode);
	~Shader();

	void use() const;
	void unuse() const;

private:
	void compile(const std::string& shaderCode, GLenum shaderType) const;
	void link() const;

	GLuint programId;
};
