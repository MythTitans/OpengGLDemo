#version 330

layout (location = 0) in vec3 position;

uniform mat4 projection;
uniform mat4 view;

void main()
{
	gl_Position = vec4(position, 1);
}