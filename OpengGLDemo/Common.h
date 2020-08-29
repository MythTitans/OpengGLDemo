#pragma once

#include <iostream>
#include <filesystem>
#include <fstream>
#include <string>

#include <glm/glm.hpp>

inline std::ostream& operator<<(std::ostream& stream, const glm::vec3& vec3)
{
	return stream << "(" << vec3.x << " ; " << vec3.y << " ; " << vec3.z << ")";
}

inline std::string readFileContent(std::filesystem::path filePath)
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
