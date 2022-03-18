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

int main()
{
    try
    {
        Window window{1920, 1080, "OpenGL Tech Demo"};
        Camera camera{{0, 0, -10}, 0, 0, glm::radians(60.0f), window.getAspectRatio(), 0.1f, 1000};
        RenderSystem renderer{window};
        InputHandler inputHandler{window, camera};

        std::shared_ptr<Model> ground = createGround(50.0f);

        auto golemModel = Model::loadModel("../../resources/models/golem/Earth_Golem_OBJ.obj");
        auto redSphereMat = std::make_shared<Material>(
            glm::vec3{}, glm::vec3{1, 0.25, 0.25}, glm::vec3{}, glm::vec3{1, 0.25, 0.25}, 0, 1, nullptr, nullptr, nullptr, nullptr, 1);
        auto redSphereModel = Model::loadModel("../../resources/models/sphere/sphere.obj", {redSphereMat, redSphereMat});
        auto blueSphereMat = std::make_shared<Material>(
            glm::vec3{}, glm::vec3{0.25, 0.25, 1}, glm::vec3{}, glm::vec3{0.25, 0.25, 1}, 0, 1, nullptr, nullptr, nullptr, nullptr, 1);
        auto blueSphereModel = Model::loadModel("../../resources/models/sphere/sphere.obj", {blueSphereMat, blueSphereMat});

        Entity golem{golemModel};
        golem.setYaw(180);

        Entity redSphere{redSphereModel};
        redSphere.setPosition({5, 3, 0});
        redSphere.setScale({0.25, 0.25, 0.25});

        Entity blueSphere{blueSphereModel};
        blueSphere.setPosition({-5, 3, 0});
        blueSphere.setScale({0.25, 0.25, 0.25});

        Entity groundEntity{ground};

        std::array<std::filesystem::path, 6> skyboxFaces = {"../../resources/textures/skybox/right.png",
                                                            "../../resources/textures/skybox/left.png",
                                                            "../../resources/textures/skybox/top.png",
                                                            "../../resources/textures/skybox/bottom.png",
                                                            "../../resources/textures/skybox/front.png",
                                                            "../../resources/textures/skybox/back.png"};

        Scene scene{CubeMap::loadCubeMap(skyboxFaces)};
        scene.setAmbientColor({0.1, 0.1, 0.1});
        scene.addEntity(&groundEntity);
        scene.addEntity(&golem);
        scene.addEntity(&redSphere);
        scene.addEntity(&blueSphere);
        scene.addLight(Light::directionalLight(1, {0.15, 0.3, 0.6}, {-10, 10, 10}, {1, -1, -1}));
        scene.addLight(Light::pointLight(2, {1, 0.25, 0.25}, {5, 3, 0}, 0.3, 0.2, 0.1));
        //        scene.addLight(Light::spotLight(1.0f, {1.0f, 0.0f, 1.0f}, {-5.0f, 3.0f, 0.0f}, {2.0f, -1.0f, 0.0f}, 0.1f, 0.1f, 0.1f, glm::radians(90.0f)));
        scene.addLight(Light::pointLight(2, {0.25, 0.25, 1}, {-5, 3, 0}, 0.3, 0.2, 0.1));

        auto previousTime = std::chrono::steady_clock::now();

        while (window.handleEvents())
        {
            inputHandler.processInputs();

            auto currentTime = std::chrono::steady_clock::now();

            float deltaTime = std::chrono::duration_cast<std::chrono::nanoseconds>(currentTime - previousTime).count() / 1000000000.0f;
            previousTime = currentTime;

            camera.update(deltaTime);

            golem.setYaw(golem.getYaw() + deltaTime * 20);

            renderer.render(scene, camera);

            window.display();
        }
    }
    catch (const std::runtime_error& error)
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
    auto material = std::make_unique<Material>(fullWhite, fullWhite, fullWhite, fullWhite, 100.0f, 0, std::move(texture), nullptr, nullptr, nullptr, 1.0f);
    auto plane = std::make_unique<Mesh>(std::move(vertices), std::move(indices), material.get());

    std::vector<std::shared_ptr<Mesh>> meshes{1};
    meshes[0] = std::move(plane);
    std::vector<std::shared_ptr<Material>> materials{1};
    materials[0] = std::move(material);

    return std::make_unique<Model>(std::move(meshes), std::move(materials));
}