#version 330

in vec2 texCoords;

out vec4 color;

uniform sampler2D diffuseTexture;

void main()
{
	color = texture(diffuseTexture, texCoords);
}