#ifndef OPENGL_DEMO_RENDERFEATURES_H
#define OPENGL_DEMO_RENDERFEATURES_H

#include <array>

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

class RenderFeatures
{
  public:
    static void enableFeature(RenderFeature feature, bool enable);
    static bool isFeatureEnabled(RenderFeature feature);

  private:
    RenderFeatures();

    static RenderFeatures& getInstance();

    std::array<bool, RENDER_FEATURES_COUNT> features;
    static RenderFeature* instance;
};

#endif // OPENGL_DEMO_RENDERFEATURES_H
