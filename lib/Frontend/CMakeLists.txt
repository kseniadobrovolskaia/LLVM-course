cmake_minimum_required(VERSION 3.14)

project(Frontend)

set(CMAKE_C_COMPILER "/usr/bin/clang++")
set(SL_DIR ${CMAKE_SOURCE_DIR}/lib/Frontend)

find_package(LLVM REQUIRED)
if(NOT LLVM_FOUND)
  message(SEND_ERROR "Failed to find LLVM13")
  return()
else()
  include_directories(${LLVM_INCLUDE_DIR})
endif()

find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)


include_directories(${CMAKE_SOURCE_DIR}/include/Frontend
                    ${CMAKE_SOURCE_DIR}/include/GraphicalApp
                    ${CMAKE_CURRENT_BINARY_DIR}
                    ${LLVM_INCLUDE_DIR}) 

flex_target(
  Lexer
  ${SL_DIR}/SnakeLang.lex
  ${CMAKE_CURRENT_BINARY_DIR}/Lexer.cc
)

bison_target(
  Parser
  ${SL_DIR}/SnakeLang.y
  ${CMAKE_CURRENT_BINARY_DIR}/Parser.cc
  COMPILE_FLAGS "-Wcounterexamples -v --defines=${CMAKE_CURRENT_BINARY_DIR}/Parser.tab.hh"
)

add_flex_bison_dependency(Lexer Parser)

set(SOURSES 
            ${BISON_Parser_OUTPUTS}
            ${FLEX_Lexer_OUTPUTS}
            ${CMAKE_SOURCE_DIR}/lib/Frontend/main.cpp
            ${CMAKE_SOURCE_DIR}/lib/GraphicalApp/GraphicalApp.c
            )

add_compile_options(-Wall -std=c++2a -fexceptions)


add_executable(
  SnakeLang

  ${SOURSES}
)
target_link_libraries(
  SnakeLang
  SDL2
  ${CMAKE_CURRENT_BINARY_DIR}
  LLVM
)


