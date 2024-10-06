cmake_minimum_required(VERSION 3.14)

project(LLVM-course)

set(CMAKE_VERBOSE_MAKEFILE off)

add_subdirectory(lib/GraphicalApp)
add_subdirectory(lib/LLVM_Pass)
add_subdirectory(lib/LLVM_IR)

