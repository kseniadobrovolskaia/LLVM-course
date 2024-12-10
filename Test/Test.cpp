#include "RunTests.h"
#include <fstream>
#include <gtest/gtest.h>
#include <iostream>
#include <string>

static const std::string getNameResults(unsigned NumTest,
                                        const std::string Dir) {
  const auto ResultDir = Dir + "/Results/";
  const auto File = "_TestResults.txt";
  return ResultDir + std::to_string(NumTest) + File;
}

static const std::string getNameAnswers(unsigned NumTest,
                                        const std::string Dir) {
  const auto AnswerDir = Dir + "/Answers/";
  const auto File = "_TestAnswer.txt";
  return AnswerDir + std::to_string(NumTest) + File;
}

const std::string getNameData(unsigned NumTest, const std::string Dir) {
  const auto DataDir = Dir + "/Data/";
  const auto File = "_TestData.sl";
  return DataDir + std::to_string(NumTest) + File;
}

/**
 * @brief checkTrace - This function, using a FileCheck,
 *                     finds the necessary execution elements (writes to
 *                     registers or memory) in the trace.
 */
::testing::AssertionResult checkTrace(unsigned NumTest,
                                      const std::string CurrTestDir) {
  auto NameAnswer = getNameAnswers(NumTest, CurrTestDir);
  auto NameResult = getNameResults(NumTest, CurrTestDir);

  std::string CheckCmd = "cat " + NameResult + " | FileCheck " + NameAnswer;
  auto Result = system(CheckCmd.c_str());
  if (Result != 0) {
    return ::testing::AssertionFailure()
           << "The required trace elements were not found";
  } else {
    return ::testing::AssertionSuccess();
  }
}

/**
 * @brief TEST - Tests.
 *               Expects to find the necessary elements in the trace.
 *
 */
#define ADD_TEST(Num, TestsName)                                               \
  TEST(TestsName, Test##Num) {                                                 \
    auto CurrTestDir = TestsName##TestsDir;                                    \
    auto NameData = getNameData(Num, CurrTestDir);                             \
    auto NameResult = getNameResults(Num, CurrTestDir);                        \
    runOneTest(NameData, NameResult);                                          \
    EXPECT_TRUE(checkTrace(Num, CurrTestDir));                                 \
  }

//----------------------------------SNAKE_LANG_TESTS--------------------------------------
#include "SnakeLangTests/GenTests.h"

#undef ADD_TEST
