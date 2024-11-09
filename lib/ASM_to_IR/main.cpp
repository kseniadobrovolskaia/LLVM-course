#include <iostream>

#include "AsmReader.h"

int main(int argc, char *argv[]) {
  if (argc != 2) {
    std::cerr << "Need assembler file in arg\n";
    return EXIT_FAILURE;
  }
  std::ifstream input;
  input.open(argv[1]);
  if (!input.is_open()) {
    std::cerr << "Can't open " << argv[1] << "\n";
    return EXIT_FAILURE;
  }

  AsmReader Reader;
  Reader.parseAsm(input);

  input.close();

  if (Reader.verifyIR()) {
    std::cerr << "Verification failed\n";
    return EXIT_FAILURE;
  }

  Reader.execute();

  return EXIT_SUCCESS;
}
