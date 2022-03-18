#include "include/Material.h"

Material::Material(glm::vec3 ambientColor,
                   glm::vec3 diffuseColor,
                   glm::vec3 specularColor,
                   glm::vec3 emissiveColor,
                   float specularPower,
                   float emissivePower,
                   std::unique_ptr<Texture> albedoMap,
                   std::unique_ptr<Texture> normalMap,
                   std::unique_ptr<Texture> metallicMap,
                   std::unique_ptr<Texture> roughnessMap,
                   std::unique_ptr<Texture> aoMap,
                   std::unique_ptr<Texture> emissiveMap,
                   float opacity)
    : ambientColor{ambientColor},
      diffuseColor{diffuseColor},
      specularColor{specularColor},
      emissiveColor{emissiveColor},
      specularPower{specularPower},
      emissivePower{emissivePower},
      albedoMap{std::move(albedoMap)},
      normalMap{std::move(normalMap)},
      metallicMap{std::move(metallicMap)},
      roughnessMap{std::move(roughnessMap)},
      aoMap{std::move(aoMap)},
      emissiveMap{std::move(emissiveMap)},
      opacity{opacity}
{
}
