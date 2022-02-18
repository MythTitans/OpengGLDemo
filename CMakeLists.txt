cmake_minimum_required(VERSION 3.16.3)
project(opengl_demo)

if (EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    conan_basic_setup()
else ()
    message(WARNING "The file conanbuildinfo.cmake doesn't exist, you have to run conan install first")
endif ()

set(CMAKE_CXX_STANDARD 17)

add_executable(opengl_demo
        src/Camera.cpp
        src/CombineEmissiveShader.cpp
        src/CubeMap.cpp
        src/DirectionalShadowMapShader.cpp
        src/EmissiveShader.cpp
        src/Entity.cpp
        src/InputHandler.cpp
        src/Light.cpp
        src/Main.cpp
        src/Material.cpp
        src/MaterialShader.cpp
        src/Mesh.cpp
        src/Model.cpp
        src/PhongLightShader.cpp
        src/RenderSystem.cpp
        src/RenderTarget.cpp
        src/Scene.cpp
        src/Shader.cpp
        src/ShadowMap.cpp
        src/Skybox.cpp
        src/SkyboxShader.cpp
        src/Texture.cpp
        src/Window.cpp)

target_link_libraries(opengl_demo PRIVATE ${CONAN_LIBS})