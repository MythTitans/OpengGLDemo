#pragma once

#include <vector>

#include <glm/glm.hpp>

class Light
{
public:
	enum class Type
	{
		DIRECTIONAL_LIGHT,
		POINT_LIGHT,
		SPOT_LIGHT
	};

	static Light directionalLight(float intensity, glm::vec3 color, glm::vec3 position, glm::vec3 direction);
	static Light pointLight(float intensity, glm::vec3 color, glm::vec3 position, float constantAttenuation, float linearAttenuation, float quadricAttenuation);
	static Light spotLight(float intensity, glm::vec3 color, glm::vec3 position, glm::vec3 direction, float constantAttenuation, float linearAttenuation, float quadricAttenuation, float angle);

	std::vector<glm::mat4> computeLightTransform() const;

	inline void setPosition(glm::vec3 position)
	{
		this->position = position;
	}

	inline void setDirection(glm::vec3 direction)
	{
		this->direction = glm::normalize(direction);
	}

	inline void setIntensity(float intensity)
	{
		this->intensity = intensity;
	}

	inline void setColor(glm::vec3 color)
	{
		this->color = color;
	}

	inline void setConstantAttenuation(float constantAttenuation)
	{
		this->constantAttenuation = constantAttenuation;
	}

	inline void setLinearAttenuation(float linearAttenuation)
	{
		this->linearAttenuation = linearAttenuation;
	}

	inline void setQuadricAttenutation(float quadricAttenuation)
	{
		this->quadricAttenuation = quadricAttenuation;
	}

	inline void setAngle(float angle)
	{
		this->angle = angle;
		this->edge = cosf(angle / 2);
	}

	inline Type getType() const
	{
		return type;
	}

	inline const glm::vec3& getPosition() const
	{
		return position;
	}

	inline const glm::vec3& getDirection() const
	{
		return direction;
	}

	inline float getIntensity() const
	{
		return intensity;
	}

	inline const glm::vec3& getColor() const
	{
		return color;
	}

	inline float getConstantAttenuation() const
	{
		return constantAttenuation;
	}

	inline float getLinearAttenuation() const
	{
		return linearAttenuation;
	}

	inline float getQuadricAttenuation() const
	{
		return quadricAttenuation;
	}

	inline float getAngle() const
	{
		return angle;
	}

	inline float getEdge() const
	{
		return edge;
	}

private:
	Light(Type type, float intensity, glm::vec3 color, glm::mat4 lightProjection);

private:
	Type type;
	glm::vec3 position;
	glm::vec3 direction;
	float intensity;
	glm::vec3 color;
	float constantAttenuation;
	float linearAttenuation;
	float quadricAttenuation;
	float angle;
	float edge;
	glm::mat4 lightProjection;
};
