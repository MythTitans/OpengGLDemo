#include "include/Entity.h"

#include <glm/gtc/matrix_transform.hpp>

Entity::Entity(std::shared_ptr<Model> model) : position{0, 0, 0}, yaw{0}, pitch{0}, roll{0}, scale{1, 1, 1}, model{std::move(model)}
{
}

glm::mat4 Entity::computeTransform() const
{
    glm::mat4 transform{1};
    transform = glm::translate(transform, position);
    transform = glm::scale(transform, scale);
    transform = glm::rotate(transform, roll * TO_RADIANS, {0, 0, 1});
    transform = glm::rotate(transform, pitch * TO_RADIANS, {1, 0, 0});
    transform = glm::rotate(transform, yaw * TO_RADIANS, {0, 1, 0});

    return transform;
}
