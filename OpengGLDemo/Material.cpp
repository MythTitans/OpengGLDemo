#include "Material.h"

Material::Material(glm::vec3 ambientColor, glm::vec3 diffuseColor, glm::vec3 specularColor, float specularPower, std::unique_ptr<Texture> texture) :
	ambientColor{ ambientColor },
	diffuseColor{ diffuseColor },
	specularColor{ specularColor },
	specularPower{ specularPower },
	texture{ std::move(texture) }
{
}
