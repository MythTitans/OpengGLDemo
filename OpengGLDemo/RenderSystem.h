#pragma once

#include <memory>

#include "PhongLightShader.h"
#include "SkyboxShader.h"

class Window;
class Camera;
class Scene;

class RenderSystem
{
public:
	RenderSystem(const Window& window);

	void render(const Scene& scene, const Camera& camera) const;

private:
	std::unique_ptr<PhongLightShader> phongLightShader;
	std::unique_ptr<SkyboxShader> skyboxShader;
};

