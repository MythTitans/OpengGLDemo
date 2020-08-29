#pragma once

#include <vector>
#include <memory>

class Mesh;

class Model
{
public:
	Model();
	~Model();

	void render() const;

private:
	std::vector<std::unique_ptr<Mesh>> meshes;
};

