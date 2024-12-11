cmake_minimum_required(VERSION 3.14)

project(ASM_to_IR)

set(CMAKE_C_COMPILER "/usr/bin/clang++")


set(SOURSES ${CMAKE_SOURCE_DIR}/lib/GraphicalApp/SnakeSimple.c
            ${CMAKE_SOURCE_DIR}/lib/GraphicalApp/GraphicalApp.c
            ${CMAKE_SOURCE_DIR}/lib/ASM_to_IR/AsmReader.cpp
            ${CMAKE_SOURCE_DIR}/lib/ASM_to_IR/main.cpp
    )

find_package(LLVM REQUIRED)
if(NOT LLVM_FOUND)
  message(SEND_ERROR "Failed to find LLVM13")
  return()
else()
  include_directories(${LLVM_INCLUDE_DIR})
endif()

add_compile_options(-Wall -std=c++2a -fexceptions)


include_directories(${CMAKE_SOURCE_DIR}/include/ASM_to_IR
                    ${CMAKE_SOURCE_DIR}/include/GraphicalApp
                    ${LLVM_INCLUDE_DIR}) 

add_executable(
  execAsm

  ${SOURSES}
)
target_link_libraries(
  execAsm
  SDL2
  LLVM
)

