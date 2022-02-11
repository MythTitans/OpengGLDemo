#include "include/ShadowMap.h"

#include <array>
#include <stdexcept>

ShadowMap::ShadowMap(unsigned int width, unsigned int height) : width{width}, height{height}
{
    glGenTextures(1, &textureId);
    glBindTexture(GL_TEXTURE_2D, textureId);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_BORDER);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_BORDER);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

    std::array<GLfloat, 4> border = {1, 1, 1, 1};
    glTexParameterfv(GL_TEXTURE_2D, GL_TEXTURE_BORDER_COLOR, border.data());

    glTexImage2D(GL_TEXTURE_2D, 0, GL_DEPTH_COMPONENT, width, height, 0, GL_DEPTH_COMPONENT, GL_FLOAT, nullptr);

    glBindTexture(GL_TEXTURE_2D, 0);

    glGenFramebuffers(1, &fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);

    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_TEXTURE_2D, textureId, 0);

    glDrawBuffer(GL_NONE);
    glReadBuffer(GL_NONE);

    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE)
    {
        throw std::runtime_error("Error initializing shadow map framebuffer !");
    }

    glBindFramebuffer(GL_FRAMEBUFFER, 0);
}

ShadowMap::ShadowMap(ShadowMap &&reference) noexcept : width{reference.width}, height{reference.height}, fbo{reference.fbo}, textureId{reference.textureId}
{
    reference.width = 0;
    reference.height = 0;
    reference.fbo = 0;
    reference.textureId = 0;
}

ShadowMap &ShadowMap::operator=(ShadowMap &&reference) noexcept
{
    if (this != &reference)
    {
        this->width = reference.width;
        reference.width = 0;
        this->height = reference.height;
        reference.height = 0;
        this->fbo = reference.fbo;
        reference.fbo = 0;
        this->textureId = reference.textureId;
        reference.textureId = 0;
    }

    return *this;
}

ShadowMap::~ShadowMap()
{
    glDeleteFramebuffers(1, &fbo);
    glDeleteTextures(1, &textureId);
}

void ShadowMap::useTarget() const
{
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
}

void ShadowMap::unuseTarget() const
{
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
}

void ShadowMap::use(unsigned int textureUnit) const
{
    glActiveTexture(GL_TEXTURE0 + textureUnit);
    glBindTexture(GL_TEXTURE_2D, textureId);
}

void ShadowMap::unuse() const
{
    glBindTexture(GL_TEXTURE_2D, 0);
}
