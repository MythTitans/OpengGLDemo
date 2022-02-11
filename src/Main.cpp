#include <chrono>
#include <iostream>
#include <stdexcept>
#include <thread>

#define STB_IMAGE_IMPLEMENTATION
#include <stb_image.h>

#include "include/Camera.h"
#include "include/Common.h"
#include "include/CubeMap.h"
#include "include/InputHandler.h"
#include "include/Light.h"
#include "include/Model.h"
#include "include/RenderSystem.h"
#include "include/Scene.h"
#include "include/Shader.h"
#include "include/Window.h"

std::unique_ptr<Model> createGround(float size);

int main(void)
{
    try
    {
        Window window{1920, 1080, "OpenGL Tech Demo"};
        Camera camera{{0, 0, -10}, 0, 0, glm::radians(60.0f), window.getAspectRatio(), 0.1f, 1000};
        InputHandler inputHandler{window, camera};
        RenderSystem renderer{window};

        auto ground = createGround(50.0f);
        auto ground2 = createGround(10.0f);

        Entity groundEntity{ground.get()};
        Entity groundEntity2{ground2.get()};
        groundEntity2.setPosition({0, 5, 0});

        std::array<std::filesystem::path, 6> skyboxFaces = {"../../resources/textures/dummy.png",
                                                            "../../resources/textures/dummy.png",
                                                            "../../resources/textures/dummy.png",
                                                            "../../resources/textures/dummy.png",
                                                            "../../resources/textures/dummy.png",
                                                            "../../resources/textures/dummy.png"};

        Scene scene{CubeMap::loadCubeMap(skyboxFaces)};
        scene.setAmbientColor({0.1f, 0.1f, 0.1f});
        scene.addEntity(groundEntity);
        scene.addEntity(groundEntity2);
        scene.addLight(Light::directionalLight(1.0f, {1.0f, 1.0f, 1.0f}, {-10.0f, 10.0f, -10.0f}, {1.0f, -1.0f, 1.0f}));
        scene.addLight(Light::pointLight(2.0f, {1.0f, 0.25f, 0.25f}, {5.0f, 3.0f, 0.0f}, 0.3f, 0.2f, 0.1f));
        // scene.addLight(Light::spotLight(1.0f, { 1.0f, 0.0f, 1.0f }, { -5.0f, 3.0f, 0.0f }, { 2.0f, -1.0f, 0.0f }, 0.1f, 0.1f, 0.1f, glm::radians(90.0f)));
        scene.addLight(Light::pointLight(2.0f, {0.25f, 0.25f, 1.0f}, {-5.0f, 3.0f, 0.0f}, 0.3f, 0.2f, 0.1f));

        auto previousTime = std::chrono::steady_clock::now();

        while (window.handleEvents())
        {
            inputHandler.processInputs();

            auto currentTime = std::chrono::steady_clock::now();

            float deltaTime = std::chrono::duration_cast<std::chrono::nanoseconds>(currentTime - previousTime).count() / 1000000000.0f;
            previousTime = currentTime;

            camera.update(deltaTime);

            renderer.render(scene, camera);

            window.display();
        }
    }
    catch (const std::runtime_error &error)
    {
        std::cout << error.what();
        return -1;
    }

    return 0;
}

std::unique_ptr<Model> createGround(float size)
{
    float halfSize = size / 2;
    float quarterSize = halfSize / 2;
    std::vector<GLfloat> vertices{
        // clang-format off
            halfSize, 0.0f, halfSize,	0.0f, 0.0f,				0.0f, 1.0f, 0.0f,	0.0f, 0.0f, 1.0f,	1.0f, 0.0f, 0.0f,
            halfSize, 0.0f, -halfSize,	0.25f * halfSize, 0.0f,			0.0f, 1.0f, 0.0f,	0.0f, 0.0f, 1.0f,	1.0f, 0.0f, 0.0f,
            -halfSize, 0.0f, -halfSize,	0.25f * halfSize, 0.25f * halfSize,	0.0f, 1.0f, 0.0f,	0.0f, 0.0f, 1.0f,	1.0f, 0.0f, 0.0f,
            -halfSize, 0.0f, halfSize,	0.0f, 0.25f * halfSize,			0.0f, 1.0f, 0.0f,	0.0f, 0.0f, 1.0f,	1.0f, 0.0f, 0.0f
        // clang-format on
    };

    std::vector<GLuint> indices{
        // clang-format off
        0, 1, 2,
        0, 2, 3
        // clang-format on
    };

    glm::vec3 fullWhite{1.0f, 1.0f, 1.0f};

    auto texture = Texture::loadTexture("../../resources/textures/dirt.png");
    auto material = std::make_unique<Material>(fullWhite, fullWhite, fullWhite, 100.0f, std::move(texture), nullptr, nullptr, 1.0f);
    auto plane = std::make_unique<Mesh>(std::move(vertices), std::move(indices), material.get());

    std::vector<std::unique_ptr<Mesh>> meshes{1};
    meshes[0] = std::move(plane);
    std::vector<std::unique_ptr<Material>> materials{1};
    materials[0] = std::move(material);

    return std::make_unique<Model>(std::move(meshes), std::move(materials));
}