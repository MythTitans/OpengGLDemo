#include "include/RenderTarget.h"

#include <stdexcept>

RenderTarget::RenderTarget(unsigned int width, unsigned int height) : width{width}, height{height}
{
    glGenTextures(2, textureIds.data());

    glBindTexture(GL_TEXTURE_2D, textureIds[0]);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, nullptr);

    glBindTexture(GL_TEXTURE_2D, textureIds[1]);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

    glTexImage2D(GL_TEXTURE_2D, 0, GL_DEPTH_COMPONENT, width, height, 0, GL_DEPTH_COMPONENT, GL_FLOAT, nullptr);

    glBindTexture(GL_TEXTURE_2D, 0);

    glGenFramebuffers(1, &fbo);

    glBindFramebuffer(GL_FRAMEBUFFER, fbo);

    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, textureIds[0], 0);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_TEXTURE_2D, textureIds[1], 0);

    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE)
    {
        throw std::runtime_error("Error initializing render target framebuffer !");
    }

    glBindFramebuffer(GL_FRAMEBUFFER, 0);
}

RenderTarget::RenderTarget(RenderTarget&& reference) noexcept
    : width{reference.width}, height{reference.height}, fbo{reference.fbo}, textureIds{reference.textureIds}
{
    reference.width = 0;
    reference.height = 0;
    reference.fbo = 0;
    reference.textureIds = {0, 0};
}

RenderTarget& RenderTarget::operator=(RenderTarget&& reference) noexcept
{
    if (this != &reference)
    {
        this->width = reference.width;
        this->height = reference.height;
        this->fbo = reference.fbo;
        this->textureIds = reference.textureIds;
        reference.width = 0;
        reference.height = 0;
        reference.fbo = 0;
        reference.textureIds = {0, 0};
    }

    return *this;
}

RenderTarget::~RenderTarget()
{
    glDeleteFramebuffers(1, &fbo);
    glDeleteTextures(2, textureIds.data());
}

void RenderTarget::useTarget() const
{
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
}

void RenderTarget::unuseTarget() const
{
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
}

void RenderTarget::use(unsigned int textureUnit) const
{
    glActiveTexture(GL_TEXTURE0 + textureUnit);
    glBindTexture(GL_TEXTURE_2D, textureIds[0]);
}

void RenderTarget::unuse() const
{
    glBindTexture(GL_TEXTURE_2D, 0);
}
