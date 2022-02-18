#include "include/EmissiveShader.h"

#include <glm/gtc/type_ptr.hpp>

#include "include/Common.h"
#include "include/Material.h"

EmissiveShader::EmissiveShader()
    : MaterialShader{readFileContent("../../resources/shaders/emissive.vert"), readFileContent("../../resources/shaders/emissive.frag")},
      dummyEmissive{Texture::loadTexture("../../resources/textures/dummy.png")},
      uniformProjectionLocation{getUniformLocation("projection")},
      uniformViewLocation{getUniformLocation("view")},
      uniformTransformLocation{getUniformLocation("model")}
{
    uniformMaterial.emissiveColorLocation = getUniformLocation("material.emissiveColor");
    uniformMaterial.emissivePowerLocation = getUniformLocation("material.emissivePower");
    uniformMaterial.emissiveMapLocation = getUniformLocation("material.emissiveMap");
}

void EmissiveShader::setProjection(const glm::mat4& projection) const
{
    glUniformMatrix4fv(uniformProjectionLocation, 1, GL_FALSE, glm::value_ptr(projection));
}

void EmissiveShader::setView(const glm::mat4& view) const
{
    glUniformMatrix4fv(uniformViewLocation, 1, GL_FALSE, glm::value_ptr(view));
}

void EmissiveShader::setTransform(const glm::mat4& transform) const
{
    glUniformMatrix4fv(uniformTransformLocation, 1, GL_FALSE, glm::value_ptr(transform));
}

void EmissiveShader::useMaterial(const Material* material) const
{
    if (material)
    {
        glUniform3fv(uniformMaterial.emissiveColorLocation, 1, glm::value_ptr(material->getEmissiveColor()));
        glUniform1f(uniformMaterial.emissivePowerLocation, material->getEmissivePower());

        auto* texture = material->getEmissiveMap();
        if (texture)
        {
            texture->use(0);
        }
        else
        {
            // TODO try to remove this an check if texture is provided in shader instead
            dummyEmissive->use(0);
        }

        glUniform1i(uniformMaterial.emissiveMapLocation, 0);
    }
}

void EmissiveShader::unuseMaterial(const Material* material) const
{
    if (material)
    {
        auto* texture = material->getEmissiveMap();
        if (texture)
        {
            texture->unuse();
        }
    }
}
