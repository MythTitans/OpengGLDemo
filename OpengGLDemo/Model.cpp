#include "Model.h"

#include "Mesh.h"

Model::Model()
{
	meshes.push_back(std::make_unique<Mesh>());
}

Model::~Model()
{
	meshes.clear();
}

void Model::render() const
{
	for (const auto& mesh : meshes)
	{
		mesh->render();
	}
}
