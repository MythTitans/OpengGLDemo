#version 330

out vec4 finalColor;
in vec2 texCoords;

uniform sampler2D sourceA;
uniform sampler2D sourceB;

void main()
{
    finalColor = vec4(texture(sourceA, texCoords).xyz + texture(sourceB, texCoords).xyz, 1);
}