#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
#include <fstream>
#include <iostream>
#include <unordered_map>

#include "GraphicalApp.h"

using namespace llvm;

// clang++ $(llvm-config --cppflags --ldflags --libs) app_asm_IRgen_1.cpp ../GraphicalApp/SnakeSimple.c ../GraphicalApp/GraphicalApp.c   -I../../include/GraphicalApp/  -lSDL2

//
//
//  ADDI rd rs1 imm
//  ADD rd rs1 rs2
//  XOR rd rs1 rs2
//  CMP_EQ rd rs1 rs2
//  CMP_LT rd rs1 rs2
//  SLI rd rs1 rs2
//  SRI rd rs1 rs2
//  MODI rd rs1 rs2
//  DIVI rd rs1 rs2
//  UPDATE_SCREEN
//  PUT_PIXEL rs1 rs2 12187338
//  J label
//  BR_NOT rs label
//  EXIT
 
//    XOR x1 x1 x1
//    MUL x3 x2 x1
//    SUBi x6 x6 16777216
//    PUT_PIXEL x5 x2 x6
//    INC_NEi x4 x5 512
//    BR_COND x4 label_13
//    FLUSH
//    EXIT

const int REG_FILE_SIZE = 32;
uint32_t REG_FILE[REG_FILE_SIZE];

void do_XOR(int arg1, int arg2, int arg3) {
  REG_FILE[arg1] = REG_FILE[arg2] ^ REG_FILE[arg3];
}

void do_SRI(int arg1, int arg2, int arg3) {
  REG_FILE[arg1] = REG_FILE[arg2] >> arg3;
}

void do_SLI(int arg1, int arg2, int arg3) {
  REG_FILE[arg1] = REG_FILE[arg2] << arg3;
}

void do_DIVI(int arg1, int arg2, int arg3) {
  REG_FILE[arg1] = REG_FILE[arg2] / arg3;
}

void do_MODI(int arg1, int arg2, int arg3) {
  REG_FILE[arg1] = REG_FILE[arg2] % arg3;
}

void do_ADDI(int arg1, int arg2, int arg3) {
  REG_FILE[arg1] = REG_FILE[arg2] + arg3;
}

void do_ADD(int arg1, int arg2, int arg3) {
  REG_FILE[arg1] = REG_FILE[arg2] + REG_FILE[arg3];
}

void do_PUT_PIXEL(int arg1, int arg2, int arg3) {
  putPixel(REG_FILE[arg1], REG_FILE[arg2], arg3);
}

void do_CMP_EQ(int arg1, int arg2, int arg3) {
  REG_FILE[arg1] = REG_FILE[arg2] == REG_FILE[arg3];
}

void do_CMP_LT(int arg1, int arg2, int arg3) {
  REG_FILE[arg1] = REG_FILE[arg2] < REG_FILE[arg3];
}

void do_UPDATE_SCREEN() { updateScreen(); }

