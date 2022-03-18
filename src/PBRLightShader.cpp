#include "include/PBRLightShader.h"

#include <glm/gtc/type_ptr.hpp>

#include "include/Common.h"
#include "include/Material.h"
#include "include/RenderFeatures.h"

PBRLightShader::PBRLightShader()
    : LightShader{readFileContent("../../resources/shaders/pbr.frag")},
      dummyDiffuse{Texture::loadTexture("../../resources/textures/dummy.png")},
      dummyNormal{Texture::loadTexture("../../resources/textures/dummy_normal.png")},
      dummySpecularEnabled{Texture::loadTexture("../../resources/textures/dummy.png")},
      dummySpecularDisabled{Texture::loadTexture("../../resources/textures/dummy_black.png")}
{
    uniformMaterial.ambientColorLocation = getUniformLocation("material.ambientColor");
    uniformMaterial.diffuseColorLocation = getUniformLocation("material.diffuseColor");
    uniformMaterial.specularColorLocation = getUniformLocation("material.specularColor");
    uniformMaterial.specularPowerLocation = getUniformLocation("material.specularPower");
    uniformMaterial.diffuseMapLocation = getUniformLocation("material.diffuseMap");
    uniformMaterial.normalMapLocation = getUniformLocation("material.normalMap");
    uniformMaterial.specularMapLocation = getUniformLocation("material.specularMap");
    uniformMaterial.opacityLocation = getUniformLocation("material.opacity");
}

void PBRLightShader::useMaterial(const Material* material) const
{
    if (material)
    {
        glUniform3fv(uniformMaterial.ambientColorLocation, 1, glm::value_ptr(material->getAmbientColor()));
        glUniform3fv(uniformMaterial.diffuseColorLocation, 1, glm::value_ptr(material->getDiffuseColor()));
        glUniform3fv(uniformMaterial.specularColorLocation, 1, glm::value_ptr(material->getSpecularColor()));
        glUniform1f(uniformMaterial.specularPowerLocation, material->getSpecularPower());
        glUniform1f(uniformMaterial.opacityLocation, material->getOpacity());

        auto* texture = material->getAlbedoMap();
        if (texture && RenderFeatures::isFeatureEnabled(RenderFeature::DIFFUSE_MAP))
        {
            texture->use(0);
        }
        else
        {
            // TODO try to remove this an check if texture is provided in shader instead
            dummyDiffuse->use(0);
        }

        texture = material->getNormalMap();
        if (texture && RenderFeatures::isFeatureEnabled(RenderFeature::NORMAL_MAP))
        {
            texture->use(1);
        }
        else
        {
            dummyNormal->use(1);
        }

        texture = material->getMetallicMap();
        if (!RenderFeatures::isFeatureEnabled(RenderFeature::SPECULAR_MAP))
        {
            dummySpecularDisabled->use(2);
        }
        else if (texture)
        {
            texture->use(2);
        }
        else
        {
            dummySpecularEnabled->use(2);
        }

        glUniform1i(uniformMaterial.diffuseMapLocation, 0);
        glUniform1i(uniformMaterial.normalMapLocation, 1);
        glUniform1i(uniformMaterial.specularMapLocation, 2);
    }
}

void PBRLightShader::unuseMaterial(const Material* material) const
{
    if (material)
    {
        auto* texture = material->getAlbedoMap();
        if (texture)
        {
            texture->unuse();
        }

        texture = material->getNormalMap();
        if (texture)
        {
            texture->unuse();
        }

        texture = material->getMetallicMap();
        if (texture)
        {
            texture->unuse();
        }

        texture = material->getEmissiveMap();
        if (texture)
        {
            texture->unuse();
        }
    }
}
