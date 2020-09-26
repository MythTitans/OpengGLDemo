#version 330

const int MAX_DIRECTIONAL_LIGHTS = 4;
const int MAX_POINT_LIGHTS = 12;
const int MAX_SPOT_LIGHTS = 8;

in vec3 position;
in vec2 texCoords;
in vec3 normal;

out vec4 finalColor;

struct Material
{
	vec3 ambientColor;
	vec3 diffuseColor;
	vec3 specularColor;
};

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

struct SpotLight
{
	PointLight base;
	vec3 direction;
	float edge;
};

uniform vec3 ambientColor;

uniform DirectionalLight directionalLights[MAX_DIRECTIONAL_LIGHTS];
uniform PointLight pointLights[MAX_POINT_LIGHTS];
uniform SpotLight spotLights[MAX_SPOT_LIGHTS];
uniform int directionalLightCount;
uniform int pointLightCount;
uniform int spotLightCount;

uniform Material material;

uniform sampler2D diffuseTexture;

vec3 computeDirectionalLight(DirectionalLight light)
{
	float factor = clamp(dot(-light.direction, normal), 0.0, 1.0);
	return factor * light.base.intensity * light.base.color;
}

vec3 computeDirectionalLights()
{
	vec3 lightColor = vec3(0.0, 0.0, 0.0);

	for(int i = 0; i < directionalLightCount; ++i)
	{
		DirectionalLight light = directionalLights[i];
		lightColor += computeDirectionalLight(light);
	}

	return lightColor;
}

vec3 computePointLight(PointLight light)
{
	vec3 lightDirection = position - light.position;
	float distance = length(lightDirection);
	lightDirection = normalize(lightDirection);

	float attenuation = light.constantAttenuation + light.linearAttenuation * distance + light.quadricAttenuation * distance * distance;
	float factor = clamp(dot(-lightDirection, normal), 0.0, 1.0) / attenuation;
	return factor * light.base.intensity * light.base.color;
}

vec3 computePointLights()
{
	vec3 lightColor = vec3(0.0, 0.0, 0.0);

	for(int i = 0; i < pointLightCount; ++i)
	{
		PointLight light = pointLights[i];
		lightColor += computePointLight(light);
	}

	return lightColor;
}

vec3 computeSpotLight(SpotLight light)
{
	vec3 lightDirection = normalize(position - light.base.position);
	float factor = dot(lightDirection, light.direction);
	if(factor > light.edge)
	{
		float coneFactor = (factor - light.edge) / (1.0 - light.edge);
		return computePointLight(light.base) * coneFactor;
	}
	else
	{
		return vec3(0.0, 0.0, 0.0);
	}
}

vec3 computeSpotLights()
{
	vec3 lightColor = vec3(0.0, 0.0, 0.0);

	for(int i = 0; i < spotLightCount; ++i)
	{
		SpotLight light = spotLights[i];
		lightColor += computeSpotLight(light);
	}

	return lightColor;
}

void main()
{
	vec3 lightColor = computeDirectionalLights() + computePointLights() + computeSpotLights();

	vec3 color = (ambientColor * material.ambientColor + lightColor * material.diffuseColor) * texture(diffuseTexture, texCoords).xyz;
	finalColor = vec4(color, 1);
}