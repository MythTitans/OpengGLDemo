#include "include/PBRLightShader.h"

#include "include/Common.h"
#include "include/Material.h"

PBRLightShader::PBRLightShader()
    : LightShader{readFileContent("../../resources/shaders/pbr.frag")},
      dummyAlbedo{Texture::loadTexture("../../resources/textures/dummy.png")},
      dummyNormal{Texture::loadTexture("../../resources/textures/dummy_normal.png")},
      dummyMetallic{Texture::loadTexture("../../resources/textures/dummy.png")},
      dummyRoughness{Texture::loadTexture("../../resources/textures/dummy.png")},
      dummyAO{Texture::loadTexture("../../resources/textures/dummy.png")}
{
    uniformMaterial.albedoLocation = getUniformLocation("material.albedo");
    uniformMaterial.normalLocation = getUniformLocation("material.normal");
    uniformMaterial.metallicLocation = getUniformLocation("material.metallic");
    uniformMaterial.roughnessLocation = getUniformLocation("material.roughness");
    uniformMaterial.aoLocation = getUniformLocation("material.ao");
}

void PBRLightShader::useMaterial(const Material* material) const
{
    if (material)
    {
        auto* texture = material->getAlbedoMap();
        if (texture)
        {
            texture->use(0);
        }
        else
        {
            dummyAlbedo->use(0);
        }

        texture = material->getNormalMap();
        if (texture)
        {
            texture->use(1);
        }
        else
        {
            dummyNormal->use(1);
        }

        texture = material->getMetallicMap();
        if (texture)
        {
            texture->use(2);
        }
        else
        {
            dummyMetallic->use(2);
        }

        texture = material->getRoughnessMap();
        if (texture)
        {
            texture->use(3);
        }
        else
        {
            dummyRoughness->use(3);
        }

        texture = material->getAOMap();
        if (texture)
        {
            texture->use(4);
        }
        else
        {
            dummyAO->use(4);
        }

        glUniform1i(uniformMaterial.albedoLocation, 0);
        glUniform1i(uniformMaterial.normalLocation, 1);
        glUniform1i(uniformMaterial.metallicLocation, 2);
        glUniform1i(uniformMaterial.roughnessLocation, 3);
        glUniform1i(uniformMaterial.aoLocation, 4);
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

        texture = material->getRoughnessMap();
        if (texture)
        {
            texture->unuse();
        }

        texture = material->getAOMap();
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
