#!/bin/bash

# This script runs from the CMakeLists.txt. 
# Its first argument $1 is the path to the Test directory. 
# It generates in each test subdirectory (SnakeLangTests)
# a header file GenTests.h with ADD_TEST macros. 
# This file is included in the test file Test.cpp and Google test
# functions TEST are created for each file from the Data directory.


# generation SnakeLangTests
if [ -f "$1/SnakeLangTests/GenTests.h" ]; then
  rm $1/SnakeLangTests/GenTests.h
fi
NumTest=1
for i in $( ls $1/SnakeLangTests/Data ); do
  echo "ADD_TEST("$NumTest", SnakeLang)" >> GenTests.h
  let NumTest=NumTest+1
done
mv GenTests.h $1/SnakeLangTests
if [ ! -d "$1/SnakeLangTests/Results" ]; then
  mkdir $1/SnakeLangTests/Results
fi
echo "All tests for SnakeLang are generated!"

