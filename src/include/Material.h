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
             std::unique_ptr<Texture> diffuseMap,
             std::unique_ptr<Texture> normalMap,
             std::unique_ptr<Texture> specularMap,
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

    inline const Texture* getDiffuseMap() const
    {
        return diffuseMap.get();
    }

    inline const Texture* getNormalMap() const
    {
        return normalMap.get();
    }

    inline const Texture* getSpecularMap() const
    {
        return specularMap.get();
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
    std::unique_ptr<Texture> diffuseMap;
    std::unique_ptr<Texture> normalMap;
    std::unique_ptr<Texture> specularMap;
    std::unique_ptr<Texture> emissiveMap;
    float opacity;

    static constexpr float TRANSPARENCY_THRESHOLD = 0.99f;
    static constexpr float EMISSIVITY_THRESHOLD = 0.01f;
};