int main(int argc, char *argv[]) {
  if (argc != 2) {
    outs() << "[ERROR] Need 1 argument: file with assembler code\n";
    return 1;
  }
  std::ifstream input;
  input.open(argv[1]);
  if (!input.is_open()) {
    outs() << "[ERROR] Can't open " << argv[1] << "\n";
    return 1;
  }

  LLVMContext context;
  // ; ModuleID = 'top'
  // source_filename = "top"
  Module *module = new Module("top", context);
  IRBuilder<> builder(context);

  //[32 x i32] regFile = {0, 0, 0, 0}
  ArrayType *regFileType = ArrayType::get(builder.getInt32Ty(), REG_FILE_SIZE);
  module->getOrInsertGlobal("regFile", regFileType);
  GlobalVariable *regFile = module->getNamedGlobal("regFile");

  // declare void @main()
  FunctionType *funcType = FunctionType::get(builder.getVoidTy(), false);
  Function *mainFunc =
      Function::Create(funcType, Function::ExternalLinkage, "main", module);

  std::string name;
  std::string arg;
  std::unordered_map<std::string, BasicBlock *> BBMap;

  outs() << "\n#[FILE]:\nBBs:";

  while (input >> name) {
    if (!name.compare("XOR") || !name.compare("SLI") || !name.compare("SRI") || !name.compare("DIVI") || !name.compare("MODI") || !name.compare("ADD") || !name.compare("ADDI") ||
        !name.compare("PUT_PIXEL") || !name.compare("CMP_EQ") || !name.compare("CMP_LT")) {
      input >> arg >> arg >> arg;
      continue;
    }
    if (!name.compare("BR_NOT")) {
      input >> arg >> arg;
      continue;
    }
    if (!name.compare("EXIT") || !name.compare("UPDATE_SCREEN")) {
      continue;
    }

    outs() << " " << name;
    BBMap[name] = BasicBlock::Create(context, name, mainFunc);
  }
  outs() << "\n";
  input.close();
  input.open(argv[1]);

  // Funcions types
  Type *voidType = Type::getVoidTy(context);
  FunctionType *voidFuncType = FunctionType::get(voidType, false);
  ArrayRef<Type *> int32x3Types = {Type::getInt32Ty(context),
                                   Type::getInt32Ty(context),
                                   Type::getInt32Ty(context)};
  FunctionType *int32x3FuncType =
      FunctionType::get(voidType, int32x3Types, false);
  // Functions
  FunctionCallee do_XORFunc =
      module->getOrInsertFunction("do_XOR", int32x3FuncType);

  FunctionCallee do_SLIFunc =
      module->getOrInsertFunction("do_SLI", int32x3FuncType);

  FunctionCallee do_SRIFunc =
      module->getOrInsertFunction("do_SRI", int32x3FuncType);

  FunctionCallee do_DIVIFunc =
      module->getOrInsertFunction("do_DIVI", int32x3FuncType);

  FunctionCallee do_MODIFunc =
      module->getOrInsertFunction("do_MODI", int32x3FuncType);

  FunctionCallee do_ADDIFunc =
      module->getOrInsertFunction("do_ADDI", int32x3FuncType);

  FunctionCallee do_ADDFunc =
      module->getOrInsertFunction("do_ADD", int32x3FuncType);

  FunctionCallee do_PUT_PIXELFunc =
      module->getOrInsertFunction("do_PUT_PIXEL", int32x3FuncType);

  FunctionCallee do_CMP_EQFunc =
      module->getOrInsertFunction("do_CMP_EQ", int32x3FuncType);

  FunctionCallee do_CMP_LTFunc =
      module->getOrInsertFunction("do_CMP_LT", int32x3FuncType);

  FunctionCallee do_UPDATE_SCREENFunc =
      module->getOrInsertFunction("do_UPDATE_SCREEN", voidFuncType);

  while (input >> name) {
    if (!name.compare("EXIT")) {
      outs() << "\tEXIT\n";
      builder.CreateRetVoid();
      if (input >> name) {
        outs() << "BB " << name << "\n";
        builder.SetInsertPoint(BBMap[name]);
      }
      continue;
    }
    if (!name.compare("PUT_PIXEL")) {
      input >> arg;
      outs() << "\tPUT_PIXEL " << arg;
      Value *arg1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " " << arg;
      Value *arg2 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " " << arg << "\n";
      Value *arg3 = builder.getInt32(std::stoi(arg));
      Value *args[] = {arg1, arg2, arg3};
      builder.CreateCall(do_PUT_PIXELFunc, args);
      continue;
    }
    if (!name.compare("UPDATE_SCREEN")) {
      outs() << "\tUPDATE_SCREEN\n";
      builder.CreateCall(do_UPDATE_SCREENFunc);
      continue;
    }
    if (!name.compare("XOR")) {
      input >> arg;
      outs() << "\t" << arg;
      // res
      Value *arg1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " = " << arg;
      // arg1
      Value *arg2 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " ^ " << arg << "\n";
      // arg2
      Value *arg3 = builder.getInt32(std::stoi(arg.substr(1)));
      Value *args[] = {arg1, arg2, arg3};
      builder.CreateCall(do_XORFunc, args);
      continue;
    }
    if (!name.compare("SLI")) {
      input >> arg;
      outs() << "\t" << arg;
      // res
      Value *arg1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " = " << arg;
      // arg1
      Value *arg2 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " << " << arg << "\n";
      // arg2
      Value *arg3 = builder.getInt32(std::stoi(arg));
      Value *args[] = {arg1, arg2, arg3};
      builder.CreateCall(do_SLIFunc, args);
      continue;
    }
    if (!name.compare("SRI")) {
      input >> arg;
      outs() << "\t" << arg;
      // res
      Value *arg1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " = " << arg;
      // arg1
      Value *arg2 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " >> " << arg << "\n";
      // arg2
      Value *arg3 = builder.getInt32(std::stoi(arg));
      Value *args[] = {arg1, arg2, arg3};
      builder.CreateCall(do_SRIFunc, args);
      continue;
    }

    if (!name.compare("DIVI")) {
      input >> arg;
      outs() << "\t" << arg;
      // res
      Value *arg1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " = " << arg;
      // arg1
      Value *arg2 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " / " << arg << "\n";
      // arg2
      Value *arg3 = builder.getInt32(std::stoi(arg));
      Value *args[] = {arg1, arg2, arg3};
      builder.CreateCall(do_DIVIFunc, args);
      continue;
    }
    if (!name.compare("MODI")) {
      input >> arg;
      outs() << "\t" << arg;
      // res
      Value *arg1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " = " << arg;
      // arg1
      Value *arg2 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " % " << arg << "\n";
      // arg2
      Value *arg3 = builder.getInt32(std::stoi(arg));
      Value *args[] = {arg1, arg2, arg3};
      builder.CreateCall(do_MODIFunc, args);
      continue;
    }

    if (!name.compare("ADD")) {

      input >> arg;
      outs() << "\t" << arg;
      // res
      Value *arg1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " = " << arg;
      // arg1
      Value *arg2 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " + " << arg << "\n";
      // arg2
      Value *arg3 = builder.getInt32(std::stoi(arg.substr(1)));
      Value *args[] = {arg1, arg2, arg3};
      builder.CreateCall(do_ADDFunc, args);
      continue;
    }
    if (!name.compare("ADDI")) {

      input >> arg;
      outs() << "\t" << arg;
      // res
      Value *arg1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " = " << arg;
      // arg1
      Value *arg2 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " + " << arg << "\n";
      // arg2
      Value *arg3 = builder.getInt32(std::stoi(arg));
      Value *args[] = {arg1, arg2, arg3};
      builder.CreateCall(do_ADDIFunc, args);
      continue;
    }

    if (!name.compare("CMP_EQ")) {
      input >> arg;
      outs() << "\t" << arg;
      // res
      Value *arg1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " = " << arg;
      // arg1
      Value *arg2 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " == " << arg << "\n";
      // arg2
      Value *arg3 = builder.getInt32(std::stoi(arg.substr(1)));
      Value *args[] = {arg1, arg2, arg3};
      builder.CreateCall(do_CMP_EQFunc, args);
      continue;
    }

    if (!name.compare("CMP_LT")) {
      input >> arg;
      outs() << "\t" << arg;
      // res
      Value *arg1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " = " << arg;
      // arg1
      Value *arg2 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      outs() << " < " << arg << "\n";
      // arg2
      Value *arg3 = builder.getInt32(std::stoi(arg.substr(1)));
      Value *args[] = {arg1, arg2, arg3};
      builder.CreateCall(do_CMP_LTFunc, args);
      continue;
    }

    if (!name.compare("BR_NOT")) {
      input >> arg;
      outs() << "\tif (!" << arg;
      // reg1
      Value *reg_p = builder.CreateConstGEP2_32(regFileType, regFile, 0,
                                                std::stoi(arg.substr(1)));
      Value *reg_i1 = builder.CreateTrunc(
          builder.CreateLoad(builder.getInt32Ty(), reg_p), builder.getInt1Ty());
      input >> arg;
      outs() << ") then BB:" << arg;
      input >> name;
      outs() << " else BB:" << name << "\n";
      outs() << "BB " << name << "\n";
      builder.CreateCondBr(reg_i1, BBMap[name], BBMap[arg]);
      builder.SetInsertPoint(BBMap[name]);
      continue;
    }

    if (builder.GetInsertBlock()) {
      builder.CreateBr(BBMap[name]);
      outs() << "\tbranch to " << name << "\n";
    }
    outs() << "BB " << name << "\n";
    builder.SetInsertPoint(BBMap[name]);
  }

  outs() << "\n#[LLVM IR]:\n";
  module->print(outs(), nullptr);
  outs() << "\n";
  bool verif = verifyFunction(*mainFunc, &outs());
  outs() << "[VERIFICATION] " << (!verif ? "OK\n\n" : "FAIL\n\n");

  outs() << "\n#[Running code]\n";
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();

  ExecutionEngine *ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
  ee->InstallLazyFunctionCreator([=](const std::string &fnName) -> void * {
    if (fnName == "do_XOR") {
      return reinterpret_cast<void *>(do_XOR);
    }
    if (fnName == "do_SLI") {
      return reinterpret_cast<void *>(do_SLI);
    }
    if (fnName == "do_SRI") {
      return reinterpret_cast<void *>(do_SRI);
    }
    if (fnName == "do_DIVI") {
      return reinterpret_cast<void *>(do_DIVI);
    }
    if (fnName == "do_MODI") {
      return reinterpret_cast<void *>(do_MODI);
    }
    if (fnName == "do_ADDI") {
      return reinterpret_cast<void *>(do_ADDI);
    }
    if (fnName == "do_ADD") {
      return reinterpret_cast<void *>(do_ADD);
    }
    if (fnName == "do_PUT_PIXEL") {
      return reinterpret_cast<void *>(do_PUT_PIXEL);
    }
    if (fnName == "do_CMP_EQ") {
      return reinterpret_cast<void *>(do_CMP_EQ);
    }
    if (fnName == "do_CMP_LT") {
      return reinterpret_cast<void *>(do_CMP_LT);
    }
    if (fnName == "do_UPDATE_SCREEN") {
      return reinterpret_cast<void *>(do_UPDATE_SCREEN);
    }
    return nullptr;
  });

  ee->addGlobalMapping(regFile, (void *)REG_FILE);
  ee->finalizeObject();

  initApp();

  ArrayRef<GenericValue> noargs;
  ee->runFunction(mainFunc, noargs);
  errs() << "#[Code was run]\n";

  exitApp();
  errs() << "#[Code was end]\n";
  return EXIT_SUCCESS;
}
