#include "llvm/IR/IRBuilder.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#define LAST_FUNC_NAME "exitApp"

namespace llvm {

struct TracePass : public PassInfoMixin<TracePass> {
  bool isCallback(StringRef Name) {
    return Name == "dumpTraceStat" || Name == "logOpcode";
  }

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
    for (auto &F : M) {
      if (isCallback(F.getName()) || F.isDeclaration())
        continue;

      // Prepare builder for IR modification
      LLVMContext &Ctx = F.getContext();
      IRBuilder<> builder(Ctx);
      Type *retType = Type::getVoidTy(Ctx);

      // Function for printing trace statistics after execution
      ArrayRef<Type *> NoParamType = {};
      FunctionType *NoParamFuncType =
          FunctionType::get(retType, NoParamType, false);
      FunctionCallee DumpTraceStatFunc =
          M.getOrInsertFunction("dumpTraceStat", NoParamFuncType);

      // Function for logging opcodes usage
      ArrayRef<Type *> LogOpcodeParamTypes = {
          builder.getInt8Ty()->getPointerTo()};
      FunctionType *LogOpcodeFuncType =
          FunctionType::get(retType, LogOpcodeParamTypes, false);
      FunctionCallee LogOpcodeFunc =
          M.getOrInsertFunction("logOpcode", LogOpcodeFuncType);

      // Insert opcode loggers for instructions and statistics print function
      for (auto &B : F) {
        for (auto &I : B) {
          if (auto *phi = dyn_cast<PHINode>(&I))
            continue;

          if (auto *Call = dyn_cast<CallInst>(&I)) {
            Function *Func = Call->getCalledFunction();
            if (Func && isCallback(Func->getName()))
              continue;
            if (Func && Func->getName() == LAST_FUNC_NAME) {
              builder.SetInsertPoint(&I);
              builder.CreateCall(DumpTraceStatFunc);
              continue;
            }
          }
          builder.SetInsertPoint(&I);
          Value *InstrLog = builder.CreateGlobalStringPtr(I.getOpcodeName());
          Value *Args[] = {InstrLog};
          builder.CreateCall(LogOpcodeFunc, Args);
        }
      }
    }
    return PreservedAnalyses::none();
  };
};

PassPluginLibraryInfo getPassPluginInfo() {
  const auto Callback = [](PassBuilder &PB) {
    PB.registerPipelineStartEPCallback([&](ModulePassManager &MPM, auto) {
      MPM.addPass(TracePass{});
      return true;
    });
  };

  return {LLVM_PLUGIN_API_VERSION, "TracePlugin", "0.0.1", Callback};
};

/* When a plugin is loaded by the driver, it will call this entry point to
obtain information about this plugin and about how to register its passes.
*/
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}

} // namespace llvm
