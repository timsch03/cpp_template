cmake_minimum_required(VERSION 3.15)

# Setup vcpkg script with CMake (note: should be placed before project() call)
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake CACHE STRING "Vcpkg toolchain file")

project(GameLib)

set(CMAKE_CXX_STANDARD 17)

# vcpkg dependencies
find_package(OpenGL REQUIRED)
find_package(glfw3 CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)
find_package(GLEW REQUIRED)
find_package(FreeGLUT CONFIG REQUIRED)

set(GameLib_SourceFiles
        include/GLSLProgram.h
        src/GLSLProgram.cpp)

add_library(GameLib ${GameLib_SourceFiles})

target_include_directories(GameLib
        PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

target_link_libraries(GameLib OpenGL::GL)
target_link_libraries(GameLib glfw)
target_link_libraries(GameLib glm::glm)
target_link_libraries(GameLib GLEW::GLEW)
target_link_libraries(GameLib $<IF:$<TARGET_EXISTS:FreeGLUT::freeglut>,FreeGLUT::freeglut,FreeGLUT::freeglut_static>)

add_executable(GameApp src/App.cpp)
target_link_libraries(GameApp GameLib)

target_include_directories(GameApp
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/res)