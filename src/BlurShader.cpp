#include "include/BlurShader.h"

#include "include/Common.h"

BlurShader::BlurShader()
    : Shader{readFileContent("../../resources/shaders/forward.vert"), readFileContent("../../resources/shaders/blur.frag")},
      uniformSourceLocation{getUniformLocation("source")},
      uniformHorizontalLocation{getUniformLocation("horizontal")}
{
}

void BlurShader::useSource(const RenderTarget& source) const
{
    source.use(0);
    glUniform1i(uniformSourceLocation, 0);
}

void BlurShader::unuseSource(const RenderTarget& source) const
{
    source.unuse();
}

void BlurShader::setHorizontal(bool horizontal) const
{
    glUniform1i(uniformHorizontalLocation, horizontal);
}
