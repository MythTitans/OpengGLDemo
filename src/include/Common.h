#pragma once

#include <filesystem>
#include <fstream>
#include <iostream>
#include <string>

#include <glm/glm.hpp>

inline void log_line(const std::string &log)
{
    std::cout << log << std::endl;
}

inline std::ostream &operator<<(std::ostream &stream, const glm::vec3 &vec3)
{
    return stream << "(" << vec3.x << " ; " << vec3.y << " ; " << vec3.z << ")";
}

inline std::string readFileContent(std::filesystem::path filePath)
{
    std::string fileContent;
    std::ifstream fileStream{filePath};

    if (!fileStream.is_open())
    {
        throw std::runtime_error{"Error reading file [" + filePath.string() + "]"};
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
