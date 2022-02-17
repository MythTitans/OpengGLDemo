#include "include/CubeMap.h"

#include <stb_image.h>

CubeMap::CubeMap(std::array<unsigned char*, 6> data, int width, int height)
{
    glGenTextures(1, &textureId);
    glBindTexture(GL_TEXTURE_CUBE_MAP, textureId);

    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

    for (int i = 0; i < data.size(); ++i)
    {
        glTexImage2D(GL_TEXTURE_CUBE_MAP_POSITIVE_X + i, 0, GL_RGB, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data[i]);
    }

    glBindTexture(GL_TEXTURE_CUBE_MAP, 0);
}

CubeMap::CubeMap(CubeMap&& reference) noexcept : textureId{reference.textureId}
{
    reference.textureId = 0;
}

CubeMap& CubeMap::operator=(CubeMap&& reference) noexcept
{
    if (this != &reference)
    {
        this->textureId = reference.textureId;
        reference.textureId = 0;
    }

    return *this;
}

CubeMap::~CubeMap()
{
    glDeleteTextures(1, &textureId);
}

std::unique_ptr<CubeMap> CubeMap::loadCubeMap(std::array<std::filesystem::path, 6> filePaths)
{
    int width;
    int height;
    int depth;

    std::array<unsigned char*, 6> data;
    for (int i = 0; i < filePaths.size(); ++i)
    {
        data[i] = stbi_load(filePaths[i].string().c_str(), &width, &height, &depth, 0);
        if (!data[i])
        {
            throw std::runtime_error("Failed to load texture " + filePaths[i].string());
        }
    }

    auto texture = std::make_unique<CubeMap>(data, width, height);

    for (int i = 0; i < data.size(); ++i)
    {
        stbi_image_free(data[i]);
    }

    return texture;
}

void CubeMap::use(unsigned int textureUnit) const
{
    glActiveTexture(GL_TEXTURE0 + textureUnit);
    glBindTexture(GL_TEXTURE_CUBE_MAP, textureId);
}

void CubeMap::unuse() const
{
    glBindTexture(GL_TEXTURE_CUBE_MAP, 0);
}
