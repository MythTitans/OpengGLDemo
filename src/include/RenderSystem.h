#pragma once

#include <memory>

#include "BlendShader.h"
#include "DirectionalShadowMapShader.h"
#include "EmissiveShader.h"
#include "Mesh.h"
#include "PhongLightShader.h"
#include "RenderTarget.h"
#include "SkyboxShader.h"

class Window;
class Camera;
class Scene;

class GlewInitializer
{
  public:
    GlewInitializer();
};

class RenderSystem
{
  public:
    RenderSystem(const Window& window);

    void render(const Scene& scene, const Camera& camera) const;

  private:
    void computeDirectionalShadowMaps(const Scene& scene) const;
    void renderColor(const Scene& scene, const Camera& camera) const;
    void renderEmissive(const Scene& scene, const Camera& camera) const;

    static Mesh createRenderSurface();

  private:
    int displayWidth;
    int displayHeight;
    GlewInitializer glewInitializer;
    PhongLightShader phongLightShader;
    SkyboxShader skyboxShader;
    DirectionalShadowMapShader directionalShadowMapShader;
    EmissiveShader emissiveShader;
    BlendShader blendColorEmissiveShader;
    RenderTarget colorRT;
    RenderTarget emissiveRT;
    Mesh renderSurface;
};
