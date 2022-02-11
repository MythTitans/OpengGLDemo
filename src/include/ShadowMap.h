#pragma once

#include <GL/glew.h>

class ShadowMap
{
public:
	ShadowMap(unsigned int width, unsigned int height);
	ShadowMap(const ShadowMap&) = delete;
	ShadowMap& operator=(const ShadowMap&) = delete;
	ShadowMap(ShadowMap&& reference) noexcept;
	ShadowMap& operator=(ShadowMap&& reference) noexcept;
	~ShadowMap();

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
	GLuint textureId;
};
