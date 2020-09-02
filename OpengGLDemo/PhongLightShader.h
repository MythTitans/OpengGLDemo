#pragma once

#include <glm/glm.hpp>
#include <gl/glew.h>

#include "Shader.h"

class ResourceLoader;

class PhongLightShader : public Shader
{
public:
	PhongLightShader();
	PhongLightShader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode) = delete;
	void setProjection(const glm::mat4& projection) const;
	void setView(const glm::mat4& view) const;
	void setModel(const glm::mat4& model) const;
	void setDiffuseTexture(int textureUnit) const;

private:
	inline GLuint getUniformLocation(const std::string& name) const
	{
		return glGetUniformLocation(programId, name.c_str());
	}

private:
	GLuint uniformProjectionLocation;
	GLuint uniformViewLocation;
	GLuint uniformModelLocation;
	GLuint uniformDiffuseTextureLocation;
};

