#pragma once

#include "Texture.h"

class Material
{
public:
	Material(Texture* texture);

	inline const Texture* getTexture() const
	{
		return texture;
	}

private:
	Texture* texture;
};

