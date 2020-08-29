#pragma once

#include <vector>
#include <memory>

class Model;

class Scene
{
public:
	Scene();
	~Scene();

	void render() const;

private:
	std::vector<std::unique_ptr<Model>> models;
};
