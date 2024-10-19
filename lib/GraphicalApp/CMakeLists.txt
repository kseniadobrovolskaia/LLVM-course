cmake_minimum_required(VERSION 3.14)

project(GraphicalApp)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")

find_package(SDL2 REQUIRED)
if(NOT SDL2_FOUND)
  message(SEND_ERROR "Failed to find SDL")
  return()
endif()

include_directories(${CMAKE_SOURCE_DIR}/include/GraphicalApp
                    ${SDL2_INCLUDE_DIRS}
                    )

add_compile_options(-Wall -fPIC)
set(SOURCE_LIB Snake.c
               GraphicalApp.c
    )
set(SOURCE_SIMPLE_LIB SnakeSimple.c
               GraphicalApp.c
    )

add_library(Snake STATIC ${SOURCE_LIB})
add_library(simpleSnake STATIC ${SOURCE_SIMPLE_LIB})

add_executable(snakeSimple main.c)
target_link_libraries(snakeSimple simpleSnake ${SDL2_LIBRARIES}) 

add_executable(snake main.c)
target_link_libraries(snake Snake ${SDL2_LIBRARIES}) 

