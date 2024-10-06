; ModuleID = '/home/dobrovolskaya/Desktop/LLVM-course/lib/GraphicalApp/SnakeSimple.c'
source_filename = "/home/dobrovolskaya/Desktop/LLVM-course/lib/GraphicalApp/SnakeSimple.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [66 x i8] c"\D0\93\D0\BE\D1\81\D0\BF\D0\BE\D0\B4\D1\8C, \D0\BA\D0\B0\D0\BA \D0\B2\D0\B8\D0\B4\D0\BD\D0\BE, \D0\B7\D0\B0\D0\B1\D0\B8\D1\80\D0\B0\D0\B5\D1\82 \D0\BB\D1\83\D1\87\D1\88\D0\B8\D1\85.\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Unknown Choose\00", align 1
@0 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@1 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@2 = private unnamed_addr constant [5 x i8] c"lshr\00", align 1
@3 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@4 = private unnamed_addr constant [5 x i8] c"sdiv\00", align 1
@5 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@6 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@7 = private unnamed_addr constant [7 x i8] c"switch\00", align 1
@8 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@9 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@10 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@11 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@12 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@13 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@14 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@15 = private unnamed_addr constant [4 x i8] c"ret\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @runSnake() local_unnamed_addr #0 {
  call void @logOpcode(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @0, i32 0, i32 0))
  %1 = alloca i64, align 8
  call void @logOpcode(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @0, i32 0, i32 0))
  %2 = alloca [8 x [2 x i32]], align 16
  call void @logOpcode(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @1, i32 0, i32 0))
  %3 = bitcast [8 x [2 x i32]]* %2 to i8*
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %3) #4
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %3, i8 0, i64 64, i1 false)
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %4 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 0, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %5 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  %6 = tail call i32 (...) @getRand() #4
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %7 = srem i32 %6, 16
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  %8 = tail call i32 (...) @getRand() #4
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %9 = srem i32 %8, 8
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %7, i32* %4, align 16, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %10 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 0, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %9, i32* %10, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %11 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 1, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call fastcc void @fillNewCell(i32* noundef nonnull %11, i32* noundef nonnull %4, [2 x i32]* noundef nonnull %5) #4
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %12 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 2, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call fastcc void @fillNewCell(i32* noundef nonnull %12, i32* noundef nonnull %11, [2 x i32]* noundef nonnull %5) #4
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %13 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 3, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call fastcc void @fillNewCell(i32* noundef nonnull %13, i32* noundef nonnull %12, [2 x i32]* noundef nonnull %5) #4
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %14 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 4, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call fastcc void @fillNewCell(i32* noundef nonnull %14, i32* noundef nonnull %13, [2 x i32]* noundef nonnull %5) #4
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %15 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 5, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call fastcc void @fillNewCell(i32* noundef nonnull %15, i32* noundef nonnull %14, [2 x i32]* noundef nonnull %5) #4
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %16 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 6, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call fastcc void @fillNewCell(i32* noundef nonnull %16, i32* noundef nonnull %15, [2 x i32]* noundef nonnull %5) #4
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %17 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 7, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call fastcc void @fillNewCell(i32* noundef nonnull %17, i32* noundef nonnull %16, [2 x i32]* noundef nonnull %5) #4
  call void @logOpcode(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @1, i32 0, i32 0))
  %18 = bitcast i64* %1 to [2 x i32]*
  call void @logOpcode(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @1, i32 0, i32 0))
  %19 = bitcast i64* %1 to i8*
  call void @logOpcode(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @1, i32 0, i32 0))
  %20 = bitcast i64* %1 to i32*
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %21 = getelementptr inbounds [2 x i32], [2 x i32]* %18, i64 0, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %22

22:                                               ; preds = %0, %88
  %23 = phi i32 [ 0, %0 ], [ %89, %88 ]
  %24 = phi i32 [ 0, %0 ], [ %93, %88 ]
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %25

