cmake_minimum_required(VERSION 3.14)

project(IR_Gen-Interpret)

set(CMAKE_C_COMPILER "/usr/bin/clang++")


set(SOURSES ${CMAKE_SOURCE_DIR}/lib/IR_Gen-Interpret/GenInterpretIR.cpp
            ${CMAKE_SOURCE_DIR}/lib/GraphicalApp/GraphicalApp.c
    )


find_package(LLVM REQUIRED)
if(NOT LLVM_FOUND)
  message(SEND_ERROR "Failed to find LLVM13")
  return()
else()
  include_directories(${LLVM_INCLUDE_DIR})
endif()

add_compile_options(-Wall -std=c++2a -fexceptions)


include_directories(
                    ${CMAKE_SOURCE_DIR}/include/GraphicalApp
                    ${LLVM_INCLUDE_DIR}) 

add_executable(
  genInterpretIR

  ${SOURSES}
)
target_link_libraries(
  genInterpretIR
  SDL2
  LLVM
)

