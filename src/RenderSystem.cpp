#include "include/RenderSystem.h"

#include <stdexcept>

#include <GL/glew.h>
#include <glm/gtx/norm.hpp>

#include "include/Camera.h"
#include "include/Entity.h"
#include "include/Model.h"
#include "include/RenderFeatures.h"
#include "include/Scene.h"
#include "include/Window.h"

RenderSystem::RenderSystem(const Window& window)
    : displayWidth{window.getFramebufferWidth()},
      displayHeight{window.getFramebufferHeight()},
      glewInitializer{},
      phongLightShader{},
      skyboxShader{},
      directionalShadowMapShader{},
      emissiveShader{},
      blurShader{},
      blendShader{},
      colorRT(displayWidth, displayHeight, true),
      emissiveRT(displayWidth, displayHeight, true),
      renderSurface{createRenderSurface()}
{
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);

    glClearColor(0, 0, 0, 1);
}

void RenderSystem::render(const Scene& scene, const Camera& camera) const
{
    computeDirectionalShadowMaps(scene);

    glViewport(0, 0, displayWidth, displayHeight);

    renderColor(scene, camera);
    renderEmissive(scene, camera);
    blurEmissive(10);

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    blendColorEmissive();
}

void RenderSystem::computeDirectionalShadowMaps(const Scene& scene) const
{
    directionalShadowMapShader.use();

    for (int i = 0; i < scene.getDirectionalLights().size(); ++i)
    {
        const auto& light = scene.getDirectionalLights()[i];
        const auto& shadowMap = scene.getDirectionalLightShadowMaps()[i];

        glViewport(0, 0, shadowMap.getWidth(), shadowMap.getHeight());

        shadowMap.useTarget();

        glClear(GL_DEPTH_BUFFER_BIT);

        if (RenderFeatures::isFeatureEnabled(RenderFeature::SHADOW_MAP))
        {
            directionalShadowMapShader.setLightTransform(light.computeLightTransform()[0]);

            for (const auto& entity : scene.getEntities())
            {
                directionalShadowMapShader.setTransform(entity->computeTransform());
                auto* model = entity->getModel();
                if (model)
                {
                    for (const auto* mesh : model->getOpaqueMeshes())
                    {
                        mesh->render();
                    }
                }
            }
        }

        shadowMap.unuseTarget();
    }

    directionalShadowMapShader.unuse();
}

void RenderSystem::renderColor(const Scene& scene, const Camera& camera) const
{
    colorRT.useTarget();

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    if (RenderFeatures::isFeatureEnabled(RenderFeature::SKY_MAP))
    {
        skyboxShader.use();
        skyboxShader.setProjection(camera.getProjection());
        skyboxShader.setView(camera.getView());

        scene.getSkybox().render(skyboxShader);
        skyboxShader.unuse();
    }

    phongLightShader.use();
    phongLightShader.setProjection(camera.getProjection());
    phongLightShader.setView(camera.getView());
    phongLightShader.setEye(camera.getPosition());
    phongLightShader.setAmbientColor(scene.getAmbientColor());
    phongLightShader.setDirectionalLights(scene.getDirectionalLights(), scene.getDirectionalLightShadowMaps());
    phongLightShader.setPointLights(scene.getPointLights());
    phongLightShader.setSpotLights(scene.getSpotLights());

    std::vector<const Entity*> transparentEntities;
    for (const auto& entity : scene.getEntities())
    {
        phongLightShader.setTransform(entity->computeTransform());
        auto* model = entity->getModel();
        if (model)
        {
            for (const auto* mesh : model->getOpaqueMeshes())
            {
                mesh->render(phongLightShader);
            }

            if (model->hasTransparentMeshes())
            {
                transparentEntities.push_back(entity);
            }
        }
    }

    auto frontToBack = [&camera](const Entity* entity1, const Entity* entity2)
    {
        auto distance1 = glm::length2(entity1->getPosition() - camera.getPosition());
        auto distance2 = glm::length2(entity2->getPosition() - camera.getPosition());
        return distance1 > distance2;
    };

    std::sort(transparentEntities.begin(), transparentEntities.end(), frontToBack);

    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    for (const auto* entity : transparentEntities)
    {
        phongLightShader.setTransform(entity->computeTransform());
        auto* model = entity->getModel();
        if (model)
        {
            for (const auto* mesh : entity->getModel()->getTransparentMeshes())
            {
                mesh->render(phongLightShader);
            }
        }
    }

    glDisable(GL_BLEND);

    colorRT.unuseTarget();

    phongLightShader.unuse();
}

