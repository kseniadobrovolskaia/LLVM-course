cmake_minimum_required(VERSION 3.14)

project(IR_Gen-Interpret)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")


set(SOURSES ${CMAKE_SOURCE_DIR}/lib/IR_Gen-Interpret/GenInterpretIR.cpp
            ${CMAKE_SOURCE_DIR}/lib/GraphicalApp/GraphicalApp.c
    )

add_custom_target(IRGen ALL
  COMMAND clang++ -o genInterpretIR
-I${CMAKE_SOURCE_DIR}/include/GraphicalApp ${SOURSES} -lSDL2 -I/usr/lib/llvm-14/include -std=c++14 -fno-exceptions -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -L/usr/lib/llvm-14/lib /usr/lib/llvm-14/lib/libLLVM-14.so  
  COMMENT "Generating LLVM IR" VERBATIM
                  )

