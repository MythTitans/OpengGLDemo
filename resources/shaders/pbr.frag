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
    sampler2D albedo;
    sampler2D normal;
    sampler2D metallic;
    sampler2D roughness;
    sampler2D ao;
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

uniform DirectionalLight directionalLights[MAX_DIRECTIONAL_LIGHTS];
uniform PointLight pointLights[MAX_POINT_LIGHTS];
uniform SpotLight spotLights[MAX_SPOT_LIGHTS];
uniform sampler2D directionalLightShadowMaps[MAX_DIRECTIONAL_LIGHTS];
uniform int directionalLightCount;
uniform int pointLightCount;
uniform int spotLightCount;

uniform Material material;

void main()
{
    vec3 color = texture(material.metallic, texCoords).xyz;
    finalColor = vec4(color, 1);
}