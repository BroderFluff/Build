cmake_minimum_required(VERSION 3.22)

project(Build)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")

include(AddCXXCompilerFlag)
include(cppcheck)