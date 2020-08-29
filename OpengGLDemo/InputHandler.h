#pragma once

#include <vector>

class Window;
class Camera;

class InputHandler
{
public:
	InputHandler(Window& window, Camera& camera);

	void processInputs();
	void handleKeyPressed(int keyCode);
	void handleKeyReleased(int keyCode);
	void handleMouseMoved(double x, double y);

private:
	Window& window;
	Camera& camera;
	std::vector<bool> inputsMap;
	double horizontalMouseDelta;
	double verticalMouseDelta;
	double lastMouseX;
	double lastMouseY;
	bool firstMouseMovement;

	static constexpr float CAMERA_MOVE_SPEED = 5.0;
	static constexpr float CAMERA_LOOK_SPEED = 0.1;
};

