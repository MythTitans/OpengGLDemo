#version 330

const int MAX_DIRECTIONAL_LIGHTS = 4;
const int MAX_POINT_LIGHTS = 12;

in vec3 position;
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

struct PointLight
{
	Light base;
	vec3 position;
	float constantAttenuation;
	float linearAttenuation;
	float quadricAttenuation;
};

uniform vec3 ambientColor;
uniform DirectionalLight directionalLights[MAX_DIRECTIONAL_LIGHTS];
uniform PointLight pointLights[MAX_POINT_LIGHTS];
uniform int directionalLightCount;
uniform int pointLightCount;

uniform sampler2D diffuseTexture;

void main()
{
	vec3 lightColor = vec3(0.0, 0.0, 0.0);
	for(int i = 0; i < directionalLightCount; ++i)
	{
		DirectionalLight light = directionalLights[i];

		float factor = clamp(dot(-light.direction, normal), 0.0, 1.0);
		lightColor += factor * light.base.intensity * light.base.color;
	}

	for(int i = 0; i < pointLightCount; ++i)
	{
		PointLight light = pointLights[i];

		vec3 lightDirection = position - light.position;
		float distance = length(lightDirection);
		lightDirection = normalize(lightDirection);

		float attenuation = light.constantAttenuation + light.linearAttenuation * distance + light.quadricAttenuation * distance * distance;
		float factor = clamp(dot(-lightDirection, normal), 0.0, 1.0) / attenuation;
		lightColor += factor * light.base.intensity * light.base.color;
	}

	vec3 color = (ambientColor + lightColor) * texture(diffuseTexture, texCoords).xyz;
	finalColor = vec4(color, 1);
}