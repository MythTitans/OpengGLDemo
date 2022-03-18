#version 330

in vec3 position;
in vec2 texCoords;

out vec4 finalColor;

struct Material
{
    vec3 emissiveColor;
    float emissivePower;
    sampler2D emissiveMap;
};

uniform Material material;

void main()
{
    vec3 color = material.emissivePower * material.emissiveColor * texture(material.emissiveMap, texCoords).xyz;
    finalColor = vec4(color, 1);
}