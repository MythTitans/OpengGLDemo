#include "include/RenderFeatures.h"

RenderFeatures::RenderFeatures() : features{}
{
    features.fill(true);
}

void RenderFeatures::enableFeature(RenderFeature feature, bool enable)
{
    getInstance().features[static_cast<int>(feature)] = enable;
}

bool RenderFeatures::isFeatureEnabled(RenderFeature feature)
{
    return getInstance().features[static_cast<int>(feature)];
}

RenderFeatures& RenderFeatures::getInstance()
{
    static RenderFeatures instance;
    return instance;
}