#pragma once

#include <glm.hpp>

class Camera
{
public:
	Camera(glm::vec3 position, float yaw, float pitch, float fov, float aspectRatio, float near, float far);

	void moveForward(float amount);
	void moveBackward(float amount);
	void moveLeft(float amount);
	void moveRight(float amount);
	void lookVertical(float amount);
	void lookHorizontal(float amount);
	void setPosition(glm::vec3 position);
	void setYaw(float yaw);
	void setPitch(float pitch);
	void update(float deltaTime);

	inline glm::vec3 getPosition() const
	{
		return position;
	}

	inline float getYaw() const
	{
		return yaw;
	}

	inline float getPitch() const
	{
		return pitch;
	}

	inline const glm::mat4& getProjection() const
	{
		return projection;
	}

	inline const glm::mat4& getView() const
	{
		return view;
	}

	inline const glm::vec3& getFront() const
	{
		return front;
	}

	inline const glm::vec3& getLeft() const
	{
		return left;
	}

	inline const glm::vec3& getUp() const
	{
		return up;
	}

private:
	glm::vec3 position;
	float yaw;
	float pitch;
	glm::mat4 projection;
	glm::mat4 view;
	glm::vec3 front;
	glm::vec3 left;
	glm::vec3 up;
	glm::vec3 movement;
	float yawRotation;
	float pitchRotation;

	static constexpr glm::vec3 WORLD_UP = glm::vec3{ 0, 1, 0 };
	static constexpr float MAX_PITCH_ANGLE = 89.9f;
	static constexpr float MIN_PITCH_ANGLE = -89.9f;
};
