#version 330

const int MAX_DIRECTIONAL_LIGHTS = 4;

in vec2 texCoords;
in vec3 normal;

out vec4 finalColor;

struct Light
{
	float intensity;
	vec3 color;
};

struct DirectionalLight
{
	Light base;
	vec3 direction;
};

uniform vec3 ambientColor;
uniform DirectionalLight directionalLights[MAX_DIRECTIONAL_LIGHTS];

uniform sampler2D diffuseTexture;

void main()
{
	vec3 lightColor = vec3(0.0, 0.0, 0.0);
	for(int i = 0; i < MAX_DIRECTIONAL_LIGHTS; ++i)
	{
		float factor = clamp(dot(-directionalLights[i].direction, normal), 0.0, 1.0);
		lightColor += factor * directionalLights[i].base.intensity * directionalLights[i].base.color;
	}

	vec3 color = (ambientColor + lightColor) * texture(diffuseTexture, texCoords).xyz;
	finalColor = vec4(color, 1);
}