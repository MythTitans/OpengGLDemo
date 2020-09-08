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
	void setTransform(const glm::mat4& transform) const;
	void setAmbientColor(const glm::vec3& ambientColor);
	void useMaterial(const Material* material) const override;
	void unuseMaterial(const Material* material) const override;

private:
	inline GLuint getUniformLocation(const std::string& name) const
	{
		return glGetUniformLocation(programId, name.c_str());
	}

private:
	GLuint uniformProjectionLocation;
	GLuint uniformViewLocation;
	GLuint uniformTransformLocation;
	GLuint uniformAmbientColorLocation;
	GLuint uniformDiffuseTextureLocation;
	glm::vec3 ambientColor;
};