25:                                               ; preds = %32, %22
  %26 = phi i32 [ 0, %22 ], [ %33, %32 ]
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0))
  %27 = shl nuw nsw i32 %26, 5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0))
  %28 = shl nuw nsw i32 %26, 9
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %29 = add nuw nsw i32 %28, 512
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @2, i32 0, i32 0))
  %30 = lshr exact i32 %29, 4
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %31 = icmp ult i32 %27, %30
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %35

32:                                               ; preds = %52
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %33 = add nuw nsw i32 %26, 1
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %34 = icmp eq i32 %33, 16
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %34, label %55, label %25, !llvm.loop !9

35:                                               ; preds = %52, %25
  %36 = phi i32 [ 0, %25 ], [ %53, %52 ]
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %31, label %37, label %52

37:                                               ; preds = %35
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0))
  %38 = shl nuw nsw i32 %36, 5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0))
  %39 = shl nuw nsw i32 %36, 8
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %40 = add nuw nsw i32 %39, 256
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @2, i32 0, i32 0))
  %41 = lshr exact i32 %40, 3
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %42 = icmp ult i32 %38, %41
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %43

43:                                               ; preds = %45, %37
  %44 = phi i32 [ %27, %37 ], [ %46, %45 ]
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %42, label %48, label %45

45:                                               ; preds = %48, %43
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %46 = add nuw nsw i32 %44, 1
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %47 = icmp eq i32 %46, %30
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %47, label %52, label %43, !llvm.loop !11

48:                                               ; preds = %43, %48
  %49 = phi i32 [ %50, %48 ], [ %38, %43 ]
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call void @putPixel(i32 noundef %44, i32 noundef %49, i32 noundef 12187338) #4
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %50 = add nuw nsw i32 %49, 1
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %51 = icmp eq i32 %50, %41
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %51, label %45, label %48, !llvm.loop !12

52:                                               ; preds = %45, %35
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %53 = add nuw nsw i32 %36, 1
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %54 = icmp eq i32 %53, 8
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %54, label %32, label %35, !llvm.loop !13

55:                                               ; preds = %32, %85
  %56 = phi i64 [ %86, %85 ], [ 0, %32 ]
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %57 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %56, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %58 = load i32, i32* %57, align 8, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %59 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %56, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %60 = load i32, i32* %59, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %61 = add nsw i32 %58, 16
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %62 = srem i32 %61, 16
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %63 = add nsw i32 %60, 8
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %64 = srem i32 %63, 8
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0))
  %65 = shl nsw i32 %62, 5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0))
  %66 = shl nsw i32 %62, 9
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %67 = add nsw i32 %66, 512
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @4, i32 0, i32 0))
  %68 = sdiv i32 %67, 16
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %69 = icmp slt i32 %65, %68
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %69, label %70, label %85

70:                                               ; preds = %55
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0))
  %71 = shl nsw i32 %64, 5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0))
  %72 = shl nsw i32 %64, 8
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %73 = add nsw i32 %72, 256
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @4, i32 0, i32 0))
  %74 = sdiv i32 %73, 8
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %75 = icmp slt i32 %71, %74
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %76

76:                                               ; preds = %78, %70
  %77 = phi i32 [ %65, %70 ], [ %79, %78 ]
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %75, label %81, label %78

78:                                               ; preds = %81, %76
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %79 = add nsw i32 %77, 1
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %80 = icmp eq i32 %79, %68
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %80, label %85, label %76, !llvm.loop !11

81:                                               ; preds = %76, %81
  %82 = phi i32 [ %83, %81 ], [ %71, %76 ]
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call void @putPixel(i32 noundef %77, i32 noundef %82, i32 noundef 14794471) #4
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %83 = add nsw i32 %82, 1
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %84 = icmp eq i32 %83, %74
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %84, label %78, label %81, !llvm.loop !12

85:                                               ; preds = %78, %55
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %86 = add nuw nsw i64 %56, 1
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %87 = icmp eq i64 %86, 8
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %87, label %88, label %55, !llvm.loop !14

