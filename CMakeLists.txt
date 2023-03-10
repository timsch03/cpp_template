cmake_minimum_required(VERSION 3.15)

# Setup vcpkg script with CMake (note: should be placed before project() call)
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake CACHE STRING "Vcpkg toolchain file")

project(GameApp)

set(CMAKE_CXX_STANDARD 17)

# vcpkg dependencies
find_package(OpenGL REQUIRED)
find_package(glfw3 CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)
find_package(GLEW REQUIRED)
find_package(FreeGLUT CONFIG REQUIRED)

include_directories(
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/res)
include_directories(
        PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

file(GLOB_RECURSE GameApp_SRC CONFIGURE_DEPENDS "src/*.h" "src/*.cpp" "include/*.h" "include/*.cpp")
add_executable(GameApp ${GameApp_SRC})

target_link_libraries(GameApp OpenGL::GL)
target_link_libraries(GameApp glfw)
target_link_libraries(GameApp glm::glm)
target_link_libraries(GameApp GLEW::GLEW)
target_link_libraries(GameApp $<IF:$<TARGET_EXISTS:FreeGLUT::freeglut>,FreeGLUT::freeglut,FreeGLUT::freeglut_static>)
