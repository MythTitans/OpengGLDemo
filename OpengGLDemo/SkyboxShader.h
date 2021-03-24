#pragma once

#include "Shader.h"

#include "CubeMap.h"

class SkyboxShader : public Shader
{
public:
	SkyboxShader();
	void setProjection(const glm::mat4& projection) const;
	void setView(const glm::mat4& view) const;
	void useSkyboxMap(const CubeMap* skyboxMap) const;
	void unuseSkyboxMap(const CubeMap* skyboxMap) const;

private:
	GLuint uniformProjectionLocation;
	GLuint uniformViewLocation;
	GLuint uniformCubeMapLocation;
};
