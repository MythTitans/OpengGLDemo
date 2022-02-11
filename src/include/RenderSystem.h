#pragma once

#include <memory>

#include "DirectionalShadowMapShader.h"
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
    void computeDirectionalShadowMaps(const Scene& scene) const;

  private:
    int displayWidth;
    int displayHeight;
    std::unique_ptr<PhongLightShader> phongLightShader;
    std::unique_ptr<SkyboxShader> skyboxShader;
    std::unique_ptr<DirectionalShadowMapShader> directionalShadowMapShader;
};
