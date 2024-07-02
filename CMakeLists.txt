# **********************************************************
#      2024 : Arthur JEULIN
#      Copyright (c) Arthur JEULIN
#      Created by Arthur JEULIN on 07/05/2024.
# **********************************************************
cmake_minimum_required(VERSION 3.27.5)


# Indiquez à CMake d'utiliser les outils de vcpkg
if(UNIX)
endif()
if(WIN32)
  set(CMAKE_GENERATOR_TOOLSET "v142") 
  set(VCPKG_PLATFORM_TOOLSET v142)
endif()

set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake"
  CACHE STRING "Vcpkg toolchain file")

set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)

project(template
DESCRIPTION "Template Project Library "
LANGUAGES CXX
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

option(BUILD_SHARED_LIBS "Build shared libraries" OFF)


include_directories(include)
include_directories( "${PROJECT_SOURCE_DIR}/build/vcpkg_installed/x64-windows/include")

add_subdirectory(src)
add_subdirectory(example)
add_subdirectory(test)
add_subdirectory(rtmaps)