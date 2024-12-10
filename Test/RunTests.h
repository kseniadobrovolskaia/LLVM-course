#ifndef RUN_TESTS_H
#define RUN_TESTS_H

#include <string>

void runOneTest(const std::string NameData, const std::string NameResult);

void failWithError(const std::string &Msg);

const std::string getNameData(unsigned NumTest, const std::string Dir);

const std::string TestDir = "../../Test";
const std::string SnakeLangPath = "../../build/lib/Frontend/SnakeLang";
const std::string SnakeLangTestsDir = TestDir + "/SnakeLangTests";

#endif // RUN_TESTS_H
