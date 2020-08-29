#pragma once

#include <memory>

class Window;
class Camera;
class Scene;
class ResourceLoader;
class Shader;

class RenderSystem
{
public:
	RenderSystem(const Window& window, const ResourceLoader& resourceLoader);

	void render(const Scene& scene, const Camera& camera) const;

private:
	std::unique_ptr<Shader> phongShader;
};

