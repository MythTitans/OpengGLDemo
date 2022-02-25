#pragma once

#include <memory>

#include "BlendShader.h"
#include "BlurShader.h"
#include "DirectionalShadowMapShader.h"
#include "EmissiveShader.h"
#include "Mesh.h"
#include "PhongLightShader.h"
#include "RenderTarget.h"
#include "SkyboxShader.h"

class Window;
class Camera;
class Scene;

enum class RenderFeature
{
    _FIRST_,
    DIFFUSE_MAP,
    NORMAL_MAP,
    SPECULAR_MAP,
    EMISSIVE_MAP,
    GLOW_EFFECT,
    _LAST_
};

constexpr int RENDER_FEATURES_COUNT = []
{
    int count = 0;
    for (int i = static_cast<int>(RenderFeature::_FIRST_); i <= static_cast<int>(RenderFeature::_LAST_); ++i)
    {
        ++count;
    }

    return count;
}();

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
    void setFeatureEnabled(RenderFeature feature, bool enabled);
    bool isFeatureEnabled(RenderFeature feature) const;

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
    SkyboxShader skyboxShader;
    DirectionalShadowMapShader directionalShadowMapShader;
    EmissiveShader emissiveShader;
    BlurShader blurShader;
    BlendShader blendShader;
    RenderTarget colorRT;
    RenderTarget emissiveRT;
    Mesh renderSurface;
    std::array<bool, RENDER_FEATURES_COUNT> features;
};
