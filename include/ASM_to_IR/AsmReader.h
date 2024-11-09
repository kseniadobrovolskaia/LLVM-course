#ifndef ASM_READER_H
#define ASM_READER_H

#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
#include <fstream>
#include <unordered_map>

#include "GraphicalApp.h"

class AsmReader {
  llvm::LLVMContext Context;
  llvm::Module *M;
  llvm::Function *MainFunc;
  llvm::GlobalVariable *RegFile;
  static constexpr auto REG_FILE_SIZE = 32;
  static uint32_t REG_FILE[REG_FILE_SIZE];

  //  ADDI rd rs1 imm
  //  XOR rd rs1 rs2
  //  CMP_EQ rd rs1 rs2
  //  CMP_LT rd rs1 rs2
  //  UPDATE_SCREEN
  //  PUT_PIXEL rs1 rs2 rs3
  //  BR_NOT rs label
  //  EXIT

public:
  void parseAsm(std::ifstream &input);
  void execute();
  void dumpIR();
  bool verifyIR();

  static void executeXOR(int Rd, int Rs1, int Rs2) {
    REG_FILE[Rd] = REG_FILE[Rs1] ^ REG_FILE[Rs2];
  }

  static void executeADDI(int Rd, int Rs1, int Rs2) {
    REG_FILE[Rd] = REG_FILE[Rs1] + Rs2;
  }

  static void executeADD(int Rd, int Rs1, int Rs2) {
    REG_FILE[Rd] = REG_FILE[Rs1] + REG_FILE[Rs2];
  }

  static void executePUT_PIXEL(int Rd, int Rs1, int Rs2) {
    putPixel(REG_FILE[Rd], REG_FILE[Rs1], Rs2);
  }

  static void executeCMP_EQ(int Rd, int Rs1, int Rs2) {
    REG_FILE[Rd] = (REG_FILE[Rs1] == REG_FILE[Rs2]);
  }

  static void executeCMP_LT(int Rd, int Rs1, int Rs2) {
    REG_FILE[Rd] = (REG_FILE[Rs1] < REG_FILE[Rs2]);
  }

  static void executeUPDATE_SCREEN() { updateScreen(); }
};

#endif // EXTIR_H
