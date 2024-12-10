cmake_minimum_required(VERSION 3.14)

project(LLVM-course)

set(CMAKE_VERBOSE_MAKEFILE on)

add_subdirectory(lib/GraphicalApp)
add_subdirectory(lib/LLVM_Pass)
add_subdirectory(lib/LLVM_IR)
add_subdirectory(lib/IR_Gen-Interpret)
add_subdirectory(lib/ASM_to_IR)
add_subdirectory(lib/Frontend)
add_subdirectory(Test)

