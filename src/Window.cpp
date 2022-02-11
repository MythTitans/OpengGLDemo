#include "include/Window.h"

#include <stdexcept>

#include "include/InputHandler.h"

void handleKeys(GLFWwindow* window, int key, int code, int action, int mode)
{
    InputHandler* inputHandler = static_cast<InputHandler*>(glfwGetWindowUserPointer(window));

    if (inputHandler)
    {
        if (action == GLFW_PRESS || action == GLFW_REPEAT)
        {
            inputHandler->handleKeyPressed(key);
        }
        else
        {
            inputHandler->handleKeyReleased(key);
        }
    }
}

void handleMouse(GLFWwindow* window, double x, double y)
{
    InputHandler* inputHandler = static_cast<InputHandler*>(glfwGetWindowUserPointer(window));

    if (inputHandler)
    {
        inputHandler->handleMouseMoved(x, y);
    }
}

Window::Window(unsigned int width, unsigned int height, const std::string& title)
{
    if (!glfwInit())
    {
        throw std::runtime_error("Cannot initialize Windowing system !");
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 5);

    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);

    window = glfwCreateWindow(width, height, title.c_str(), nullptr, nullptr);
    if (!window)
    {
        throw std::runtime_error("Cannot create window !");
    }

    glfwGetFramebufferSize(window, &framebufferWidth, &framebufferHeight);

    glfwMakeContextCurrent(window);

    glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_DISABLED);
    glfwSetInputMode(window, GLFW_RAW_MOUSE_MOTION, GLFW_TRUE);
    glfwSetKeyCallback(window, handleKeys);
    glfwSetCursorPosCallback(window, handleMouse);
}

Window::~Window()
{
    if (window != nullptr)
    {
        glfwDestroyWindow(window);
    }

    glfwTerminate();
}

void Window::registerInputHandler(InputHandler* inputHandler) const
{
    glfwSetWindowUserPointer(window, inputHandler);
}

bool Window::handleEvents() const
{
    glfwPollEvents();
    return !glfwWindowShouldClose(window);
}

void Window::display() const
{
    glfwSwapBuffers(window);
}

void Window::close() const
{
    glfwSetWindowShouldClose(window, GL_TRUE);
}
