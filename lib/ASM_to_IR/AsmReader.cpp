#include <iostream>

#include "AsmReader.h"

using namespace llvm;

uint32_t AsmReader::REG_FILE[REG_FILE_SIZE];

void AsmReader::dumpIR() { M->dump(); }

bool AsmReader::verifyIR() { return verifyFunction(*MainFunc, &outs()); }

void AsmReader::parseAsm(std::ifstream &input) {
  M = new Module("top", Context);
  IRBuilder<> builder(Context);

  ArrayType *RegFileType = ArrayType::get(builder.getInt32Ty(), REG_FILE_SIZE);
  M->getOrInsertGlobal("RegFile", RegFileType);
  RegFile = M->getNamedGlobal("RegFile");

  // Declare main()
  FunctionType *funcType = FunctionType::get(builder.getVoidTy(), false);
  MainFunc = Function::Create(funcType, Function::ExternalLinkage, "main", M);

  std::string TokenId;
  std::string arg;
  std::unordered_map<std::string, BasicBlock *> BBMap;

  // First parse all basic blocks
  while (input >> TokenId) {
    if (!TokenId.compare("XOR") || !TokenId.compare("ADD") ||
        !TokenId.compare("ADDI") || !TokenId.compare("PUT_PIXEL") ||
        !TokenId.compare("CMP_EQ") || !TokenId.compare("CMP_LT")) {
      input >> arg >> arg >> arg;
      continue;
    }
    if (!TokenId.compare("BR_NOT")) {
      input >> arg >> arg;
      continue;
    }
    if (!TokenId.compare("EXIT") || !TokenId.compare("UPDATE_SCREEN")) {
      continue;
    }

    BBMap[TokenId] = BasicBlock::Create(Context, TokenId, MainFunc);
  }

  // Return in begin of asm file and parse instructions
  input.clear();
  input.seekg(0, std::ios::beg);

  Type *voidType = Type::getVoidTy(Context);
  FunctionType *voidFuncType = FunctionType::get(voidType, false);
  ArrayRef<Type *> int32x3Types = {Type::getInt32Ty(Context),
                                   Type::getInt32Ty(Context),
                                   Type::getInt32Ty(Context)};
  FunctionType *int32x3FuncType =
      FunctionType::get(voidType, int32x3Types, false);
  // Create emulation functions
  FunctionCallee executeXORFunc =
      M->getOrInsertFunction("executeXOR", int32x3FuncType);

  FunctionCallee executeADDIFunc =
      M->getOrInsertFunction("executeADDI", int32x3FuncType);

  FunctionCallee executeADDFunc =
      M->getOrInsertFunction("executeADD", int32x3FuncType);

  FunctionCallee executePUT_PIXELFunc =
      M->getOrInsertFunction("executePUT_PIXEL", int32x3FuncType);

  FunctionCallee executeCMP_EQFunc =
      M->getOrInsertFunction("executeCMP_EQ", int32x3FuncType);

  FunctionCallee executeCMP_LTFunc =
      M->getOrInsertFunction("executeCMP_LT", int32x3FuncType);

  FunctionCallee executeUPDATE_SCREENFunc =
      M->getOrInsertFunction("executeUPDATE_SCREEN", voidFuncType);

  while (input >> TokenId) {
    if (!TokenId.compare("EXIT")) {
      builder.CreateRetVoid();
      if (input >> TokenId)
        builder.SetInsertPoint(BBMap[TokenId]);
      continue;
    }
    if (!TokenId.compare("PUT_PIXEL")) {
      input >> arg;
      Value *Rd = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs2 = builder.getInt32(std::stoi(arg));
      Value *args[] = {Rd, Rs1, Rs2};
      builder.CreateCall(executePUT_PIXELFunc, args);
      continue;
    }
    if (!TokenId.compare("UPDATE_SCREEN")) {
      builder.CreateCall(executeUPDATE_SCREENFunc);
      continue;
    }
    if (!TokenId.compare("XOR")) {
      input >> arg;
      Value *Rd = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs2 = builder.getInt32(std::stoi(arg.substr(1)));
      Value *args[] = {Rd, Rs1, Rs2};
      builder.CreateCall(executeXORFunc, args);
      continue;
    }
    if (!TokenId.compare("ADD")) {
      input >> arg;
      Value *Rd = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs2 = builder.getInt32(std::stoi(arg.substr(1)));
      Value *args[] = {Rd, Rs1, Rs2};
      builder.CreateCall(executeADDFunc, args);
      continue;
    }
    if (!TokenId.compare("ADDI")) {
      input >> arg;
      Value *Rd = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs2 = builder.getInt32(std::stoi(arg));
      Value *args[] = {Rd, Rs1, Rs2};
      builder.CreateCall(executeADDIFunc, args);
      continue;
    }
    if (!TokenId.compare("CMP_EQ")) {
      input >> arg;
      Value *Rd = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs2 = builder.getInt32(std::stoi(arg.substr(1)));
      Value *args[] = {Rd, Rs1, Rs2};
      builder.CreateCall(executeCMP_EQFunc, args);
      continue;
    }
    if (!TokenId.compare("CMP_LT")) {
      input >> arg;
      Value *Rd = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs1 = builder.getInt32(std::stoi(arg.substr(1)));
      input >> arg;
      Value *Rs2 = builder.getInt32(std::stoi(arg.substr(1)));
      Value *args[] = {Rd, Rs1, Rs2};
      builder.CreateCall(executeCMP_LTFunc, args);
      continue;
    }
    if (!TokenId.compare("BR_NOT")) {
      input >> arg;
      Value *reg_p = builder.CreateConstGEP2_32(RegFileType, RegFile, 0,
                                                std::stoi(arg.substr(1)));
      Value *reg_i1 = builder.CreateTrunc(
          builder.CreateLoad(builder.getInt32Ty(), reg_p), builder.getInt1Ty());
      input >> arg;
      input >> TokenId;
      builder.CreateCondBr(reg_i1, BBMap[TokenId], BBMap[arg]);
      builder.SetInsertPoint(BBMap[TokenId]);
      continue;
    }

    if (builder.GetInsertBlock())
      builder.CreateBr(BBMap[TokenId]);
    builder.SetInsertPoint(BBMap[TokenId]);
  }
}

void AsmReader::execute() {
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();

  ExecutionEngine *ee = EngineBuilder(std::unique_ptr<Module>(M)).create();
  ee->InstallLazyFunctionCreator([=](const std::string &FuncName) -> void * {
    if (FuncName == "executeXOR") {
      return reinterpret_cast<void *>(executeXOR);
    }
    if (FuncName == "executeADDI") {
      return reinterpret_cast<void *>(executeADDI);
    }
    if (FuncName == "executeADD") {
      return reinterpret_cast<void *>(executeADD);
    }
    if (FuncName == "executePUT_PIXEL") {
      return reinterpret_cast<void *>(executePUT_PIXEL);
    }
    if (FuncName == "executeCMP_EQ") {
      return reinterpret_cast<void *>(executeCMP_EQ);
    }
    if (FuncName == "executeCMP_LT") {
      return reinterpret_cast<void *>(executeCMP_LT);
    }
    if (FuncName == "executeUPDATE_SCREEN") {
      return reinterpret_cast<void *>(executeUPDATE_SCREEN);
    }
    return nullptr;
  });

  ee->addGlobalMapping(RegFile, (void *)REG_FILE);
  ee->finalizeObject();

  initApp();

  ArrayRef<GenericValue> noargs;
  ee->runFunction(MainFunc, noargs);

  exitApp();
}
