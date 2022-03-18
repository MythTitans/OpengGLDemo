#version 330

layout (location = 0) in vec3 vertPosition;

uniform mat4 model;
uniform mat4 lightTransform;

void main()
{
    gl_Position = lightTransform * model * vec4(vertPosition, 1);
}