#include "include/InputHandler.h"

#include "include/Camera.h"
#include "include/RenderFeatures.h"
#include "include/Window.h"

InputHandler::InputHandler(Window& window, Camera& camera)
    : window{window}, camera{camera}, lastMouseX{0.0}, lastMouseY{0.0}, firstMouseMovement{true}, horizontalMouseDelta{0.0}, verticalMouseDelta{0.0}
{
    inputsMap.resize(512);
    window.registerInputHandler(this);
}

void InputHandler::processInputs()
{
    camera.lookVertical((float)(verticalMouseDelta * CAMERA_VERTICAL_LOOK_SPEED));
    camera.lookHorizontal((float)(horizontalMouseDelta * CAMERA_HORIZONTAL_LOOK_SPEED));

    verticalMouseDelta = 0.0;
    horizontalMouseDelta = 0.0;

    if (inputsMap[GLFW_KEY_W])
    {
        camera.moveForward(CAMERA_MOVE_SPEED);
    }

    if (inputsMap[GLFW_KEY_S])
    {
        camera.moveBackward(CAMERA_MOVE_SPEED);
    }

    if (inputsMap[GLFW_KEY_A])
    {
        camera.moveLeft(CAMERA_MOVE_SPEED);
    }

    if (inputsMap[GLFW_KEY_D])
    {
        camera.moveRight(CAMERA_MOVE_SPEED);
    }
}

void InputHandler::handleKeyPressed(int keyCode)
{
    if (keyCode == GLFW_KEY_ESCAPE)
    {
        window.close();
    }

    inputsMap[keyCode] = true;

    handleFeatureSelection(keyCode);
}

void InputHandler::handleKeyReleased(int keyCode)
{
    inputsMap[keyCode] = false;
}

void InputHandler::handleMouseMoved(double x, double y)
{
    if (firstMouseMovement)
    {
        lastMouseX = x;
        lastMouseY = y;
        firstMouseMovement = false;
    }

    horizontalMouseDelta = -(x - lastMouseX);
    verticalMouseDelta = -(y - lastMouseY);

    lastMouseX = x;
    lastMouseY = y;
}

void InputHandler::handleFeatureSelection(int keyCode) const
{
    auto toggleFeature = [](RenderFeature feature) { RenderFeatures::enableFeature(feature, !RenderFeatures::isFeatureEnabled(feature)); };

    if (keyCode == GLFW_KEY_1)
    {
        toggleFeature(RenderFeature::DIFFUSE_MAP);
    }

    if (keyCode == GLFW_KEY_2)
    {
        toggleFeature(RenderFeature::NORMAL_MAP);
    }

    if (keyCode == GLFW_KEY_3)
    {
        toggleFeature(RenderFeature::SPECULAR_MAP);
    }

    if (keyCode == GLFW_KEY_4)
    {
        toggleFeature(RenderFeature::EMISSIVE_MAP);
    }

    if (keyCode == GLFW_KEY_5)
    {
        toggleFeature(RenderFeature::SHADOW_MAP);
    }

    if (keyCode == GLFW_KEY_0)
    {
        toggleFeature(RenderFeature::SKY_MAP);
    }

    if (keyCode == GLFW_KEY_G)
    {
        toggleFeature(RenderFeature::GLOW_EFFECT);
    }
}
