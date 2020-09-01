#version 330

in vec2 texCoords;

out vec4 color;

void main()
{
	color = vec4(texCoords, 0, 1);
}