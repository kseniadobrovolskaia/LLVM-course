#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"

#include "GraphicalApp.h"

#define FILE_IR "OutputIR.dump"

using namespace llvm;

int main() {
  LLVMContext Ctx;
  // ; ModuleID = 'SnakeSimple.c'
  // source_filename = "SnakeSimple.c"
  Module *M = new Module("SnakeSimple.c", Ctx);
  IRBuilder<> Builder(Ctx);

  //____________________________DECLARATIONS_____________________________________

  // declare void @updateScreen(...) local_unnamed_addr #4
  Type *VoidType = Type::getVoidTy(Ctx);
  FunctionType *updateScreenType =
      FunctionType::get(VoidType, {VoidType}, false);
  FunctionCallee updateScreenFunc =
      M->getOrInsertFunction("updateScreen", updateScreenType);

  // declare void @putPixel(i32 noundef, i32 noundef, i32 noundef)
  // local_unnamed_addr #4
  ArrayRef<Type *> putPixelParamTypes = {
      Type::getInt32Ty(Ctx), Type::getInt32Ty(Ctx), Type::getInt32Ty(Ctx)};
  FunctionType *putPixelType =
      FunctionType::get(VoidType, putPixelParamTypes, false);
  FunctionCallee putPixelFunc =
      M->getOrInsertFunction("putPixel", putPixelType);

  //____________________________DEFINITIONS_____________________________________

  //__________________________FINALIZE_SNAKE____________________________________

  // define dso_local void @finalizeSnake() #0 {
  FunctionType *finalizeSnakeFuncType = FunctionType::get(VoidType, false);
  Function *finalizeSnakeFunc = Function::Create(
      finalizeSnakeFuncType, Function::ExternalLinkage, "finalizeSnake", M);

  auto *BB0 = BasicBlock::Create(Ctx, "", finalizeSnakeFunc);
  // 0:
  Builder.SetInsertPoint(BB0);
  //   unreachable
  // }
  Builder.CreateUnreachable();

  //______________________________PUT_CELLS____________________________________

  // ; Function Attrs: nounwind uwtable
  // define dso_local void @putCells(i32 noundef %0) local_unnamed_addr #1 {
  auto *putCellsType =
      FunctionType::get(VoidType, {Builder.getInt32Ty()}, false);
  auto *putCellsFunc =
      Function::Create(putCellsType, Function::ExternalLinkage, "putCells", M);

  auto *Val0 = putCellsFunc->getArg(0);

  BasicBlock *BB1 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB2 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB9 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB17 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB20 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB22 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB28 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB30 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB33 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB37 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB40 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB42 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB45 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB49 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB57 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB59 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB63 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB66 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB74 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB76 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB80 = BasicBlock::Create(Ctx, "", putCellsFunc);
  BasicBlock *BB83 = BasicBlock::Create(Ctx, "", putCellsFunc);

  // 1:
  Builder.SetInsertPoint(BB1);
  //   br label %2
  auto *br1 = Builder.CreateBr(BB2);
  // 2:                                                ; preds = %1, %17
  Builder.SetInsertPoint(BB2);
  //   %3 = phi i32 [ 0, %1 ], [ %18, %17 ]
  auto *Val3 = Builder.CreatePHI(Builder.getInt32Ty(), 2);
  //   %4 = shl nsw i32 %3, 5
  auto *Val4 = Builder.CreateShl(Val3, Builder.getInt32(5), "", false, true);
  //   %5 = shl i32 %3, 9
  auto *Val5 = Builder.CreateShl(Val3, Builder.getInt32(9));
  //   %6 = add nuw nsw i32 %5, 512
  auto *Val6 = Builder.CreateAdd(Val5, Builder.getInt32(512), "", true, true);
  //   %7 = lshr exact i32 %6, 4
  auto *Val7 = Builder.CreateLShr(Val6, Builder.getInt32(4), "", true);
  //   %8 = icmp ult i32 %4, %7
  auto *Val8 = Builder.CreateICmpULT(Val4, Val7);
  //   br label %20
  auto *br2 = Builder.CreateBr(BB20);
  // 9:                                                ; preds = %17
  Builder.SetInsertPoint(BB9);
  //   %10 = add i32 %0, 8
  auto *Val10 = Builder.CreateAdd(Val0, Builder.getInt32(8));
  //   %11 = srem i32 %10, 8
  auto *Val11 = Builder.CreateSRem(Val10, Builder.getInt32(8));
  //   %12 = shl nsw i32 %11, 5
  auto *Val12 = Builder.CreateShl(Val11, Builder.getInt32(5), "", false, true);
  //   %13 = shl nsw i32 %11, 8
  auto *Val13 = Builder.CreateShl(Val11, Builder.getInt32(8), "", false, true);
  //   %14 = add nsw i32 %13, 256
  auto *Val14 =
      Builder.CreateAdd(Val13, Builder.getInt32(256), "", false, true);
  //   %15 = sdiv i32 %14, 8
  auto *Val15 = Builder.CreateSDiv(Val14, Builder.getInt32(8));
  //   %16 = icmp slt i32 %12, %15
  auto *Val16 = Builder.CreateICmpSLT(Val12, Val15);
  //   br label %40
  Builder.CreateBr(BB40);
  // 17:                                               ; preds = %37
  Builder.SetInsertPoint(BB17);
  //   %18 = add nuw nsw i32 %3, 1
  auto *Val18 = Builder.CreateAdd(Val3, Builder.getInt32(1), "", true, true);
  //   %19 = icmp eq i32 %18, 16
  auto *Val19 = Builder.CreateICmpEQ(Val18, Builder.getInt32(16));
  //   br i1 %19, label %9, label %2, !llvm.loop !5
  Builder.CreateCondBr(Val19, BB9, BB2);
  // 20:                                               ; preds = %2, %37
  Builder.SetInsertPoint(BB20);
  //   %21 = phi i32 [ 0, %2 ], [ %38, %37 ]
  auto *Val21 = Builder.CreatePHI(Builder.getInt32Ty(), 2);
  //   br i1 %8, label %22, label %37
  Builder.CreateCondBr(Val8, BB22, BB37);
  // 22:                                               ; preds = %20
  Builder.SetInsertPoint(BB22);
  //   %23 = shl nuw nsw i32 %21, 5
  auto *Val23 = Builder.CreateShl(Val21, Builder.getInt32(5), "", true, true);
  //   %24 = shl nuw nsw i32 %21, 8
  auto *Val24 = Builder.CreateShl(Val21, Builder.getInt32(8), "", true, true);
  //   %25 = add nuw nsw i32 %24, 256
  auto *Val25 = Builder.CreateAdd(Val24, Builder.getInt32(256), "", true, true);
  //   %26 = lshr exact i32 %25, 3
  auto *Val26 = Builder.CreateLShr(Val25, Builder.getInt32(3), "", true);
  //   %27 = icmp ult i32 %23, %26
  auto *Val27 = Builder.CreateICmpULT(Val23, Val26);
  //   br label %28
  Builder.CreateBr(BB28);
  // 28:                                               ; preds = %30, %22
  Builder.SetInsertPoint(BB28);
  //   %29 = phi i32 [ %4, %22 ], [ %31, %30 ]
  auto *Val29 = Builder.CreatePHI(Builder.getInt32Ty(), 2);
  //   br i1 %27, label %33, label %30
  Builder.CreateCondBr(Val27, BB33, BB30);
  // 30:                                               ; preds = %33, %28
  Builder.SetInsertPoint(BB30);
  //   %31 = add nuw nsw i32 %29, 1
  auto *Val31 = Builder.CreateAdd(Val29, Builder.getInt32(1), "", true, true);
  //   %32 = icmp eq i32 %31, %7
  auto *Val32 = Builder.CreateICmpEQ(Val31, Val7);
  //   br i1 %32, label %37, label %28, !llvm.loop !7
  Builder.CreateCondBr(Val32, BB37, BB28);
  // 33:                                               ; preds = %28, %33
  Builder.SetInsertPoint(BB33);
  //   %34 = phi i32 [ %35, %33 ], [ %23, %28 ]
  auto *Val34 = Builder.CreatePHI(Builder.getInt32Ty(), 2);
  //   tail call void @putPixel(i32 noundef %29, i32 noundef %34, i32 noundef
  //   12187338) #3
  Value *args[] = {Val29, Val34, Builder.getInt32(12187338)};
  Builder.CreateCall(putPixelFunc, args);
  //   %35 = add nuw nsw i32 %34, 1
  auto *Val35 = Builder.CreateAdd(Val34, Builder.getInt32(1), "", true, true);
  //   %36 = icmp eq i32 %35, %26
  auto *Val36 = Builder.CreateICmpEQ(Val35, Val26);
  //   br i1 %36, label %30, label %33, !llvm.loop !8
  Builder.CreateCondBr(Val36, BB30, BB33);
  // 37:                                               ; preds = %30, %20
  Builder.SetInsertPoint(BB37);
  //   %38 = add nuw nsw i32 %21, 1
  auto *Val38 = Builder.CreateAdd(Val21, Builder.getInt32(1), "", true, true);
  //   %39 = icmp eq i32 %38, 8
  auto *Val39 = Builder.CreateICmpEQ(Val38, Builder.getInt32(8));
  //   br i1 %39, label %17, label %20, !llvm.loop !9
  Builder.CreateCondBr(Val39, BB17, BB20);
  // 40:                                               ; preds = %42, %9
  Builder.SetInsertPoint(BB40);
  //   %41 = phi i32 [ 160, %9 ], [ %43, %42 ]
  auto *Val41 = Builder.CreatePHI(Builder.getInt32Ty(), 2);
  //   br i1 %16, label %45, label %42
  Builder.CreateCondBr(Val16, BB45, BB42);
  // 42:                                               ; preds = %45, %40
  Builder.SetInsertPoint(BB42);
  //   %43 = add nuw nsw i32 %41, 1
  auto *Val43 = Builder.CreateAdd(Val41, Builder.getInt32(1), "", true, true);
  //   %44 = icmp eq i32 %43, 192
  auto *Val44 = Builder.CreateICmpEQ(Val43, Builder.getInt32(192));
  //   br i1 %44, label %49, label %40, !llvm.loop !7
  Builder.CreateCondBr(Val44, BB49, BB40);
  // 45:                                               ; preds = %40, %45
  Builder.SetInsertPoint(BB45);
  //   %46 = phi i32 [ %47, %45 ], [ %12, %40 ]
  auto *Val46 = Builder.CreatePHI(Builder.getInt32Ty(), 2);
  //   tail call void @putPixel(i32 noundef %41, i32 noundef %46, i32 noundef
  //   14794471) #3
  Value *args2[] = {Val41, Val46, Builder.getInt32(14794471)};
  Builder.CreateCall(putPixelFunc, args2);
  //   %47 = add nsw i32 %46, 1
  auto *Val47 = Builder.CreateAdd(Val46, Builder.getInt32(1), "", false, true);
  //   %48 = icmp eq i32 %47, %15
  auto *Val48 = Builder.CreateICmpEQ(Val47, Val15);
  //   br i1 %48, label %42, label %45, !llvm.loop !8
  Builder.CreateCondBr(Val48, BB42, BB45);
  // 49:                                               ; preds = %42
  Builder.SetInsertPoint(BB49);
  //   %50 = add i32 %0, 9
  auto *Val50 = Builder.CreateAdd(Val0, Builder.getInt32(9));
  //   %51 = srem i32 %50, 8
  auto *Val51 = Builder.CreateSRem(Val50, Builder.getInt32(8));
  //   %52 = shl nsw i32 %51, 5
  auto *Val52 = Builder.CreateShl(Val51, Builder.getInt32(5), "", false, true);
  //   %53 = shl nsw i32 %51, 8
  auto *Val53 = Builder.CreateShl(Val51, Builder.getInt32(8), "", false, true);
  //   %54 = add nsw i32 %53, 256
  auto *Val54 =
      Builder.CreateAdd(Val53, Builder.getInt32(256), "", false, true);
  //   %55 = sdiv i32 %54, 8
  auto *Val55 = Builder.CreateSDiv(Val54, Builder.getInt32(8));
  //   %56 = icmp slt i32 %52, %55
  auto *Val56 = Builder.CreateICmpSLT(Val52, Val55);
  //   br label %57
  Builder.CreateBr(BB57);
  // 57:                                               ; preds = %63, %49
  Builder.SetInsertPoint(BB57);
  //   %58 = phi i32 [ 160, %49 ], [ %64, %63 ]
  auto *Val58 = Builder.CreatePHI(Builder.getInt32Ty(), 2);
  //   br i1 %56, label %59, label %63
  Builder.CreateCondBr(Val56, BB59, BB63);
  // 59:                                               ; preds = %57, %59
  Builder.SetInsertPoint(BB59);
  //   %60 = phi i32 [ %61, %59 ], [ %52, %57 ]
  auto *Val60 = Builder.CreatePHI(Builder.getInt32Ty(), 2);
  //   tail call void @putPixel(i32 noundef %58, i32 noundef %60, i32 noundef
  //   14794471) #3
  Value *args3[] = {Val58, Val60, Builder.getInt32(14794471)};
  Builder.CreateCall(putPixelFunc, args3);
  //   %61 = add nsw i32 %60, 1
  auto *Val61 = Builder.CreateAdd(Val60, Builder.getInt32(1), "", false, true);
  //   %62 = icmp eq i32 %61, %55
  auto *Val62 = Builder.CreateICmpEQ(Val61, Val55);
  //   br i1 %62, label %63, label %59, !llvm.loop !8
  Builder.CreateCondBr(Val62, BB63, BB59);
  // 63:                                               ; preds = %59, %57
  Builder.SetInsertPoint(BB63);
  //   %64 = add nuw nsw i32 %58, 1
  auto *Val64 = Builder.CreateAdd(Val58, Builder.getInt32(1), "", true, true);
  //   %65 = icmp eq i32 %64, 192
  auto *Val65 = Builder.CreateICmpEQ(Val64, Builder.getInt32(192));
  //   br i1 %65, label %66, label %57, !llvm.loop !7
  Builder.CreateCondBr(Val65, BB66, BB57);
  // 66:                                               ; preds = %63
  Builder.SetInsertPoint(BB66);
  //   %67 = add i32 %0, 10
  auto *Val67 = Builder.CreateAdd(Val0, Builder.getInt32(10));
  //   %68 = srem i32 %67, 8
  auto *Val68 = Builder.CreateSRem(Val67, Builder.getInt32(8));
  //   %69 = shl nsw i32 %68, 5
  auto *Val69 = Builder.CreateShl(Val68, Builder.getInt32(5), "", false, true);
  //   %70 = shl nsw i32 %68, 8
  auto *Val70 = Builder.CreateShl(Val68, Builder.getInt32(8), "", false, true);
  //   %71 = add nsw i32 %70, 256
  auto *Val71 =
      Builder.CreateAdd(Val70, Builder.getInt32(256), "", false, true);
  //   %72 = sdiv i32 %71, 8
  auto *Val72 = Builder.CreateSDiv(Val71, Builder.getInt32(8));
  //   %73 = icmp slt i32 %69, %72
  auto *Val73 = Builder.CreateICmpSLT(Val69, Val72);
  //   br label %74
  Builder.CreateBr(BB74);
  // 74:                                               ; preds = %80, %66
  Builder.SetInsertPoint(BB74);
  //   %75 = phi i32 [ 160, %66 ], [ %81, %80 ]
  auto *Val75 = Builder.CreatePHI(Builder.getInt32Ty(), 2);
  //   br i1 %73, label %76, label %80
  Builder.CreateCondBr(Val73, BB76, BB80);
  // 76:                                               ; preds = %74, %76
  Builder.SetInsertPoint(BB76);
  //   %77 = phi i32 [ %78, %76 ], [ %69, %74 ]
  auto *Val77 = Builder.CreatePHI(Builder.getInt32Ty(), 2);
  //   tail call void @putPixel(i32 noundef %75, i32 noundef %77, i32 noundef
  //   14794471) #3
  Value *args4[] = {Val75, Val77, Builder.getInt32(14794471)};
  Builder.CreateCall(putPixelFunc, args4);
  //   %78 = add nsw i32 %77, 1
  auto *Val78 = Builder.CreateAdd(Val77, Builder.getInt32(1), "", false, true);
  //   %79 = icmp eq i32 %78, %72
  auto *Val79 = Builder.CreateICmpEQ(Val78, Val72);
  //   br i1 %79, label %80, label %76, !llvm.loop !8
  Builder.CreateCondBr(Val79, BB80, BB76);
  // 80:                                               ; preds = %76, %74
  Builder.SetInsertPoint(BB80);
  //   %81 = add nuw nsw i32 %75, 1
  auto *Val81 = Builder.CreateAdd(Val75, Builder.getInt32(1), "", true, true);
  //   %82 = icmp eq i32 %81, 192
  auto *Val82 = Builder.CreateICmpEQ(Val81, Builder.getInt32(192));
  //   br i1 %82, label %83, label %74, !llvm.loop !7
  Builder.CreateCondBr(Val82, BB83, BB74);
  // 83:                                               ; preds = %80
  Builder.SetInsertPoint(BB83);
  //   ret void
  // }
  Builder.CreateRetVoid();

  // Link PHI nodes
  //   %3 = phi i32 [ 0, %1 ], [ %18, %17 ]
  Val3->addIncoming(Builder.getInt32(0), BB1);
  Val3->addIncoming(Val18, BB17);
  //   %21 = phi i32 [ 0, %2 ], [ %38, %37 ]
  Val21->addIncoming(Builder.getInt32(0), BB2);
  Val21->addIncoming(Val38, BB37);
  //   %29 = phi i32 [ %4, %22 ], [ %31, %30 ]
  Val29->addIncoming(Val4, BB22);
  Val29->addIncoming(Val31, BB30);
  //   %34 = phi i32 [ %35, %33 ], [ %23, %28 ]
  Val34->addIncoming(Val35, BB33);
  Val34->addIncoming(Val23, BB28);
  //   %41 = phi i32 [ 160, %9 ], [ %43, %42 ]
  Val41->addIncoming(Builder.getInt32(160), BB9);
  Val41->addIncoming(Val43, BB42);
  //   %46 = phi i32 [ %47, %45 ], [ %12, %40 ]
  Val46->addIncoming(Val47, BB45);
  Val46->addIncoming(Val12, BB40);
  //   %58 = phi i32 [ 160, %49 ], [ %64, %63 ]
  Val58->addIncoming(Builder.getInt32(160), BB49);
  Val58->addIncoming(Val64, BB63);
  //   %60 = phi i32 [ %61, %59 ], [ %52, %57 ]
  Val60->addIncoming(Val61, BB59);
  Val60->addIncoming(Val52, BB57);
  //   %75 = phi i32 [ 160, %66 ], [ %81, %80 ]
  Val75->addIncoming(Builder.getInt32(160), BB66);
  Val75->addIncoming(Val81, BB80);
  //   %77 = phi i32 [ %78, %76 ], [ %69, %74 ]
  Val77->addIncoming(Val78, BB76);
  Val77->addIncoming(Val69, BB74);

  //______________________________RUN_SNAKE__________________________________________

  // ; Function Attrs: nounwind uwtable
  // define dso_local void @runSnake() local_unnamed_addr #1 {
  auto *runSnakeType = FunctionType::get(VoidType, false);
  auto *runSnakeFunc =
      Function::Create(runSnakeType, Function::ExternalLinkage, "runSnake", M);

  BasicBlock *BB81 = BasicBlock::Create(Ctx, "", runSnakeFunc);
  // 1:
  Builder.SetInsertPoint(BB81);

  //   tail call void @putCells(i32 noundef 1)
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(1)});
  //   tail call void (...) @updateScreen() #3
  Builder.CreateCall(updateScreenFunc);
  //   tail call void @putCells(i32 noundef 2)
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(2)});
  //   tail call void (...) @updateScreen() #3
  Builder.CreateCall(updateScreenFunc);
  //   tail call void @putCells(i32 noundef 3)
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(3)});
  //   tail call void (...) @updateScreen() #3
  Builder.CreateCall(updateScreenFunc);
  //   tail call void @putCells(i32 noundef 4)
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(4)});
  //   tail call void (...) @updateScreen() #3
  Builder.CreateCall(updateScreenFunc);
  //   tail call void @putCells(i32 noundef 5)
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(5)});
  //   tail call void (...) @updateScreen() #3
  Builder.CreateCall(updateScreenFunc);
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(6)});
  Builder.CreateCall(updateScreenFunc);
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(7)});
  Builder.CreateCall(updateScreenFunc);
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(8)});
  Builder.CreateCall(updateScreenFunc);
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(9)});
  Builder.CreateCall(updateScreenFunc);
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(10)});
  Builder.CreateCall(updateScreenFunc);
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(11)});
  Builder.CreateCall(updateScreenFunc);
  Builder.CreateCall(putCellsFunc, {Builder.getInt32(12)});
  Builder.CreateCall(updateScreenFunc);
  //   tail call void @finalizeSnake()
  Builder.CreateCall(finalizeSnakeFunc);
  //   ret void
  // }
  Builder.CreateRetVoid();

  //________________________________DUMP_IR________________________________________

  // Dump LLVM IR
  std::error_code EC;
  raw_fd_ostream OS(FILE_IR, EC);
  M->print(OS, nullptr);

  llvm::errs() << "LLVM IR в файле " << FILE_IR << "\n";

  //_____________________________INTERPRETATION____________________________________

  // LLVM IR Interpreter
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();

  ExecutionEngine *EE = EngineBuilder(std::unique_ptr<Module>(M)).create();
  EE->InstallLazyFunctionCreator([&](const std::string &FuncName) -> void * {
    if (FuncName == "updateScreen") {
      return reinterpret_cast<void *>(updateScreen);
    }
    if (FuncName == "putPixel") {
      return reinterpret_cast<void *>(putPixel);
    }
    return nullptr;
  });
  EE->finalizeObject();

  initApp();

  ArrayRef<GenericValue> NoArgs;
  EE->runFunction(runSnakeFunc, NoArgs);

  exitApp();
  return EXIT_SUCCESS;
}
