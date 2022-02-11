#version 330

in vec3 texCoords;

out vec4 finalColor;

uniform samplerCube cubeMap;

void main()
{
	finalColor = texture(cubeMap, texCoords);
}