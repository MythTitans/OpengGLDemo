#include "Texture.h"

#define STB_IMAGE_IMPLEMENTATION
#include <stb_image.h>

Texture::Texture(unsigned char* data, int width, int height, bool alpha)
{
	glGenTextures(1, &textureId);
	glBindTexture(GL_TEXTURE_2D, textureId);

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

	GLint format = GL_RGB;
	if (alpha)
	{
		format = GL_RGBA;
	}

	glTexImage2D(GL_TEXTURE_2D, 0, format, width, height, 0, format, GL_UNSIGNED_BYTE, data);

	glGenerateMipmap(GL_TEXTURE_2D);

	glBindTexture(GL_TEXTURE_2D, 0);
}

Texture::Texture(Texture&& reference) noexcept : textureId{ reference.textureId }
{
	reference.textureId = 0;
}

Texture& Texture::operator=(Texture&& reference) noexcept
{
	if (this != &reference)
	{
		this->textureId = reference.textureId;
		reference.textureId = 0;
	}

	return *this;
}

Texture::~Texture()
{
	glDeleteTextures(1, &textureId);
}

std::unique_ptr<Texture> Texture::loadTexture(std::filesystem::path filePath)
{
	int width;
	int height;
	int depth;

	auto* data = stbi_load(filePath.string().c_str(), &width, &height, &depth, 0);
	if (!data)
	{
		throw std::runtime_error("Failed to load texture " + filePath.string());
	}

	bool alpha = false;
	if (depth == 4)
	{
		alpha = true;
	}

	auto texture = std::make_unique<Texture>(data, width, height, alpha);

	stbi_image_free(data);

	return texture;
}

void Texture::use() const
{
	glBindTexture(GL_TEXTURE_2D, textureId);
}

void Texture::unuse() const
{
	glBindTexture(GL_TEXTURE_2D, 0);
}
