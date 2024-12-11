cmake_minimum_required(VERSION 3.14)

project(LLVM_Pass)

set(CMAKE_C_COMPILER "/usr/bin/clang++")

find_package(SDL2 REQUIRED)
if(NOT SDL2_FOUND)
  message(SEND_ERROR "Failed to find SDL")
  return()
endif()

find_package(LLVM REQUIRED)
if(NOT LLVM_FOUND)
  message(SEND_ERROR "Failed to find LLVM13")
  return()
else()
  include_directories(${LLVM_INCLUDE_DIR})
endif()

set(PASS_LIB ${CMAKE_SOURCE_DIR}/lib/LLVM_Pass/TracePass.cpp
    )

set(APP_DIR ${CMAKE_SOURCE_DIR}/lib/GraphicalApp)
set(SOURSES ${APP_DIR}/main.c
            ${APP_DIR}/GraphicalApp.c
    )
set(CALLBACKS ${CMAKE_SOURCE_DIR}/lib/LLVM_Pass/Callbacks.cpp)

add_compile_options(-Wall -std=c++2a -fexceptions -lstdc++)


include_directories(${CMAKE_SOURCE_DIR}/include/LLVM_Pass
                    ${CMAKE_SOURCE_DIR}/include/GraphicalApp
                    ${SDL2_INCLUDE_DIRS}
                    ${LLVM_INCLUDE_DIR}) 

add_library(Pass SHARED ${PASS_LIB})

  
add_custom_command(OUTPUT SnakeSimple.ll
  COMMAND clang++ -O2 -fpass-plugin=./libPass.so -I${CMAKE_SOURCE_DIR}/include/GraphicalApp ${APP_DIR}/SnakeSimple.c -S -emit-llvm -o SnakeSimple.ll
  COMMENT "Generating app with pass" VERBATIM
                  )

add_executable(snakePass ${SOURSES} ${CALLBACKS} ${APP_DIR}/SnakeSimple.c)

target_link_libraries(
  snakePass
  SDL2
  LLVM
)



