cmake_minimum_required(VERSION 3.14)

project(GraphicalApp)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")
add_compile_options(-fPIC)

find_package(SDL2 REQUIRED)

include_directories(${CMAKE_SOURCE_DIR}/include/GraphicalApp
                    ${SDL2_INCLUDE_DIRS}
                    )

set(SOURCE_LIB Snake.c
               GraphicalApp.c
    )


add_library(Snake STATIC ${SOURCE_LIB})

add_executable(snake main.c)
target_link_libraries(snake Snake ${SDL2_LIBRARIES})

