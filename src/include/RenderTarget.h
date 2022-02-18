#pragma once

#include <array>

#include <GL/glew.h>

class RenderTarget
{
  public:
    RenderTarget(unsigned int width, unsigned int height);
    RenderTarget(const RenderTarget&) = delete;
    RenderTarget& operator=(const RenderTarget&) = delete;
    RenderTarget(RenderTarget&& reference) noexcept;
    RenderTarget& operator=(RenderTarget&& reference) noexcept;
    ~RenderTarget();

    inline unsigned int getWidth() const
    {
        return width;
    }

    inline unsigned int getHeight() const
    {
        return height;
    }

    void useTarget() const;
    void unuseTarget() const;
    void use(unsigned int textureUnit) const;
    void unuse() const;

  private:
    unsigned int width;
    unsigned int height;
    GLuint fbo;
    std::array<GLuint, 2> textureIds;
};
