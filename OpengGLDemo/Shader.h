#pragma once

#include <string>
#include <filesystem>

#include <gl/glew.h>

class Shader
{
public:
	Shader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode);
	Shader(const Shader&) = delete;
	Shader& operator=(const Shader&) = delete;
	Shader(Shader&& reference) noexcept;
	Shader& operator=(Shader&& reference) noexcept;
	virtual ~Shader();

	void use() const;
	void unuse() const;

protected:
	GLuint programId;

private:
	void compile(const std::string& shaderCode, GLenum shaderType) const;
	void link() const;
};
