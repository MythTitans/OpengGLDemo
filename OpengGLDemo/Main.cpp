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

int main(void)
{
	try
	{
		Window window{ 1024, 768, "OpenGL Tech Demo" };
		Camera camera{ { 0, 0, -10 }, 0, 0, glm::radians(60.0f), window.getAspectRatio(), 0.1f, 1000 };
		InputHandler inputHandler{ window, camera };
		RenderSystem renderer{ window };

		Scene scene;

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