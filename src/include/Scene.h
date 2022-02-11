#pragma once

#include <vector>

#include "Entity.h"
#include "Light.h"
#include "ShadowMap.h"
#include "Skybox.h"

class Scene
{
  public:
    Scene(std::unique_ptr<CubeMap> skyboxMap);

    void addEntity(Entity* entity);
    void addLight(Light light);
    void setAmbientColor(const glm::vec3& ambientColor);

    const glm::vec3& getAmbientColor() const;

    inline const std::vector<Entity*>& getEntities() const
    {
        return entities;
    }

    inline const std::vector<Light>& getDirectionalLights() const
    {
        return directionalLights;
    }

    inline const std::vector<Light>& getPointLights() const
    {
        return pointLights;
    }

    inline const std::vector<Light>& getSpotLights() const
    {
        return spotLights;
    }

    inline const std::vector<ShadowMap>& getDirectionalLightShadowMaps() const
    {
        return directionalLightShadowMaps;
    }

    inline const Skybox& getSkybox() const
    {
        return skybox;
    }

  private:
    std::vector<Entity*> entities;
    std::vector<Light> directionalLights;
    std::vector<Light> pointLights;
    std::vector<Light> spotLights;
    std::vector<ShadowMap> directionalLightShadowMaps;
    glm::vec3 ambientColor;
    Skybox skybox;
};
