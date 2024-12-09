cmake_minimum_required(VERSION 3.14)

project(Frontend)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")


set(SL_DIR ${CMAKE_SOURCE_DIR}/lib/Frontend)

add_custom_target(BisonRun ALL
  COMMAND bison -d ${SL_DIR}/SnakeLang.y)

add_custom_target(FlexRun ALL
  COMMAND lex ${SL_DIR}/SnakeLang.lex)


add_custom_target(ClangRun ALL
  COMMAND clang++ -o SnakeLang
  lex.yy.c SnakeLang.tab.c -I${CMAKE_SOURCE_DIR}/include/GraphicalApp ${CMAKE_SOURCE_DIR}/lib/GraphicalApp/GraphicalApp.c -lSDL2 -I/usr/lib/llvm-14/include -fno-exceptions -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -L/usr/lib/llvm-14/lib /usr/lib/llvm-14/lib/libLLVM-14.so)

add_custom_target(SnakeLangRun ALL
  COMMAND cat ${SL_DIR}/Snake.sl | ./SnakeLang)


