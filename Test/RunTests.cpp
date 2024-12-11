#include "RunTests.h"

#include <fstream>
#include <iostream>

void failWithError(const std::string &Msg) {
  std::cerr << Msg << "\n";
  exit(EXIT_FAILURE);
}

/**
 * @brief runOneTest - it run SnakeLang and the
 *                     results are written to the "Results"
 *                     directory.
 */
void runOneTest(const std::string NameData, const std::string NameResult) {
  auto Cmd = SnakeLangPath + " " + NameData + " > " + NameResult;
  if (system(Cmd.c_str()) != 0)
    failWithError("Error during run test");
}