88:                                               ; preds = %85
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %89 = add nuw nsw i32 %23, 1
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %19) #4
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i64 0, i64* %1, align 8
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @5, i32 0, i32 0))
  %90 = zext i32 %24 to i64
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %91 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %90, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call fastcc void @fillNewCell(i32* noundef nonnull %20, i32* noundef nonnull %91, [2 x i32]* noundef nonnull %5) #4
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %92 = add nsw i32 %24, 7
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %93 = srem i32 %92, 8
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %94 = load i32, i32* %20, align 8, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @5, i32 0, i32 0))
  %95 = zext i32 %93 to i64
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %96 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %95, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %94, i32* %96, align 8, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %97 = load i32, i32* %21, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %98 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %95, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %97, i32* %98, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %19) #4
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call void (...) @updateScreen() #4
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %99 = icmp eq i32 %89, 5
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %99, label %100, label %22, !llvm.loop !15

100:                                              ; preds = %88
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %3) #4
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @15, i32 0, i32 0))
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @updateScreen(...) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare i32 @getRand(...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define internal fastcc void @fillNewCell(i32* nocapture noundef writeonly %0, i32* nocapture noundef readonly %1, [2 x i32]* noundef readonly %2) unnamed_addr #0 {
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  %4 = tail call i32 (...) @getRand() #4
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %5 = getelementptr inbounds i32, i32* %1, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %6 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 0, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %7 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 0, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %8 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 1, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %9 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 1, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %10 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 2, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %11 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 2, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %12 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 3, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %13 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 3, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %14 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 4, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %15 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 4, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %16 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 5, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %17 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 5, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %18 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 6, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %19 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 6, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %20 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 7, i64 0
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %21 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 7, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %22

22:                                               ; preds = %245, %3
  %23 = phi i32 [ %4, %3 ], [ %247, %245 ]
  %24 = phi i32 [ 4, %3 ], [ %246, %245 ]
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %25 = srem i32 %23, 4
  call void @logOpcode(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @7, i32 0, i32 0))
  switch i32 %25, label %242 [
    i32 0, label %26
    i32 1, label %80
    i32 2, label %134
    i32 3, label %188
  ]

26:                                               ; preds = %22
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %27 = load i32, i32* %1, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %28 = load i32, i32* %5, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %29 = add nsw i32 %27, 15
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %30 = srem i32 %29, 16
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %31 = add nsw i32 %28, 8
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %32 = srem i32 %31, 8
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %33 = load i32, i32* %6, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %34 = icmp eq i32 %33, %30
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %34, label %35, label %38

35:                                               ; preds = %26
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %36 = load i32, i32* %7, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %37 = icmp eq i32 %36, %32
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %37, label %243, label %38

38:                                               ; preds = %35, %26
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %39 = load i32, i32* %8, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %40 = icmp eq i32 %39, %30
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %40, label %41, label %44

41:                                               ; preds = %38
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %42 = load i32, i32* %9, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %43 = icmp eq i32 %42, %32
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %43, label %243, label %44

44:                                               ; preds = %41, %38
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %45 = load i32, i32* %10, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %46 = icmp eq i32 %45, %30
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %46, label %47, label %50

47:                                               ; preds = %44
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %48 = load i32, i32* %11, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %49 = icmp eq i32 %48, %32
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %49, label %243, label %50

50:                                               ; preds = %47, %44
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %51 = load i32, i32* %12, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %52 = icmp eq i32 %51, %30
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %52, label %53, label %56

53:                                               ; preds = %50
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %54 = load i32, i32* %13, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %55 = icmp eq i32 %54, %32
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %55, label %243, label %56

56:                                               ; preds = %53, %50
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %57 = load i32, i32* %14, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %58 = icmp eq i32 %57, %30
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %58, label %59, label %62

59:                                               ; preds = %56
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %60 = load i32, i32* %15, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %61 = icmp eq i32 %60, %32
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %61, label %243, label %62

62:                                               ; preds = %59, %56
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %63 = load i32, i32* %16, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %64 = icmp eq i32 %63, %30
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %64, label %65, label %68

65:                                               ; preds = %62
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %66 = load i32, i32* %17, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %67 = icmp eq i32 %66, %32
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %67, label %243, label %68

