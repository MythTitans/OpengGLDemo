#version 330

out vec4 finalColor;
in vec2 texCoords;

uniform sampler2D source;
uniform bool horizontal;

float weights[5] = float[] (0.227027, 0.1945946, 0.1216216, 0.054054, 0.016216);

void main()
{
    vec2 offset = 1.0 / textureSize(source, 0);
    vec3 result = texture(source, texCoords).xyz * weights[0];

    if (horizontal)
    {
        for (int i = 1; i < 5; ++i)
        {
            result += texture(source, texCoords + vec2(offset.x * i, 0)).xyz * weights[i];
            result += texture(source, texCoords - vec2(offset.x * i, 0)).xyz * weights[i];
        }
    }
    else
    {
        for (int i = 1; i < 5; ++i)
        {
            result += texture(source, texCoords + vec2(0, offset.y * i)).xyz * weights[i];
            result += texture(source, texCoords - vec2(0, offset.y * i)).xyz * weights[i];
        }
    }

    finalColor = vec4(result, 1);
}