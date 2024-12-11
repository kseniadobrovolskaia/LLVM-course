#include <iostream>

#include "GraphicalApp.h"
#include "Lexems.h"
#include "Parser.tab.hh"

const char *IRFileName = "llvmIR.txt";

LLVMContext context;
IRBuilder<> *builder;
Module *module;
Function *curFunc;
FunctionCallee updateScreenFunc;
FunctionCallee putPixelFunc;
FunctionCallee printFunc;

std::map<std::string, value_t> ValueMap;
std::map<std::string, BasicBlock *> BBMap;

extern FILE *yyin;

int main(int argc, char **argv) {
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();

  // ; ModuleID = 'top'
  // source_filename = "top"
  module = new Module("top", context);
  builder = new IRBuilder<>(context);

  Type *voidType = Type::getVoidTy(context);
  // declare void @putPixel(i32 noundef, i32 noundef, i32 noundef)
  ArrayRef<Type *> putPixelParamTypes = {Type::getInt32Ty(context),
                                         Type::getInt32Ty(context),
                                         Type::getInt32Ty(context)};
  FunctionType *putPixelType =
      FunctionType::get(voidType, putPixelParamTypes, false);
  putPixelFunc = module->getOrInsertFunction("putPixel", putPixelType);

  // declare void @print(i32 noundef)
  FunctionType *printType = FunctionType::get(IntegerType::getInt32Ty(context), PointerType::get(Type::getInt8Ty(context), 0), true /* this is var arg func type*/);
  printFunc = module->getOrInsertFunction("printf", printType);
  
                                                   
  // declare void @updateScreen(...)
  FunctionType *updateScreenType = FunctionType::get(voidType, false);
  updateScreenFunc =
      module->getOrInsertFunction("updateScreen", updateScreenType);

  assert(argc > 1);
  yyin = fopen(argv[1], "r");
  yyparse();

  std::error_code EC;
  llvm::raw_fd_ostream IRFile(IRFileName, EC); 

  module->print(IRFile, nullptr);
  outs() << "\n";
  bool verif = verifyModule(*module, &outs());
  outs() << "[VERIFICATION] " << (!verif ? "OK\n\n" : "FAIL\n\n");

  // Interpreter of LLVM IR
  ExecutionEngine *ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
  ee->InstallLazyFunctionCreator([=](const std::string &fnName) -> void * {
    if (fnName == "updateScreen") {
      return reinterpret_cast<void *>(updateScreen);
    }
    if (fnName == "putPixel") {
      return reinterpret_cast<void *>(putPixel);
    }
    if (fnName == "print") {
      return reinterpret_cast<void *>(putPixel);
    }
    return nullptr;
  });

  for (auto &value : ValueMap) {
    ee->addGlobalMapping(value.second.irVal, &value.second.realVal);
  }
  ee->finalizeObject();

  initApp();

  std::vector<GenericValue> noargs;
  Function *mainFunc = module->getFunction("SsMain");
  if (mainFunc == nullptr) {
    outs() << "Can't find SsMain\n";
    return -1;
  }
  ee->runFunction(mainFunc, noargs);

  exitApp();
  return 0;
}
