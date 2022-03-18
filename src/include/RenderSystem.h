#pragma once

#include <memory>

#include "BlendShader.h"
#include "BlurShader.h"
#include "DirectionalShadowMapShader.h"
#include "EmissiveShader.h"
#include "Mesh.h"
#include "PBRLightShader.h"
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
    explicit RenderSystem(const Window& window);

    void render(const Scene& scene, const Camera& camera) const;

  private:
    void computeDirectionalShadowMaps(const Scene& scene) const;
    void renderColor(const Scene& scene, const Camera& camera) const;
    void renderEmissive(const Scene& scene, const Camera& camera) const;
    void blurEmissive(int targetRT) const;
    void blendColorEmissive() const;

    static Mesh createRenderSurface();

  private:
    int displayWidth;
    int displayHeight;
    GlewInitializer glewInitializer;
    PhongLightShader phongLightShader;
    PBRLightShader pbrLightShader;
    SkyboxShader skyboxShader;
    DirectionalShadowMapShader directionalShadowMapShader;
    EmissiveShader emissiveShader;
    BlurShader blurShader;
    BlendShader blendShader;
    RenderTarget colorRT;
    RenderTarget emissiveRT;
    Mesh renderSurface;
};
