#include "ResourceLoader.h"

#include <fstream>
#include <string>

#include "Shader.h"

std::string readFileContent(std::filesystem::path filePath)
{
	std::string fileContent;
	std::ifstream fileStream{ filePath };

	if (!fileStream.is_open())
	{
		throw std::runtime_error{ "Error reading file [" + filePath.string() + "]" };
	}

	std::string line;
	while (!fileStream.eof())
	{
		std::getline(fileStream, line);
		fileContent.append(line + '\n');
	}

	fileStream.close();

	return fileContent;
}

std::unique_ptr<Shader> ResourceLoader::loadShader(std::filesystem::path vertexShaderFile, std::filesystem::path fragmentShaderFile) const
{
	return std::make_unique<Shader>(readFileContent(vertexShaderFile), readFileContent(fragmentShaderFile));
}
