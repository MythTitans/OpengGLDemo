#pragma once

#include <memory>

#include "DirectionalShadowMapShader.h"
#include "EmissiveShader.h"
#include "Mesh.h"
#include "PhongLightShader.h"
#include "CombineEmissiveShader.h"
#include "RenderTarget.h"
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
    void renderColor(const Scene& scene, const Camera& camera) const;
    void renderEmissive(const Scene& scene, const Camera& camera) const;

    static std::unique_ptr<Mesh> createRenderSurface();

  private:
    int displayWidth;
    int displayHeight;
    std::unique_ptr<PhongLightShader> phongLightShader;
    std::unique_ptr<SkyboxShader> skyboxShader;
    std::unique_ptr<DirectionalShadowMapShader> directionalShadowMapShader;
    std::unique_ptr<EmissiveShader> emissiveShader;
    std::unique_ptr<CombineEmissiveShader> combineEmissiveShader;
    std::unique_ptr<RenderTarget> colorRT;
    std::unique_ptr<RenderTarget> emissiveRT;
    std::unique_ptr<Mesh> renderSurface;
};