68:                                               ; preds = %65, %62
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %69 = load i32, i32* %18, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %70 = icmp eq i32 %69, %30
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %70, label %71, label %74

71:                                               ; preds = %68
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %72 = load i32, i32* %19, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %73 = icmp eq i32 %72, %32
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %73, label %243, label %74

74:                                               ; preds = %71, %68
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %75 = load i32, i32* %20, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %76 = icmp eq i32 %75, %30
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %76, label %77, label %261

77:                                               ; preds = %74
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %78 = load i32, i32* %21, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %79 = icmp eq i32 %78, %32
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %79, label %243, label %261

80:                                               ; preds = %22
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %81 = load i32, i32* %1, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %82 = load i32, i32* %5, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %83 = add nsw i32 %81, 16
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %84 = srem i32 %83, 16
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %85 = add nsw i32 %82, 9
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %86 = srem i32 %85, 8
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %87 = load i32, i32* %6, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %88 = icmp eq i32 %87, %84
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %88, label %89, label %92

89:                                               ; preds = %80
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %90 = load i32, i32* %7, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %91 = icmp eq i32 %90, %86
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %91, label %243, label %92

92:                                               ; preds = %89, %80
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %93 = load i32, i32* %8, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %94 = icmp eq i32 %93, %84
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %94, label %95, label %98

95:                                               ; preds = %92
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %96 = load i32, i32* %9, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %97 = icmp eq i32 %96, %86
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %97, label %243, label %98

98:                                               ; preds = %95, %92
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %99 = load i32, i32* %10, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %100 = icmp eq i32 %99, %84
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %100, label %101, label %104

101:                                              ; preds = %98
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %102 = load i32, i32* %11, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %103 = icmp eq i32 %102, %86
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %103, label %243, label %104

104:                                              ; preds = %101, %98
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %105 = load i32, i32* %12, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %106 = icmp eq i32 %105, %84
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %106, label %107, label %110

107:                                              ; preds = %104
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %108 = load i32, i32* %13, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %109 = icmp eq i32 %108, %86
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %109, label %243, label %110

110:                                              ; preds = %107, %104
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %111 = load i32, i32* %14, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %112 = icmp eq i32 %111, %84
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %112, label %113, label %116

113:                                              ; preds = %110
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %114 = load i32, i32* %15, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %115 = icmp eq i32 %114, %86
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %115, label %243, label %116

116:                                              ; preds = %113, %110
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %117 = load i32, i32* %16, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %118 = icmp eq i32 %117, %84
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %118, label %119, label %122

119:                                              ; preds = %116
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %120 = load i32, i32* %17, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %121 = icmp eq i32 %120, %86
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %121, label %243, label %122

122:                                              ; preds = %119, %116
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %123 = load i32, i32* %18, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %124 = icmp eq i32 %123, %84
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %124, label %125, label %128

125:                                              ; preds = %122
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %126 = load i32, i32* %19, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %127 = icmp eq i32 %126, %86
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %127, label %243, label %128

128:                                              ; preds = %125, %122
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %129 = load i32, i32* %20, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %130 = icmp eq i32 %129, %84
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %130, label %131, label %265

131:                                              ; preds = %128
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %132 = load i32, i32* %21, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %133 = icmp eq i32 %132, %86
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %133, label %243, label %265

134:                                              ; preds = %22
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %135 = load i32, i32* %1, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %136 = load i32, i32* %5, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %137 = add nsw i32 %135, 17
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %138 = srem i32 %137, 16
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %139 = add nsw i32 %136, 8
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %140 = srem i32 %139, 8
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %141 = load i32, i32* %6, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %142 = icmp eq i32 %141, %138
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %142, label %143, label %146

143:                                              ; preds = %134
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %144 = load i32, i32* %7, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %145 = icmp eq i32 %144, %140
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %145, label %243, label %146

146:                                              ; preds = %143, %134
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %147 = load i32, i32* %8, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %148 = icmp eq i32 %147, %138
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %148, label %149, label %152

