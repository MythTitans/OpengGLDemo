#pragma once

#include <memory>

#include <glm/glm.hpp>
#include <glm/gtc/constants.hpp>

class Model;

class Entity
{
  public:
    explicit Entity(std::shared_ptr<Model> model);

    glm::mat4 computeTransform() const;

    inline void setPosition(glm::vec3 position)
    {
        this->position = position;
    }

    inline void setYaw(float yaw)
    {
        this->yaw = yaw;
    }

    inline void setPitch(float pitch)
    {
        this->pitch = pitch;
    }

    inline void setRoll(float roll)
    {
        this->roll = roll;
    }

    inline void setScale(glm::vec3 scale)
    {
        this->scale = scale;
    }

    inline const glm::vec3 &getPosition() const
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

    inline float getRoll() const
    {
        return roll;
    }

    inline const glm::vec3 &getScale() const
    {
        return scale;
    }

    inline const Model *getModel() const
    {
        return model.get();
    }

  private:
    glm::vec3 position;
    float yaw;
    float pitch;
    float roll;
    glm::vec3 scale;
    std::shared_ptr<Model> model;

    static constexpr float TO_RADIANS = glm::pi<float>() / 180.0f;
};
