#pragma once

#include <array>
#include <filesystem>
#include <memory>

#include <GL/glew.h>

class CubeMap
{
  public:
    CubeMap(std::array<unsigned char*, 6> data, int width, int height);
    CubeMap(const CubeMap&) = delete;
    CubeMap& operator=(const CubeMap&) = delete;
    CubeMap(CubeMap&& reference) noexcept;
    CubeMap& operator=(CubeMap&& reference) noexcept;
    ~CubeMap();

    static std::unique_ptr<CubeMap> loadCubeMap(std::array<std::filesystem::path, 6> filePaths);

    void use(unsigned int textureUnit) const;
    void unuse() const;

  private:
    GLuint textureId;
};