149:                                              ; preds = %146
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %150 = load i32, i32* %9, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %151 = icmp eq i32 %150, %140
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %151, label %243, label %152

152:                                              ; preds = %149, %146
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %153 = load i32, i32* %10, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %154 = icmp eq i32 %153, %138
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %154, label %155, label %158

155:                                              ; preds = %152
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %156 = load i32, i32* %11, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %157 = icmp eq i32 %156, %140
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %157, label %243, label %158

158:                                              ; preds = %155, %152
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %159 = load i32, i32* %12, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %160 = icmp eq i32 %159, %138
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %160, label %161, label %164

161:                                              ; preds = %158
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %162 = load i32, i32* %13, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %163 = icmp eq i32 %162, %140
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %163, label %243, label %164

164:                                              ; preds = %161, %158
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %165 = load i32, i32* %14, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %166 = icmp eq i32 %165, %138
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %166, label %167, label %170

167:                                              ; preds = %164
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %168 = load i32, i32* %15, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %169 = icmp eq i32 %168, %140
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %169, label %243, label %170

170:                                              ; preds = %167, %164
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %171 = load i32, i32* %16, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %172 = icmp eq i32 %171, %138
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %172, label %173, label %176

173:                                              ; preds = %170
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %174 = load i32, i32* %17, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %175 = icmp eq i32 %174, %140
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %175, label %243, label %176

176:                                              ; preds = %173, %170
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %177 = load i32, i32* %18, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %178 = icmp eq i32 %177, %138
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %178, label %179, label %182

179:                                              ; preds = %176
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %180 = load i32, i32* %19, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %181 = icmp eq i32 %180, %140
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %181, label %243, label %182

182:                                              ; preds = %179, %176
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %183 = load i32, i32* %20, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %184 = icmp eq i32 %183, %138
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %184, label %185, label %271

185:                                              ; preds = %182
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %186 = load i32, i32* %21, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %187 = icmp eq i32 %186, %140
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %187, label %243, label %271

188:                                              ; preds = %22
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %189 = load i32, i32* %1, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %190 = load i32, i32* %5, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %191 = add nsw i32 %189, 16
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %192 = srem i32 %191, 16
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %193 = add nsw i32 %190, 7
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %194 = srem i32 %193, 8
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %195 = load i32, i32* %6, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %196 = icmp eq i32 %195, %192
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %196, label %197, label %200

197:                                              ; preds = %188
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %198 = load i32, i32* %7, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %199 = icmp eq i32 %198, %194
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %199, label %243, label %200

200:                                              ; preds = %197, %188
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %201 = load i32, i32* %8, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %202 = icmp eq i32 %201, %192
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %202, label %203, label %206

203:                                              ; preds = %200
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %204 = load i32, i32* %9, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %205 = icmp eq i32 %204, %194
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %205, label %243, label %206

206:                                              ; preds = %203, %200
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %207 = load i32, i32* %10, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %208 = icmp eq i32 %207, %192
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %208, label %209, label %212

209:                                              ; preds = %206
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %210 = load i32, i32* %11, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %211 = icmp eq i32 %210, %194
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %211, label %243, label %212

212:                                              ; preds = %209, %206
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %213 = load i32, i32* %12, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %214 = icmp eq i32 %213, %192
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %214, label %215, label %218

215:                                              ; preds = %212
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %216 = load i32, i32* %13, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %217 = icmp eq i32 %216, %194
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %217, label %243, label %218

218:                                              ; preds = %215, %212
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %219 = load i32, i32* %14, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %220 = icmp eq i32 %219, %192
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %220, label %221, label %224

221:                                              ; preds = %218
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %222 = load i32, i32* %15, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %223 = icmp eq i32 %222, %194
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %223, label %243, label %224

224:                                              ; preds = %221, %218
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %225 = load i32, i32* %16, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %226 = icmp eq i32 %225, %192
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %226, label %227, label %230

227:                                              ; preds = %224
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %228 = load i32, i32* %17, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %229 = icmp eq i32 %228, %194
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %229, label %243, label %230

