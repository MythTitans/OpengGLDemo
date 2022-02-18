#version 330

out vec4 finalColor;
in vec2 texCoords;

uniform sampler2D colorSource;
uniform sampler2D emissiveSource;

void main()
{
    finalColor = vec4(texture(colorSource, texCoords).xyz + texture(emissiveSource, texCoords).xyz, 1);
}