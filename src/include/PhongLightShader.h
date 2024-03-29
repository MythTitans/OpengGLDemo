#pragma once

#include <array>

#include <GL/glew.h>
#include <glm/glm.hpp>

#include "Light.h"
#include "MaterialShader.h"
#include "ShadowMap.h"

struct UniformDirectionalLight
{
    GLuint intensityLocation;
    GLuint colorLocation;
    GLuint directionLocation;
};

struct UniformPointLight
{
    GLuint intensityLocation;
    GLuint colorLocation;
    GLuint positionLocation;
    GLuint constantAttenuationLocation;
    GLuint linearAttenuationLocation;
    GLuint quadricAttenuationLocation;
};

struct UniformSpotLight
{
    GLuint intensityLocation;
    GLuint colorLocation;
    GLuint positionLocation;
    GLuint directionLocation;
    GLuint constantAttenuationLocation;
    GLuint linearAttenuationLocation;
    GLuint quadricAttenuationLocation;
    GLuint edgeLocation;
};

struct UniformMaterial
{
    GLuint ambientColorLocation;
    GLuint diffuseColorLocation;
    GLuint specularColorLocation;
    GLuint specularPowerLocation;
    GLuint diffuseMapLocation;
    GLuint normalMapLocation;
    GLuint specularMapLocation;
    GLuint opacityLocation;
};

class PhongLightShader : public MaterialShader
{
  public:
    PhongLightShader();
    PhongLightShader(const std::string& vertexShaderCode, const std::string& fragmentShaderCode) = delete;
    void setProjection(const glm::mat4& projection) const;
    void setView(const glm::mat4& view) const;
    void setTransform(const glm::mat4& transform) const;
    void setEye(const glm::vec3& eye) const;
    void setAmbientColor(const glm::vec3& ambientColor) const;
    void setDirectionalLights(const std::vector<Light>& directionalLights, const std::vector<ShadowMap>& directionalLightShadowMaps) const;
    void setPointLights(const std::vector<Light>& pointLights) const;
    void setSpotLights(const std::vector<Light>& spotLights) const;
    void useMaterial(const Material* material) const override;
    void unuseMaterial(const Material* material) const override;

  private:
    static constexpr int MAX_DIRECTIONAL_LIGHTS = 4;
    static constexpr int MAX_POINT_LIGHTS = 12;
    static constexpr int MAX_SPOT_LIGHTS = 8;

    std::unique_ptr<Texture> dummyDiffuse;
    std::unique_ptr<Texture> dummyNormal;
    std::unique_ptr<Texture> dummySpecularEnabled;
    std::unique_ptr<Texture> dummySpecularDisabled;

    GLuint uniformProjectionLocation;
    GLuint uniformViewLocation;
    GLuint uniformTransformLocation;
    std::array<GLuint, MAX_DIRECTIONAL_LIGHTS> uniformDirectionalLightTransformLocations;
    GLuint uniformEyePositionLocation;
    GLuint uniformAmbientColorLocation;
    std::array<UniformDirectionalLight, MAX_DIRECTIONAL_LIGHTS> uniformDirectionalLights;
    std::array<UniformPointLight, MAX_POINT_LIGHTS> uniformPointLights;
    std::array<UniformSpotLight, MAX_SPOT_LIGHTS> uniformSpotLights;
    std::array<GLuint, MAX_DIRECTIONAL_LIGHTS> uniformDirectionalLightShadowMapLocations;
    GLuint uniformDirectionLightCount;
    GLuint uniformPointLightCount;
    GLuint uniformSpotLightCount;
    UniformMaterial uniformMaterial;
};
