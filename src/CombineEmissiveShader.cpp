#include "include/CombineEmissiveShader.h"

#include "include/Common.h"

CombineEmissiveShader::CombineEmissiveShader()
    : Shader{readFileContent("../../resources/shaders/combine_emissive.vert"), readFileContent("../../resources/shaders/combine_emissive.frag")},
      uniformEmissiveSourceLocation{getUniformLocation("emissiveSource")}
{
}

void CombineEmissiveShader::useRenderTargets(const RenderTarget& colorSource, const RenderTarget& emissiveSource) const
{
    colorSource.use(0);
    emissiveSource.use(1);

    glUniform1i(uniformColorSourceLocation, 0);
    glUniform1i(uniformEmissiveSourceLocation, 1);
}

void CombineEmissiveShader::unuseRenderTargets(const RenderTarget& colorSource, const RenderTarget& emissiveSource) const
{
    colorSource.unuse();
    emissiveSource.unuse();
}

