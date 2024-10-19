cmake_minimum_required(VERSION 3.14)

project(LLVM_Pass)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")

find_package(SDL2 REQUIRED)
if(NOT SDL2_FOUND)
  message(SEND_ERROR "Failed to find SDL")
  return()
endif()

find_package(LLVM REQUIRED)
if(NOT LLVM_FOUND)
  message(SEND_ERROR "Failed to find LLVM")
  return()
endif()

include_directories(${CMAKE_SOURCE_DIR}/include/LLVM_Pass
                    ${CMAKE_SOURCE_DIR}/include/GraphicalApp
                    ${LLVM_INCLUDE_DIR}
                    ${SDL2_INCLUDE_DIRS}
                    )

add_compile_options(-Wall -fPIC)
set(PASS_LIB TracePass.cpp
    )
add_library(Pass SHARED ${PASS_LIB})

set(APP_DIR ${CMAKE_SOURCE_DIR}/lib/GraphicalApp)
set(SOURSES ${APP_DIR}/main.c
            ${APP_DIR}/GraphicalApp.c
    )
  
add_custom_target(SnakeSimple ALL
  COMMAND clang++ -O2 -fpass-plugin=./libPass.so -I${CMAKE_SOURCE_DIR}/include/GraphicalApp ${APP_DIR}/SnakeSimple.c -S -emit-llvm -o SnakeSimple.ll
  COMMENT "Generating app with pass" VERBATIM
                  )

set(CALLBACKS ${CMAKE_SOURCE_DIR}/lib/LLVM_Pass/Callbacks.cpp)
add_custom_target(SnakePass ALL
  COMMAND clang++ -O2 ${SDL2_LIBRARIES} -I${SDL2_INCLUDE_DIRS} -lSDL2 -I${CMAKE_SOURCE_DIR}/include/GraphicalApp -std=c++20 -lstdc++ ${SOURSES} ${CALLBACKS} SnakeSimple.ll -o snakePass
  COMMENT "Generating executable snakePass" VERBATIM
                  )

