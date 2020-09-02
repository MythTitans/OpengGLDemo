#pragma once

#include <memory>
#include <filesystem>

#include <GL/glew.h>

class Texture
{
public:
	Texture(unsigned char* data, int width, int height, bool alpha);
	Texture(const Texture&) = delete;
	Texture& operator=(const Texture&) = delete;
	Texture(Texture&& reference) noexcept;
	Texture& operator=(Texture&& reference) noexcept;
	~Texture();

	static std::unique_ptr<Texture> loadTexture(std::filesystem::path filePath);

	void use() const;
	void unuse() const;

private:
	GLuint textureId;
};
