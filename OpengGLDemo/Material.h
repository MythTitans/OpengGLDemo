#pragma once

#include <glm/glm.hpp>

#include "Texture.h"

class Material
{
public:
	Material(glm::vec3 ambientColor, glm::vec3 diffuseColor, glm::vec3 specularColor, float specularPower, std::unique_ptr<Texture> diffuseMap, std::unique_ptr<Texture> normalMap, float opacity);

	inline const glm::vec3& getAmbientColor() const
	{
		return ambientColor;
	}

	inline const glm::vec3& getDiffuseColor() const
	{
		return diffuseColor;
	}

	inline const glm::vec3& getSpecularColor() const
	{
		return specularColor;
	}

	inline float getSpecularPower() const
	{
		return specularPower;
	}

	inline const Texture* getDiffuseMap() const
	{
		return diffuseMap.get();
	}

	inline const Texture* getNormalMap() const
	{
		return normalMap.get();
	}

	inline float getOpacity() const
	{
		return opacity;
	}

	inline bool isTransparent() const
	{
		return opacity <= TRANSPARENCY_THRESHOLD;
	}

private:
	glm::vec3 ambientColor;
	glm::vec3 diffuseColor;
	glm::vec3 specularColor;
	float specularPower;
	std::unique_ptr<Texture> diffuseMap;
	std::unique_ptr<Texture> normalMap;
	float opacity;

	static constexpr float TRANSPARENCY_THRESHOLD = 0.99f;
};

