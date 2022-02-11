#include "include/Camera.h"

#include <glm/gtc/matrix_transform.hpp>

Camera::Camera(glm::vec3 position, float yaw, float pitch, float fov, float aspectRatio, float near, float far) :
	position{ position },
	yaw{ yaw },
	pitch{ pitch },
	movement{ 0, 0, 0 },
	yawRotation{ 0.0f },
	pitchRotation{ 0.0f }
{
	projection = glm::perspective(fov, aspectRatio, near, far);
	update(0.0f);
}

void Camera::moveForward(float speed)
{
	movement += front * speed;
}

void Camera::moveBackward(float speed)
{
	movement -= front * speed;
}

void Camera::moveLeft(float speed)
{
	movement += left * speed;
}

void Camera::moveRight(float speed)
{
	movement -= left * speed;
}

void Camera::lookVertical(float speed)
{
	pitchRotation += speed;
}

void Camera::lookHorizontal(float speed)
{
	yawRotation += speed;
}

void Camera::setPosition(glm::vec3 position)
{
	this->position = position;
}

void Camera::setYaw(float yaw)
{
	this->yaw = yaw;
}

void Camera::setPitch(float pitch)
{
	if (pitch > MAX_PITCH_ANGLE)
	{
		pitch = MAX_PITCH_ANGLE;
	}
	else if (pitch < MIN_PITCH_ANGLE)
	{
		pitch = MIN_PITCH_ANGLE;
	}

	this->pitch = pitch;
}

void Camera::update(float deltaTime)
{
	setPosition(position + movement * deltaTime);
	setPitch(pitch + pitchRotation);
	setYaw(yaw + yawRotation);

	movement = { 0, 0, 0 };
	pitchRotation = 0;
	yawRotation = 0;

	float projectedPitch = glm::cos(glm::radians(pitch));

	front.x = glm::sin(glm::radians(yaw)) * projectedPitch;
	front.y = glm::sin(glm::radians(pitch));
	front.z = glm::cos(glm::radians(yaw)) * projectedPitch;

	front = glm::normalize(front);
	left = glm::normalize(glm::cross(WORLD_UP, front));
	up = glm::normalize(glm::cross(front, left));

	view = glm::lookAt(position, position + front, up);
}
