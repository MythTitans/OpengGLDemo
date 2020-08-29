#pragma once

#include <filesystem>
#include <memory>

class Shader;

class ResourceLoader
{
public:
	std::unique_ptr<Shader> loadShader(std::filesystem::path vertexShaderFile, std::filesystem::path fragmentShaderFile) const;
};

