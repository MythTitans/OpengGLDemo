#pragma once

#include <memory>
#include <vector>

#include <GL/glew.h>

#include "Material.h"
#include "MaterialShader.h"

class Shader;

class Mesh
{
  public:
    Mesh(const std::vector<GLfloat> &vertices, const std::vector<GLuint> indices, const Material *material);
    Mesh(const Mesh &) = delete;
    Mesh &operator=(const Mesh &) = delete;
    Mesh(Mesh &&reference) noexcept;
    Mesh &operator=(Mesh &&reference) noexcept;
    ~Mesh();

    void render() const;
    void render(const MaterialShader &shader) const;

    inline bool isTransparent() const
    {
        return material ? material->isTransparent() : false;
    }

    static constexpr int VERTEX_COMPONENTS = 14;

  private:
    GLuint vao;
    GLuint vbo;
    GLuint ibo;
    GLsizei indexCount;
    const Material *material;
};
