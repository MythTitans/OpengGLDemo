#include "include/Material.h"

Material::Material(glm::vec3 ambientColor,
                   glm::vec3 diffuseColor,
                   glm::vec3 specularColor,
                   glm::vec3 emissiveColor,
                   float specularPower,
                   float emissivePower,
                   std::unique_ptr<Texture> diffuseMap,
                   std::unique_ptr<Texture> normalMap,
                   std::unique_ptr<Texture> specularMap,
                   std::unique_ptr<Texture> emissiveMap,
                   float opacity)
    : ambientColor{ambientColor},
      diffuseColor{diffuseColor},
      specularColor{specularColor},
      emissiveColor{emissiveColor},
      specularPower{specularPower},
      emissivePower{emissivePower},
      diffuseMap{std::move(diffuseMap)},
      normalMap{std::move(normalMap)},
      specularMap{std::move(specularMap)},
      emissiveMap{std::move(emissiveMap)},
      opacity{opacity}
{
}