void RenderSystem::renderEmissive(const Scene& scene, const Camera& camera) const
{
    emissiveRT.useTarget();

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    if (RenderFeatures::isFeatureEnabled(RenderFeature::EMISSIVE_MAP))
    {
        emissiveShader.use();
        emissiveShader.setProjection(camera.getProjection());
        emissiveShader.setView(camera.getView());

        for (const auto& entity : scene.getEntities())
        {
            emissiveShader.setTransform(entity->computeTransform());
            auto* model = entity->getModel();
            if (model)
            {
                for (const auto* mesh : model->getEmissiveMeshes())
                {
                    mesh->render(emissiveShader);
                }
            }
        }

        emissiveShader.unuse();
    }

    emissiveRT.unuseTarget();
}

void RenderSystem::blurEmissive(int iterations) const
{
    if (!RenderFeatures::isFeatureEnabled(RenderFeature::GLOW_EFFECT))
    {
        return;
    }

    const std::array<RenderTarget, 2> blurRT = {RenderTarget(displayWidth, displayHeight, false), RenderTarget(displayWidth, displayHeight, false)};
    const int twoPassIterations = 2 * iterations;

    const auto applyBlur = [this](const RenderTarget& source, const RenderTarget& target, bool horizontal)
    {
        blurShader.setHorizontal(horizontal);

        source.use(0);

        target.useTarget();
        renderSurface.render();
        target.unuseTarget();

        source.unuse();
    };

    blurShader.use();

    applyBlur(emissiveRT, blurRT[1], true);

    for (int i = 1; i < twoPassIterations; ++i)
    {
        const int indexRT = i % 2;
        const bool horizontal = indexRT == 0;

        const RenderTarget& source = blurRT[indexRT];
        const RenderTarget& target = blurRT[1 - indexRT];

        applyBlur(source, target, horizontal);
    }

    blurShader.unuse();

    blendShader.use();
    blendShader.useSources(emissiveRT, blurRT[0]);

    emissiveRT.useTarget();
    renderSurface.render();
    emissiveRT.unuseTarget();

    blendShader.unuseSources(emissiveRT, blurRT[0]);
    blendShader.unuse();
}

void RenderSystem::blendColorEmissive() const
{
    blendShader.use();
    blendShader.useSources(colorRT, emissiveRT);

    renderSurface.render();

    blendShader.unuseSources(colorRT, emissiveRT);
    blendShader.unuse();
}

Mesh RenderSystem::createRenderSurface()
{
    std::vector<GLfloat> vertices{
        // clang-format off
        -1, -1, 0,    -1, 0,   0, 0, 0,    0, 0, 0,    0, 0, 0,
        -1, 1, 0,    -1, 1,   0, 0, 0,    0, 0, 0,    0, 0, 0,
        1, 1, 0,    0, 1,   0, 0, 0,    0, 0, 0,    0, 0, 0,
        1, -1, 0,    0, 0,   0, 0, 0,    0, 0, 0,    0, 0, 0
        // clang-format on
    };

    std::vector<GLuint> indices{
        // clang-format off
        2, 1, 0,
        3, 2, 0
        // clang-format on
    };

    return Mesh{vertices, indices, nullptr};
}

GlewInitializer::GlewInitializer()
{
    glewExperimental = GL_TRUE;

    if (glewInit() != GLEW_OK)
    {
        throw std::runtime_error("Error initializing GLEW !");
    }
}
