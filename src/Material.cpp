#include "include/Material.h"

Material::Material(glm::vec3 ambientColor,
                   glm::vec3 diffuseColor,
                   glm::vec3 specularColor,
                   float specularPower,
                   std::unique_ptr<Texture> diffuseMap,
                   std::unique_ptr<Texture> normalMap,
                   std::unique_ptr<Texture> specularMap,
                   float opacity)
    : ambientColor{ambientColor},
      diffuseColor{diffuseColor},
      specularColor{specularColor},
      specularPower{specularPower},
      diffuseMap{std::move(diffuseMap)},
      normalMap{std::move(normalMap)},
      specularMap{std::move(specularMap)},
      opacity{opacity}
{
}
