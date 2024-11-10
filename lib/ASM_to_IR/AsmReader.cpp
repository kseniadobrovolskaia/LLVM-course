#include <iostream>

#include "AsmReader.h"
#include "magic_enum.hpp"

using namespace llvm;

static void failWithError(const std::string &Msg) {
  errs() << Msg << "\n";
  exit(EXIT_FAILURE);
}

uint32_t AsmReader::RegFile[RegFileSize];

void AsmReader::dumpIR() const { M->dump(); }

bool AsmReader::verifyIR() const { return verifyFunction(*MainFunc, &outs()); }

int AsmReader::getNumOps(const std::string &Opcode) const {
  auto Op = magic_enum::enum_cast<ISA>(Opcode);
  if (!Op.has_value())
    return -1;
  switch (Op.value()) {
  case ISA::ADD:
  case ISA::ADDI:
  case ISA::XOR:
  case ISA::CMP_EQ:
  case ISA::CMP_LT:
  case ISA::PUT_PIXEL:
    return 3;
  case ISA::BR_NOT:
    return 2;
  case ISA::UPDATE_SCREEN:
  case ISA::EXIT:
    return 0;
  default:
    return -1;
  }
}

void AsmReader::execute() const {
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();

  ExecutionEngine *ExecEng = EngineBuilder(std::unique_ptr<Module>(M)).create();
  ExecEng->InstallLazyFunctionCreator(
      [=](const std::string &FuncName) -> void * {
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

  ExecEng->addGlobalMapping(RegFileGlobal, (void *)RegFile);
  ExecEng->finalizeObject();

  initApp();

  ArrayRef<GenericValue> NoArgs;
  ExecEng->runFunction(MainFunc, NoArgs);

  exitApp();
}

void AsmReader::parseAsm(std::ifstream &Input) {
  M = new Module("top", Context);
  IRBuilder<> builder(Context);

  ArrayType *RegFileGlobalType =
      ArrayType::get(builder.getInt32Ty(), RegFileSize);
  M->getOrInsertGlobal("RegFileGlobal", RegFileGlobalType);
  RegFileGlobal = M->getNamedGlobal("RegFileGlobal");

  // Declare main()
  FunctionType *funcType = FunctionType::get(builder.getVoidTy(), false);
  MainFunc = Function::Create(funcType, Function::ExternalLinkage, "main", M);

  std::string TokenId, Arg;
  std::unordered_map<std::string, BasicBlock *> BBMap;

  // First create all basic blocks and fill BBMap
  while (Input >> TokenId) {
    auto NumOps = getNumOps(TokenId);
    switch (NumOps) {
    case 3: {
      Input >> Arg >> Arg >> Arg;
      continue;
    }
    case 2: {
      Input >> Arg >> Arg;
      continue;
    }
    case 0:
      continue;
    default:
      if (TokenId.back() != ':')
        failWithError(formatv("Unrecognized opcode {0}", TokenId));
      std::string BBName = TokenId.substr(0, TokenId.size() - 1);
      BBMap[BBName] = BasicBlock::Create(Context, BBName, MainFunc);
    }
  }

  // Return in begin of asm file and parse instructions
  Input.clear();
  Input.seekg(0, std::ios::beg);

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

  while (Input >> TokenId) {
    auto Op = magic_enum::enum_cast<ISA>(TokenId);
    if (!Op.has_value()) {
      std::string BBName = TokenId.substr(0, TokenId.size() - 1);
      if (!BBMap.contains(BBName))
        failWithError(formatv("Unrecognized label {0}", BBName));
      if (builder.GetInsertBlock())
        builder.CreateBr(BBMap[BBName]);
      builder.SetInsertPoint(BBMap[BBName]);
      continue;
    }

    switch (Op.value()) {
    case ISA::ADD:
    case ISA::XOR:
    case ISA::CMP_EQ:
    case ISA::CMP_LT: {
      Input >> Arg;
      Value *Rd = builder.getInt32(std::stoi(Arg.substr(1)));
      Input >> Arg;
      Value *Rs1 = builder.getInt32(std::stoi(Arg.substr(1)));
      Input >> Arg;
      Value *Rs2 = builder.getInt32(std::stoi(Arg.substr(1)));
      Value *Args[] = {Rd, Rs1, Rs2};
      switch (Op.value()) {
      case ISA::ADD:
        builder.CreateCall(executeADDFunc, Args);
        break;
      case ISA::XOR:
        builder.CreateCall(executeXORFunc, Args);
        break;
      case ISA::CMP_EQ:
        builder.CreateCall(executeCMP_EQFunc, Args);
        break;
      case ISA::CMP_LT:
        builder.CreateCall(executeCMP_LTFunc, Args);
        break;
      }
      continue;
    }
    case ISA::ADDI:
    case ISA::PUT_PIXEL: {
      Input >> Arg;
      Value *Rd = builder.getInt32(std::stoi(Arg.substr(1)));
      Input >> Arg;
      Value *Rs1 = builder.getInt32(std::stoi(Arg.substr(1)));
      Input >> Arg;
      Value *Rs2 = builder.getInt32(std::stoi(Arg));
      Value *Args[] = {Rd, Rs1, Rs2};
      if (Op.value() == ISA::ADDI) {
        builder.CreateCall(executeADDIFunc, Args);
        continue;
      }
      builder.CreateCall(executePUT_PIXELFunc, Args);
      continue;
    }
    case ISA::BR_NOT: {
      Input >> Arg;
      Value *reg_p = builder.CreateConstGEP2_32(
          RegFileGlobalType, RegFileGlobal, 0, std::stoi(Arg.substr(1)));
      Value *Cond = builder.CreateTrunc(
          builder.CreateLoad(builder.getInt32Ty(), reg_p), builder.getInt1Ty());
      Input >> Arg;
      if (!BBMap.contains(Arg))
        failWithError(formatv("Unrecognized label {0}", Arg));
      Input >> TokenId;
      std::string BBName = TokenId.substr(0, TokenId.size() - 1);
      if (!BBMap.contains(BBName))
        failWithError(formatv("Unrecognized label {0}", BBName));
      builder.CreateCondBr(Cond, BBMap[BBName], BBMap[Arg]);
      builder.SetInsertPoint(BBMap[BBName]);
      continue;
    }
    case ISA::UPDATE_SCREEN: {
      builder.CreateCall(executeUPDATE_SCREENFunc);
      continue;
    }
    case ISA::EXIT: {
      builder.CreateRetVoid();
      if (Input >> TokenId)
        builder.SetInsertPoint(BBMap[TokenId]);
      continue;
    }
    default:
      failWithError("We can't be here");
    }
  }
}
