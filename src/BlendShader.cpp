#include "include/BlendShader.h"

#include "include/Common.h"

BlendShader::BlendShader()
    : Shader{readFileContent("../../resources/shaders/forward.vert"), readFileContent("../../resources/shaders/blend.frag")},
      uniformSourceALocation{getUniformLocation("sourceA")},
      uniformSourceBLocation{getUniformLocation("sourceB")}
{
}

void BlendShader::useSources(const RenderTarget& sourceA, const RenderTarget& sourceB) const
{
    sourceA.use(0);
    sourceB.use(1);

    glUniform1i(uniformSourceALocation, 0);
    glUniform1i(uniformSourceBLocation, 1);
}

void BlendShader::unuseSources(const RenderTarget& sourceA, const RenderTarget& sourceB) const
{
    sourceA.unuse();
    sourceB.unuse();
}

