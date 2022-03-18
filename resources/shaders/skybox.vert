#version 330

layout (location = 0) in vec3 vertPosition;

out vec3 texCoords;

uniform mat4 projection;
uniform mat4 view;

void main()
{
    texCoords = vertPosition;
    gl_Position = projection * mat4(mat3(view)) * vec4(vertPosition, 1);
}