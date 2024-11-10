#include <cstring>
#include <iostream>

#include "AsmReader.h"

int main(int Argc, char *Argv[]) {
  bool IsDumpIR = false;
  std::string FileName;
  switch (Argc) {
  case 2:
    FileName = Argv[1];
    break;
  case 3: {
    IsDumpIR = true;
    if (!std::strcmp("--dumpIR", Argv[1])) {
      FileName = Argv[2];
      break;
    } else if (!std::strcmp("--dumpIR", Argv[2])) {
      FileName = Argv[1];
      break;
    }
  }
  default: {
    std::cout << "Usage: " << Argv[0] << " <AsmFile> [--dumpIR]\n";
    return EXIT_SUCCESS;
  }
  }

  std::ifstream input;
  input.open(FileName);
  if (!input.is_open()) {
    std::cerr << "Can't open assembler file " << FileName << "\n";
    return EXIT_FAILURE;
  }

  AsmReader Reader;
  Reader.parseAsm(input);
  input.close();

  if (IsDumpIR)
    Reader.dumpIR();

  if (Reader.verifyIR()) {
    std::cerr << "Verification failed\n";
    return EXIT_FAILURE;
  }

  Reader.execute();

  return EXIT_SUCCESS;
}
