#version 330

layout (location = 0) in vec3 vertPosition;
layout (location = 1) in vec2 vertTexCoords;
layout (location = 2) in vec3 vertNormal;

out vec3 position;
out vec2 texCoords;
out vec3 normal;

uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;

void main()
{
	position = (model * vec4(vertPosition, 1)).xyz;
	texCoords = vertTexCoords;
	normal = mat3(transpose(inverse(model))) * vertNormal;
	gl_Position = projection * view * model * vec4(vertPosition, 1);
}