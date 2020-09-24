#pragma once

#include <array>

#include <glm/glm.hpp>
#include <gl/glew.h>

#include "Shader.h"
#include "Light.h"

class ResourceLoader;

struct UniformDirectionalLight
{
	GLuint intensityLocation;
	GLuint colorLocation;
	GLuint directionLocation;
};

struct UniformPointLight
{
	GLuint intensityLocation;
	GLuint colorLocation;
	GLuint positionLocation;
	GLuint constantAttenuationLocation;
	GLuint linearAttenuationLocation;
	GLuint quadricAttenuationLocation;
};

class PhongLightShader : public Shader
{
public:
	PhongLightShader();
	PhongLightShader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode) = delete;
	void setProjection(const glm::mat4& projection) const;
	void setView(const glm::mat4& view) const;
	void setTransform(const glm::mat4& transform) const;
	void setAmbientColor(const glm::vec3& ambientColor);
	void setDirectionalLights(const std::vector<Light>& directionalLights);
	void setPointLights(const std::vector<Light>& pointLights);
	void setSpotLights(const std::vector<Light>& spotLights);
	void useMaterial(const Material* material) const override;
	void unuseMaterial(const Material* material) const override;

private:
	inline GLuint getUniformLocation(const std::string& name) const
	{
		return glGetUniformLocation(programId, name.c_str());
	}

private:
	static constexpr int MAX_DIRECTIONAL_LIGHTS = 4;
	static constexpr int MAX_POINT_LIGHTS = 12;
	static constexpr int MAX_SPOT_LIGHTS = 8;

	GLuint uniformProjectionLocation;
	GLuint uniformViewLocation;
	GLuint uniformTransformLocation;
	GLuint uniformAmbientColorLocation;
	GLuint uniformDiffuseTextureLocation;
	std::array<UniformDirectionalLight, MAX_DIRECTIONAL_LIGHTS> uniformDirectionalLights;
	std::array<UniformPointLight, MAX_POINT_LIGHTS> uniformPointLights;
	GLuint uniformDirectionLightCount;
	GLuint uniformPointLightCount;

	glm::vec3 ambientColor;
};
