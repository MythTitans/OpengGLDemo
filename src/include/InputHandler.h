#pragma once

#include <vector>

class Window;
class Camera;
class RenderSystem;

class InputHandler
{
  public:
    InputHandler(Window& window, Camera& camera);

    void processInputs();
    void handleKeyPressed(int keyCode);
    void handleKeyReleased(int keyCode);
    void handleMouseMoved(double x, double y);

  private:
    void handleFeatureSelection(int keyCode) const;

  private:
    Window& window;
    Camera& camera;
    std::vector<bool> inputsMap;
    double horizontalMouseDelta;
    double verticalMouseDelta;
    double lastMouseX;
    double lastMouseY;
    bool firstMouseMovement;

    static constexpr float CAMERA_MOVE_SPEED = 5.0f;
    static constexpr float CAMERA_HORIZONTAL_LOOK_SPEED = 3.0f;
    static constexpr float CAMERA_VERTICAL_LOOK_SPEED = 1.5f;
};
