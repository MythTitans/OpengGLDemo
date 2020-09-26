#pragma once

#include <glm/glm.hpp>

#include "Texture.h"

class Material
{
public:
	Material(glm::vec3 ambientColor, glm::vec3 diffuseColor, glm::vec3 specularColor, std::unique_ptr<Texture> texture);

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

	inline const Texture* getTexture() const
	{
		return texture.get();
	}

private:
	glm::vec3 ambientColor;
	glm::vec3 diffuseColor;
	glm::vec3 specularColor;
	std::unique_ptr<Texture> texture;
};

