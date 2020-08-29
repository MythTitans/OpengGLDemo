#pragma once

#include <iostream>
#include <filesystem>
#include <fstream>
#include <string>

#include <glm.hpp>

inline std::ostream& operator<<(std::ostream& stream, const glm::vec3& vec3)
{
	return stream << "(" << vec3.x << " ; " << vec3.y << " ; " << vec3.z << ")";
}