230:                                              ; preds = %227, %224
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %231 = load i32, i32* %18, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %232 = icmp eq i32 %231, %192
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %232, label %233, label %236

233:                                              ; preds = %230
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %234 = load i32, i32* %19, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %235 = icmp eq i32 %234, %194
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %235, label %243, label %236

236:                                              ; preds = %233, %230
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %237 = load i32, i32* %20, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %238 = icmp eq i32 %237, %192
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %238, label %239, label %275

239:                                              ; preds = %236
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %240 = load i32, i32* %21, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %241 = icmp eq i32 %240, %194
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %241, label %243, label %275

242:                                              ; preds = %22
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  tail call void @failWithError(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0)) #4
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %243

243:                                              ; preds = %242, %35, %41, %47, %53, %59, %65, %71, %77, %89, %95, %101, %107, %113, %119, %125, %131, %143, %149, %155, %161, %167, %173, %179, %185, %197, %203, %209, %215, %221, %227, %233, %239
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0))
  %244 = icmp ugt i32 %24, 1
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br i1 %244, label %245, label %248

245:                                              ; preds = %243
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %246 = add nsw i32 %24, -1
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %247 = add nsw i32 %25, 1
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %22, !llvm.loop !16

248:                                              ; preds = %243
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  tail call void @failWithError(i8* noundef getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i64 0, i64 0)) #4
  call void @logOpcode(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @7, i32 0, i32 0))
  switch i32 %25, label %281 [
    i32 0, label %249
    i32 1, label %253
    i32 2, label %255
    i32 3, label %259
  ]

249:                                              ; preds = %248
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %250 = load i32, i32* %1, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %251 = add nsw i32 %250, 15
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %252 = srem i32 %251, 16
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %261

253:                                              ; preds = %248
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %254 = load i32, i32* %1, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %265

255:                                              ; preds = %248
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %256 = load i32, i32* %1, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %257 = add nsw i32 %256, 17
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %258 = srem i32 %257, 16
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %271

259:                                              ; preds = %248
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %260 = load i32, i32* %1, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %275

261:                                              ; preds = %77, %74, %249
  %262 = phi i32 [ %252, %249 ], [ %30, %74 ], [ %30, %77 ]
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %262, i32* %0, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %263 = load i32, i32* %5, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %264 = getelementptr inbounds i32, i32* %0, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %263, i32* %264, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %282

265:                                              ; preds = %131, %128, %253
  %266 = phi i32 [ %254, %253 ], [ %81, %128 ], [ %81, %131 ]
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %266, i32* %0, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %267 = load i32, i32* %5, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %268 = add nsw i32 %267, 9
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %269 = srem i32 %268, 8
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %270 = getelementptr inbounds i32, i32* %0, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %269, i32* %270, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %282

271:                                              ; preds = %185, %182, %255
  %272 = phi i32 [ %258, %255 ], [ %138, %182 ], [ %138, %185 ]
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %272, i32* %0, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %273 = load i32, i32* %5, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %274 = getelementptr inbounds i32, i32* %0, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %273, i32* %274, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %282

275:                                              ; preds = %239, %236, %259
  %276 = phi i32 [ %260, %259 ], [ %189, %236 ], [ %189, %239 ]
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %276, i32* %0, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  %277 = load i32, i32* %5, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  %278 = add nsw i32 %277, 7
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0))
  %279 = srem i32 %278, 8
  call void @logOpcode(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0))
  %280 = getelementptr inbounds i32, i32* %0, i64 1
  call void @logOpcode(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0))
  store i32 %279, i32* %280, align 4, !tbaa !5
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %282

281:                                              ; preds = %248
  call void @logOpcode(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0))
  tail call void @failWithError(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0)) #4
  call void @logOpcode(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0))
  br label %282

282:                                              ; preds = %265, %275, %281, %271, %261
  call void @logOpcode(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @15, i32 0, i32 0))
  ret void
}

declare void @failWithError(i8* noundef) local_unnamed_addr #3

declare void @putPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

declare void @logOpcode(i8*)

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !10}
