#include <iostream>
#include <stdexcept>
#include <chrono>
#include <thread>

#include "Common.h"
#include "Window.h"
#include "Camera.h"
#include "InputHandler.h"
#include "RenderSystem.h"
#include "Shader.h"
#include "Scene.h"
#include "Model.h"
#include "Light.h"

std::unique_ptr<Model> createGround(float size);

int main(void)
{
	try
	{
		Window window{ 1920, 1080, "OpenGL Tech Demo" };
		Camera camera{ { 0, 0, -10 }, 0, 0, glm::radians(60.0f), window.getAspectRatio(), 0.1f, 1000 };
		InputHandler inputHandler{ window, camera };
		RenderSystem renderer{ window };

		auto ground = createGround(50.0f);
		auto model = Model::loadModel("Models/model.obj");

		Entity entity1{ model.get() };
		entity1.setPitch(-90.0f);
		entity1.setPosition({ 0.0f, 3.0f, 0.0f });

		Entity entity2{ entity1 };
		entity2.setRoll(90.0f);
		entity2.setPosition({ 10.0f, 3.0f, 0.0f });
		entity2.setScale({ 0.5f, 0.5f, 0.5f });

		Entity groundEntity{ ground.get() };

		Scene scene;
		scene.setAmbientColor({ 0.1f, 0.1f, 0.1f });
		scene.addEntity(entity1);
		scene.addEntity(entity2);
		scene.addEntity(groundEntity);
		scene.addLight(Light::directionalLight(0.3f, { 1.0f, 0.89f, 0.8f }, { 1.0f, -1.0f, 1.0f }));
		scene.addLight(Light::pointLight(1.0f, { 0.0f, 1.0f, 0.0f }, { 5.0f, 3.0f, 0.0f }, 0.3f, 0.2f, 0.1f));

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
		halfSize, 0.0f, halfSize,		0.0f, 0.0f,								0.0f, 1.0f, 0.0f,
		halfSize, 0.0f, -halfSize,		0.25f * halfSize, 0.0f,					0.0f, 1.0f, 0.0f,
		-halfSize, 0.0f, -halfSize,		0.25f * halfSize, 0.25f * halfSize,		0.0f, 1.0f, 0.0f,
		-halfSize, 0.0f, halfSize,		0.0f, 0.25f * halfSize,					0.0f, 1.0f, 0.0f
	};

	std::vector<GLuint> indices{
		0, 1, 2,
		0, 2, 3
	};

	auto texture = Texture::loadTexture("Textures/dirt.png");
	auto plane = std::make_unique<Mesh>(std::move(vertices), std::move(indices), std::make_unique<Material>(texture.get()));

	std::vector<std::unique_ptr<Mesh>> meshes{ 1 };
	meshes[0] = std::move(plane);
	std::vector<std::unique_ptr<Texture>> textures{ 1 };
	textures[0] = std::move(texture);

	return std::make_unique<Model>(std::move(meshes), std::move(textures));
}