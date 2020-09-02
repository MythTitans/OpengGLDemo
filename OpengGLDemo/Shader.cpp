#include "Shader.h"

#include <stdexcept>
#include <fstream>

#include <GL/GL.h>

Shader::Shader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode)
{
	programId = glCreateProgram();

	compile(vertexShaderCode, GL_VERTEX_SHADER);
	compile(fragmentShaderCode, GL_FRAGMENT_SHADER);

	link();
}

Shader::Shader(Shader&& reference) noexcept : programId{ reference.programId }
{
	reference.programId = 0;
}

Shader& Shader::operator=(Shader&& reference) noexcept
{
	if (this != &reference)
	{
		this->programId = reference.programId;
		reference.programId = 0;
	}

	return *this;
}

Shader::~Shader()
{
	glDeleteProgram(programId);
}

void Shader::use() const
{
	glUseProgram(programId);
}

void Shader::unuse() const
{
	glUseProgram(0);
}

void Shader::compile(const std::string& shaderCode, GLenum shaderType) const
{
	GLuint vertexShaderId = glCreateShader(shaderType);

	const GLchar* code[1];
	code[0] = shaderCode.c_str();

	GLint codeLength[1];
	codeLength[0] = (GLint) shaderCode.length();

	glShaderSource(vertexShaderId, 1, code, codeLength);
	glCompileShader(vertexShaderId);

	GLint compileResult;
	glGetShaderiv(vertexShaderId, GL_COMPILE_STATUS, &compileResult);

	if (!compileResult)
	{
		GLint compileLogLength;
		glGetShaderiv(vertexShaderId, GL_INFO_LOG_LENGTH, &compileLogLength);

		std::string compileLog;
		compileLog.resize(compileLogLength);

		glGetShaderInfoLog(vertexShaderId, compileLogLength, &compileLogLength, &compileLog[0]);

		throw std::runtime_error("Error compiling shader [" + compileLog + "]");
	}

	glAttachShader(programId, vertexShaderId);
}

void Shader::link() const
{
	glLinkProgram(programId);

	GLint linkResult;
	glGetProgramiv(programId, GL_LINK_STATUS, &linkResult);

	if (!linkResult)
	{
		GLint linkLogLength;
		glGetProgramiv(programId, GL_INFO_LOG_LENGTH, &linkLogLength);

		std::string linkLog;
		linkLog.resize(linkLogLength);

		glGetProgramInfoLog(programId, linkLogLength, &linkLogLength, &linkLog[0]);

		throw std::runtime_error("Error linking shader [" + linkLog + "]");
	}
}
