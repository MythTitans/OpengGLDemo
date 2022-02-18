#version 330

layout (location = 0) in vec3 vertPosition;
layout (location = 1) in vec2 vertTexCoords;

out vec2 texCoords;

void main()
{
    texCoords = vertTexCoords;

    gl_Position = vec4(vertPosition, 1);
}