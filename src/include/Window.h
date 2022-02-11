#pragma once

#include <string>

#include <GL/glew.h>
#include <GLFW/glfw3.h>

class InputHandler;

class Window
{
  public:
    Window(unsigned int width, unsigned int height, const std::string &title);
    ~Window();

    void registerInputHandler(InputHandler *inputHandler) const;
    bool handleEvents() const;
    void display() const;
    void close() const;

    inline int getFramebufferWidth() const
    {
        return framebufferWidth;
    }

    inline int getFramebufferHeight() const
    {
        return framebufferHeight;
    }

    inline float getAspectRatio() const
    {
        return (float)framebufferWidth / (float)framebufferHeight;
    }

  private:
    GLFWwindow *window;
    int framebufferWidth;
    int framebufferHeight;
};
