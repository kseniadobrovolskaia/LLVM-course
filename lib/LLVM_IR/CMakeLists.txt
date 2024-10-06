cmake_minimum_required(VERSION 3.14)

project(LLVM_IR)

set(APP_SRC ${CMAKE_SOURCE_DIR}/lib/GraphicalApp/SnakeSimple.c)

add_custom_target(SnakeIR ALL
  COMMAND clang ${APP_SRC} -O2 -S -emit-llvm -I${CMAKE_SOURCE_DIR}/include/GraphicalApp -o Snake.ll
  COMMENT "Generating LLVM-IR for Snake library" VERBATIM
                  )
