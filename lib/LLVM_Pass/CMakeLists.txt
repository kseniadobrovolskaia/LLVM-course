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

set(CALLBACKS ${CMAKE_CURRENT_SOURCE_DIR}/Callbacks.cpp)
add_custom_target(Callbacks ALL
  COMMAND clang++ -std=c++20 -O2 ${CALLBACKS} -fPIC -c -o Callbacks.o
  COMMENT "Generating callbacks" VERBATIM
                  )

set(APP_DIR ${CMAKE_SOURCE_DIR}/lib/GraphicalApp)
set(SOURSES ${APP_DIR}/main.c
            ${APP_DIR}/SnakeSimple.c
            ${APP_DIR}/GraphicalApp.c
    )

add_compile_options(-O2 -fpass-plugin=./libPass.so) 
add_executable(snakePass ${SOURSES} Callbacks.o)
target_link_libraries(snakePass ${SDL2_LIBRARIES} -lstdc++) 

add_custom_target(SnakePassIR ALL
  COMMAND clang -O2 ${APP_DIR}/SnakeSimple.c -fpass-plugin=./libPass.so -S -emit-llvm -I${CMAKE_SOURCE_DIR}/include/GraphicalApp -o Snake.ll
  COMMENT "Generating LLVM-IR for Snake library" VERBATIM
                  )
