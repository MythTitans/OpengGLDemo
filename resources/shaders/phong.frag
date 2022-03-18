#version 330

const int MAX_DIRECTIONAL_LIGHTS = 4;
const int MAX_POINT_LIGHTS = 12;
const int MAX_SPOT_LIGHTS = 8;

in vec3 position;
in vec2 texCoords;
in vec3 normal;
in vec3 binormal;
in vec3 tangent;
in vec4 directionalLightSpacePos[4];

out vec4 finalColor;

struct Material
{
    vec3 ambientColor;
    vec3 diffuseColor;
    vec3 specularColor;
    float specularPower;
    sampler2D diffuseMap;
    sampler2D normalMap;
    sampler2D specularMap;
    float opacity;
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

uniform vec3 eyePosition;

uniform vec3 ambientColor;

uniform DirectionalLight directionalLights[MAX_DIRECTIONAL_LIGHTS];
uniform PointLight pointLights[MAX_POINT_LIGHTS];
uniform SpotLight spotLights[MAX_SPOT_LIGHTS];
uniform sampler2D directionalLightShadowMaps[MAX_DIRECTIONAL_LIGHTS];
uniform int directionalLightCount;
uniform int pointLightCount;
uniform int spotLightCount;

uniform Material material;

vec3 computeAmbientColor()
{
    return ambientColor * material.ambientColor;
}

vec3 computeLightColor(vec3 lightDirection, float lightIntensity, vec3 lightColor)
{
    mat3 matTBN = mat3(normalize(tangent), normalize(binormal), normalize(normal));
    vec3 extractedNormal = texture(material.normalMap, texCoords).xyz;
    extractedNormal = normalize(2 * (extractedNormal - 0.5));

    vec3 realNormal = matTBN * extractedNormal;
    float diffuseFactor = clamp(dot(-lightDirection, realNormal), 0.0, 1.0);
    float specularFactor = 0.0;
    if (diffuseFactor > 0.0)
    {
        vec3 eyeDirection = normalize(position - eyePosition);
        vec3 reflectedEyeDirection = reflect(eyeDirection, realNormal);
        specularFactor = clamp(dot(-lightDirection, reflectedEyeDirection), 0.0, 1.0);
        if (specularFactor > 0.0)
        {
            specularFactor = pow(specularFactor, material.specularPower) * texture(material.specularMap, texCoords).x;
        }
    }

    return lightIntensity * lightColor * (diffuseFactor * material.diffuseColor + specularFactor * material.specularColor);
}

float computeDirectionalShadowFactor(DirectionalLight light, sampler2D directionalLightShadowMap, vec4 directionalLightSpacePos)
{
    vec3 projectedCoords = directionalLightSpacePos.xyz / directionalLightSpacePos.w;
    projectedCoords = projectedCoords * 0.5 + 0.5;

    float currentDepth = projectedCoords.z;

    float bias = 0.001;

    float shadow = 0.0;
    vec2 texelSize = 1.0 / textureSize(directionalLightShadowMap, 0);
    for (int i = -1; i <= 1; ++i)
    {
        for (int j = -1; j <= 1; ++j)
        {
            float pcfDepth = texture(directionalLightShadowMap, projectedCoords.xy - vec2(i, j) * texelSize).r;
            shadow += currentDepth - bias > pcfDepth ? 1.0 : 0.0;
        }
    }

    shadow /= 9;

    if (currentDepth >= 1.0)
    {
        shadow = 0.0;
    }

    return shadow;
}

vec3 computeDirectionalLight(DirectionalLight light, sampler2D directionalLightShadowMap, vec4 directionalLightSpacePos)
{
    float shadowFactor = computeDirectionalShadowFactor(light, directionalLightShadowMap, directionalLightSpacePos);
    return (1 - shadowFactor) * computeLightColor(light.direction, light.base.intensity, light.base.color);
}

vec3 computeDirectionalLights()
{
    vec3 lightColor = vec3(0.0, 0.0, 0.0);

    for (int i = 0; i < directionalLightCount; ++i)
    {
        lightColor += computeDirectionalLight(directionalLights[i], directionalLightShadowMaps[i], directionalLightSpacePos[i]);
    }

    return lightColor;
}

vec3 computePointLight(PointLight light)
{
    vec3 lightDirection = position - light.position;
    float distance = length(lightDirection);
    lightDirection = normalize(lightDirection);

    float attenuation = light.constantAttenuation + light.linearAttenuation * distance + light.quadricAttenuation * distance * distance;
    return computeLightColor(lightDirection, light.base.intensity, light.base.color) / attenuation;
}

vec3 computePointLights()
{
    vec3 lightColor = vec3(0.0, 0.0, 0.0);

    for (int i = 0; i < pointLightCount; ++i)
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
    if (factor > light.edge)
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

    for (int i = 0; i < spotLightCount; ++i)
    {
        SpotLight light = spotLights[i];
        lightColor += computeSpotLight(light);
    }

    return lightColor;
}

void main()
{
    vec3 ambientColor = computeAmbientColor();
    vec3 lightColor = computeDirectionalLights() + computePointLights() + computeSpotLights();

    vec3 color = (ambientColor + lightColor) * texture(material.diffuseMap, texCoords).xyz;
    finalColor = vec4(color, material.opacity);
}