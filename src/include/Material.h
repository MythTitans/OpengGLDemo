#pragma once

#include <glm/glm.hpp>

#include "Texture.h"

class Material
{
  public:
    Material(glm::vec3 ambientColor,
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
             float opacity);

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

    inline const glm::vec3& getEmissiveColor() const
    {
        return emissiveColor;
    }

    inline float getSpecularPower() const
    {
        return specularPower;
    }

    inline float getEmissivePower() const
    {
        return emissivePower;
    }

    inline const Texture* getAlbedoMap() const
    {
        return albedoMap.get();
    }

    inline const Texture* getNormalMap() const
    {
        return normalMap.get();
    }

    inline const Texture* getMetallicMap() const
    {
        return metallicMap.get();
    }

    inline const Texture* getRoughnessMap() const
    {
        return roughnessMap.get();
    }

    inline const Texture* getAOMap() const
    {
        return aoMap.get();
    }

    inline const Texture* getEmissiveMap() const
    {
        return emissiveMap.get();
    }

    inline float getOpacity() const
    {
        return opacity;
    }

    inline bool isTransparent() const
    {
        return opacity <= TRANSPARENCY_THRESHOLD;
    }

    inline bool isEmissive() const
    {
        return emissivePower >= EMISSIVITY_THRESHOLD;
    }

  private:
    glm::vec3 ambientColor;
    glm::vec3 diffuseColor;
    glm::vec3 specularColor;
    glm::vec3 emissiveColor;
    float specularPower;
    float emissivePower;
    std::unique_ptr<Texture> albedoMap;
    std::unique_ptr<Texture> normalMap;
    std::unique_ptr<Texture> metallicMap;
    std::unique_ptr<Texture> roughnessMap;
    std::unique_ptr<Texture> aoMap;
    std::unique_ptr<Texture> emissiveMap;
    float opacity;

    static constexpr float TRANSPARENCY_THRESHOLD = 0.99f;
    static constexpr float EMISSIVITY_THRESHOLD = 0.01f;
};
