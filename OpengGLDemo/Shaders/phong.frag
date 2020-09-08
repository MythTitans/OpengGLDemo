#version 330

in vec2 texCoords;
in vec3 normal;

out vec4 finalColor;

uniform vec3 ambientColor;

uniform sampler2D diffuseTexture;

void main()
{
	//vec3 color = ambientColor * texture(diffuseTexture, texCoords).xyz;
	//finalColor = vec4(color, 1);
	finalColor = vec4(normal * 0.5 + vec3(0.5, 0.5, 0.5), 1);
}