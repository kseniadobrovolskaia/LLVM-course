; ModuleID = '/home/dobrovolskaya/Desktop/LLVM-course/lib/GraphicalApp/SnakeSimple.c'
source_filename = "/home/dobrovolskaya/Desktop/LLVM-course/lib/GraphicalApp/SnakeSimple.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [66 x i8] c"\D0\93\D0\BE\D1\81\D0\BF\D0\BE\D0\B4\D1\8C, \D0\BA\D0\B0\D0\BA \D0\B2\D0\B8\D0\B4\D0\BD\D0\BE, \D0\B7\D0\B0\D0\B1\D0\B8\D1\80\D0\B0\D0\B5\D1\82 \D0\BB\D1\83\D1\87\D1\88\D0\B8\D1\85.\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Unknown Choose\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @runSnake() local_unnamed_addr #0 {
  %1 = alloca i64, align 8
  %2 = alloca [8 x [2 x i32]], align 16
  %3 = bitcast [8 x [2 x i32]]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %3) #4
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %3, i8 0, i64 64, i1 false)
  %4 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 0, i64 0
  %5 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 0
  %6 = tail call i32 (...) @getRand() #4
  %7 = srem i32 %6, 16
  %8 = tail call i32 (...) @getRand() #4
  %9 = srem i32 %8, 8
  store i32 %7, i32* %4, align 16, !tbaa !5
  %10 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 0, i64 1
  store i32 %9, i32* %10, align 4, !tbaa !5
  %11 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 1, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %11, i32* noundef nonnull %4, [2 x i32]* noundef nonnull %5) #4
  %12 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 2, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %12, i32* noundef nonnull %11, [2 x i32]* noundef nonnull %5) #4
  %13 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 3, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %13, i32* noundef nonnull %12, [2 x i32]* noundef nonnull %5) #4
  %14 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 4, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %14, i32* noundef nonnull %13, [2 x i32]* noundef nonnull %5) #4
  %15 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 5, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %15, i32* noundef nonnull %14, [2 x i32]* noundef nonnull %5) #4
  %16 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 6, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %16, i32* noundef nonnull %15, [2 x i32]* noundef nonnull %5) #4
  %17 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 7, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %17, i32* noundef nonnull %16, [2 x i32]* noundef nonnull %5) #4
  %18 = bitcast i64* %1 to [2 x i32]*
  %19 = bitcast i64* %1 to i8*
  %20 = bitcast i64* %1 to i32*
  %21 = getelementptr inbounds [2 x i32], [2 x i32]* %18, i64 0, i64 1
  br label %22

22:                                               ; preds = %0, %88
  %23 = phi i32 [ 0, %0 ], [ %89, %88 ]
  %24 = phi i32 [ 0, %0 ], [ %93, %88 ]
  br label %25

25:                                               ; preds = %32, %22
  %26 = phi i32 [ 0, %22 ], [ %33, %32 ]
  %27 = shl nuw nsw i32 %26, 5
  %28 = shl nuw nsw i32 %26, 9
  %29 = add nuw nsw i32 %28, 512
  %30 = lshr exact i32 %29, 4
  %31 = icmp ult i32 %27, %30
  br label %35

32:                                               ; preds = %52
  %33 = add nuw nsw i32 %26, 1
  %34 = icmp eq i32 %33, 16
  br i1 %34, label %55, label %25, !llvm.loop !9

35:                                               ; preds = %52, %25
  %36 = phi i32 [ 0, %25 ], [ %53, %52 ]
  br i1 %31, label %37, label %52

37:                                               ; preds = %35
  %38 = shl nuw nsw i32 %36, 5
  %39 = shl nuw nsw i32 %36, 8
  %40 = add nuw nsw i32 %39, 256
  %41 = lshr exact i32 %40, 3
  %42 = icmp ult i32 %38, %41
  br label %43

43:                                               ; preds = %45, %37
  %44 = phi i32 [ %27, %37 ], [ %46, %45 ]
  br i1 %42, label %48, label %45

45:                                               ; preds = %48, %43
  %46 = add nuw nsw i32 %44, 1
  %47 = icmp eq i32 %46, %30
  br i1 %47, label %52, label %43, !llvm.loop !11

48:                                               ; preds = %43, %48
  %49 = phi i32 [ %50, %48 ], [ %38, %43 ]
  call void @putPixel(i32 noundef %44, i32 noundef %49, i32 noundef 12187338) #4
  %50 = add nuw nsw i32 %49, 1
  %51 = icmp eq i32 %50, %41
  br i1 %51, label %45, label %48, !llvm.loop !12

52:                                               ; preds = %45, %35
  %53 = add nuw nsw i32 %36, 1
  %54 = icmp eq i32 %53, 8
  br i1 %54, label %32, label %35, !llvm.loop !13

55:                                               ; preds = %32, %85
  %56 = phi i64 [ %86, %85 ], [ 0, %32 ]
  %57 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %56, i64 0
  %58 = load i32, i32* %57, align 8, !tbaa !5
  %59 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %56, i64 1
  %60 = load i32, i32* %59, align 4, !tbaa !5
  %61 = add nsw i32 %58, 16
  %62 = srem i32 %61, 16
  %63 = add nsw i32 %60, 8
  %64 = srem i32 %63, 8
  %65 = shl nsw i32 %62, 5
  %66 = shl nsw i32 %62, 9
  %67 = add nsw i32 %66, 512
  %68 = sdiv i32 %67, 16
  %69 = icmp slt i32 %65, %68
  br i1 %69, label %70, label %85

70:                                               ; preds = %55
  %71 = shl nsw i32 %64, 5
  %72 = shl nsw i32 %64, 8
  %73 = add nsw i32 %72, 256
  %74 = sdiv i32 %73, 8
  %75 = icmp slt i32 %71, %74
  br label %76

76:                                               ; preds = %78, %70
  %77 = phi i32 [ %65, %70 ], [ %79, %78 ]
  br i1 %75, label %81, label %78

78:                                               ; preds = %81, %76
  %79 = add nsw i32 %77, 1
  %80 = icmp eq i32 %79, %68
  br i1 %80, label %85, label %76, !llvm.loop !11

81:                                               ; preds = %76, %81
  %82 = phi i32 [ %83, %81 ], [ %71, %76 ]
  call void @putPixel(i32 noundef %77, i32 noundef %82, i32 noundef 14794471) #4
  %83 = add nsw i32 %82, 1
  %84 = icmp eq i32 %83, %74
  br i1 %84, label %78, label %81, !llvm.loop !12

85:                                               ; preds = %78, %55
  %86 = add nuw nsw i64 %56, 1
  %87 = icmp eq i64 %86, 8
  br i1 %87, label %88, label %55, !llvm.loop !14

88:                                               ; preds = %85
  %89 = add nuw nsw i32 %23, 1
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %19) #4
  store i64 0, i64* %1, align 8
  %90 = zext i32 %24 to i64
  %91 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %90, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %20, i32* noundef nonnull %91, [2 x i32]* noundef nonnull %5) #4
  %92 = add nsw i32 %24, 7
  %93 = srem i32 %92, 8
  %94 = load i32, i32* %20, align 8, !tbaa !5
  %95 = zext i32 %93 to i64
  %96 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %95, i64 0
  store i32 %94, i32* %96, align 8, !tbaa !5
  %97 = load i32, i32* %21, align 4, !tbaa !5
  %98 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %95, i64 1
  store i32 %97, i32* %98, align 4, !tbaa !5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %19) #4
  call void (...) @updateScreen() #4
  %99 = icmp eq i32 %89, 5
  br i1 %99, label %100, label %22, !llvm.loop !15

100:                                              ; preds = %88
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %3) #4
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
  %4 = tail call i32 (...) @getRand() #4
  %5 = getelementptr inbounds i32, i32* %1, i64 1
  %6 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 0, i64 0
  %7 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 0, i64 1
  %8 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 1, i64 0
  %9 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 1, i64 1
  %10 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 2, i64 0
  %11 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 2, i64 1
  %12 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 3, i64 0
  %13 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 3, i64 1
  %14 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 4, i64 0
  %15 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 4, i64 1
  %16 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 5, i64 0
  %17 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 5, i64 1
  %18 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 6, i64 0
  %19 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 6, i64 1
  %20 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 7, i64 0
  %21 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i64 7, i64 1
  br label %22

22:                                               ; preds = %245, %3
  %23 = phi i32 [ %4, %3 ], [ %247, %245 ]
  %24 = phi i32 [ 4, %3 ], [ %246, %245 ]
  %25 = srem i32 %23, 4
  switch i32 %25, label %242 [
    i32 0, label %26
    i32 1, label %80
    i32 2, label %134
    i32 3, label %188
  ]

26:                                               ; preds = %22
  %27 = load i32, i32* %1, align 4, !tbaa !5
  %28 = load i32, i32* %5, align 4, !tbaa !5
  %29 = add nsw i32 %27, 15
  %30 = srem i32 %29, 16
  %31 = add nsw i32 %28, 8
  %32 = srem i32 %31, 8
  %33 = load i32, i32* %6, align 4, !tbaa !5
  %34 = icmp eq i32 %33, %30
  br i1 %34, label %35, label %38

35:                                               ; preds = %26
  %36 = load i32, i32* %7, align 4, !tbaa !5
  %37 = icmp eq i32 %36, %32
  br i1 %37, label %243, label %38

38:                                               ; preds = %35, %26
  %39 = load i32, i32* %8, align 4, !tbaa !5
  %40 = icmp eq i32 %39, %30
  br i1 %40, label %41, label %44

41:                                               ; preds = %38
  %42 = load i32, i32* %9, align 4, !tbaa !5
  %43 = icmp eq i32 %42, %32
  br i1 %43, label %243, label %44

44:                                               ; preds = %41, %38
  %45 = load i32, i32* %10, align 4, !tbaa !5
  %46 = icmp eq i32 %45, %30
  br i1 %46, label %47, label %50

47:                                               ; preds = %44
  %48 = load i32, i32* %11, align 4, !tbaa !5
  %49 = icmp eq i32 %48, %32
  br i1 %49, label %243, label %50

50:                                               ; preds = %47, %44
  %51 = load i32, i32* %12, align 4, !tbaa !5
  %52 = icmp eq i32 %51, %30
  br i1 %52, label %53, label %56

53:                                               ; preds = %50
  %54 = load i32, i32* %13, align 4, !tbaa !5
  %55 = icmp eq i32 %54, %32
  br i1 %55, label %243, label %56

56:                                               ; preds = %53, %50
  %57 = load i32, i32* %14, align 4, !tbaa !5
  %58 = icmp eq i32 %57, %30
  br i1 %58, label %59, label %62

59:                                               ; preds = %56
  %60 = load i32, i32* %15, align 4, !tbaa !5
  %61 = icmp eq i32 %60, %32
  br i1 %61, label %243, label %62

62:                                               ; preds = %59, %56
  %63 = load i32, i32* %16, align 4, !tbaa !5
  %64 = icmp eq i32 %63, %30
  br i1 %64, label %65, label %68

65:                                               ; preds = %62
  %66 = load i32, i32* %17, align 4, !tbaa !5
  %67 = icmp eq i32 %66, %32
  br i1 %67, label %243, label %68

68:                                               ; preds = %65, %62
  %69 = load i32, i32* %18, align 4, !tbaa !5
  %70 = icmp eq i32 %69, %30
  br i1 %70, label %71, label %74

71:                                               ; preds = %68
  %72 = load i32, i32* %19, align 4, !tbaa !5
  %73 = icmp eq i32 %72, %32
  br i1 %73, label %243, label %74

74:                                               ; preds = %71, %68
  %75 = load i32, i32* %20, align 4, !tbaa !5
  %76 = icmp eq i32 %75, %30
  br i1 %76, label %77, label %261

77:                                               ; preds = %74
  %78 = load i32, i32* %21, align 4, !tbaa !5
  %79 = icmp eq i32 %78, %32
  br i1 %79, label %243, label %261

80:                                               ; preds = %22
  %81 = load i32, i32* %1, align 4, !tbaa !5
  %82 = load i32, i32* %5, align 4, !tbaa !5
  %83 = add nsw i32 %81, 16
  %84 = srem i32 %83, 16
  %85 = add nsw i32 %82, 9
  %86 = srem i32 %85, 8
  %87 = load i32, i32* %6, align 4, !tbaa !5
  %88 = icmp eq i32 %87, %84
  br i1 %88, label %89, label %92

89:                                               ; preds = %80
  %90 = load i32, i32* %7, align 4, !tbaa !5
  %91 = icmp eq i32 %90, %86
  br i1 %91, label %243, label %92

92:                                               ; preds = %89, %80
  %93 = load i32, i32* %8, align 4, !tbaa !5
  %94 = icmp eq i32 %93, %84
  br i1 %94, label %95, label %98

95:                                               ; preds = %92
  %96 = load i32, i32* %9, align 4, !tbaa !5
  %97 = icmp eq i32 %96, %86
  br i1 %97, label %243, label %98

98:                                               ; preds = %95, %92
  %99 = load i32, i32* %10, align 4, !tbaa !5
  %100 = icmp eq i32 %99, %84
  br i1 %100, label %101, label %104

101:                                              ; preds = %98
  %102 = load i32, i32* %11, align 4, !tbaa !5
  %103 = icmp eq i32 %102, %86
  br i1 %103, label %243, label %104

104:                                              ; preds = %101, %98
  %105 = load i32, i32* %12, align 4, !tbaa !5
  %106 = icmp eq i32 %105, %84
  br i1 %106, label %107, label %110

107:                                              ; preds = %104
  %108 = load i32, i32* %13, align 4, !tbaa !5
  %109 = icmp eq i32 %108, %86
  br i1 %109, label %243, label %110

110:                                              ; preds = %107, %104
  %111 = load i32, i32* %14, align 4, !tbaa !5
  %112 = icmp eq i32 %111, %84
  br i1 %112, label %113, label %116

113:                                              ; preds = %110
  %114 = load i32, i32* %15, align 4, !tbaa !5
  %115 = icmp eq i32 %114, %86
  br i1 %115, label %243, label %116

116:                                              ; preds = %113, %110
  %117 = load i32, i32* %16, align 4, !tbaa !5
  %118 = icmp eq i32 %117, %84
  br i1 %118, label %119, label %122

119:                                              ; preds = %116
  %120 = load i32, i32* %17, align 4, !tbaa !5
  %121 = icmp eq i32 %120, %86
  br i1 %121, label %243, label %122

122:                                              ; preds = %119, %116
  %123 = load i32, i32* %18, align 4, !tbaa !5
  %124 = icmp eq i32 %123, %84
  br i1 %124, label %125, label %128

125:                                              ; preds = %122
  %126 = load i32, i32* %19, align 4, !tbaa !5
  %127 = icmp eq i32 %126, %86
  br i1 %127, label %243, label %128

128:                                              ; preds = %125, %122
  %129 = load i32, i32* %20, align 4, !tbaa !5
  %130 = icmp eq i32 %129, %84
  br i1 %130, label %131, label %265

131:                                              ; preds = %128
  %132 = load i32, i32* %21, align 4, !tbaa !5
  %133 = icmp eq i32 %132, %86
  br i1 %133, label %243, label %265

134:                                              ; preds = %22
  %135 = load i32, i32* %1, align 4, !tbaa !5
  %136 = load i32, i32* %5, align 4, !tbaa !5
  %137 = add nsw i32 %135, 17
  %138 = srem i32 %137, 16
  %139 = add nsw i32 %136, 8
  %140 = srem i32 %139, 8
  %141 = load i32, i32* %6, align 4, !tbaa !5
  %142 = icmp eq i32 %141, %138
  br i1 %142, label %143, label %146

143:                                              ; preds = %134
  %144 = load i32, i32* %7, align 4, !tbaa !5
  %145 = icmp eq i32 %144, %140
  br i1 %145, label %243, label %146

146:                                              ; preds = %143, %134
  %147 = load i32, i32* %8, align 4, !tbaa !5
  %148 = icmp eq i32 %147, %138
  br i1 %148, label %149, label %152

149:                                              ; preds = %146
  %150 = load i32, i32* %9, align 4, !tbaa !5
  %151 = icmp eq i32 %150, %140
  br i1 %151, label %243, label %152

152:                                              ; preds = %149, %146
  %153 = load i32, i32* %10, align 4, !tbaa !5
  %154 = icmp eq i32 %153, %138
  br i1 %154, label %155, label %158

155:                                              ; preds = %152
  %156 = load i32, i32* %11, align 4, !tbaa !5
  %157 = icmp eq i32 %156, %140
  br i1 %157, label %243, label %158

158:                                              ; preds = %155, %152
  %159 = load i32, i32* %12, align 4, !tbaa !5
  %160 = icmp eq i32 %159, %138
  br i1 %160, label %161, label %164

161:                                              ; preds = %158
  %162 = load i32, i32* %13, align 4, !tbaa !5
  %163 = icmp eq i32 %162, %140
  br i1 %163, label %243, label %164

164:                                              ; preds = %161, %158
  %165 = load i32, i32* %14, align 4, !tbaa !5
  %166 = icmp eq i32 %165, %138
  br i1 %166, label %167, label %170

167:                                              ; preds = %164
  %168 = load i32, i32* %15, align 4, !tbaa !5
  %169 = icmp eq i32 %168, %140
  br i1 %169, label %243, label %170

170:                                              ; preds = %167, %164
  %171 = load i32, i32* %16, align 4, !tbaa !5
  %172 = icmp eq i32 %171, %138
  br i1 %172, label %173, label %176

173:                                              ; preds = %170
  %174 = load i32, i32* %17, align 4, !tbaa !5
  %175 = icmp eq i32 %174, %140
  br i1 %175, label %243, label %176

176:                                              ; preds = %173, %170
  %177 = load i32, i32* %18, align 4, !tbaa !5
  %178 = icmp eq i32 %177, %138
  br i1 %178, label %179, label %182

179:                                              ; preds = %176
  %180 = load i32, i32* %19, align 4, !tbaa !5
  %181 = icmp eq i32 %180, %140
  br i1 %181, label %243, label %182

182:                                              ; preds = %179, %176
  %183 = load i32, i32* %20, align 4, !tbaa !5
  %184 = icmp eq i32 %183, %138
  br i1 %184, label %185, label %271

185:                                              ; preds = %182
  %186 = load i32, i32* %21, align 4, !tbaa !5
  %187 = icmp eq i32 %186, %140
  br i1 %187, label %243, label %271

188:                                              ; preds = %22
  %189 = load i32, i32* %1, align 4, !tbaa !5
  %190 = load i32, i32* %5, align 4, !tbaa !5
  %191 = add nsw i32 %189, 16
  %192 = srem i32 %191, 16
  %193 = add nsw i32 %190, 7
  %194 = srem i32 %193, 8
  %195 = load i32, i32* %6, align 4, !tbaa !5
  %196 = icmp eq i32 %195, %192
  br i1 %196, label %197, label %200

197:                                              ; preds = %188
  %198 = load i32, i32* %7, align 4, !tbaa !5
  %199 = icmp eq i32 %198, %194
  br i1 %199, label %243, label %200

200:                                              ; preds = %197, %188
  %201 = load i32, i32* %8, align 4, !tbaa !5
  %202 = icmp eq i32 %201, %192
  br i1 %202, label %203, label %206

203:                                              ; preds = %200
  %204 = load i32, i32* %9, align 4, !tbaa !5
  %205 = icmp eq i32 %204, %194
  br i1 %205, label %243, label %206

206:                                              ; preds = %203, %200
  %207 = load i32, i32* %10, align 4, !tbaa !5
  %208 = icmp eq i32 %207, %192
  br i1 %208, label %209, label %212

209:                                              ; preds = %206
  %210 = load i32, i32* %11, align 4, !tbaa !5
  %211 = icmp eq i32 %210, %194
  br i1 %211, label %243, label %212

212:                                              ; preds = %209, %206
  %213 = load i32, i32* %12, align 4, !tbaa !5
  %214 = icmp eq i32 %213, %192
  br i1 %214, label %215, label %218

215:                                              ; preds = %212
  %216 = load i32, i32* %13, align 4, !tbaa !5
  %217 = icmp eq i32 %216, %194
  br i1 %217, label %243, label %218

218:                                              ; preds = %215, %212
  %219 = load i32, i32* %14, align 4, !tbaa !5
  %220 = icmp eq i32 %219, %192
  br i1 %220, label %221, label %224

221:                                              ; preds = %218
  %222 = load i32, i32* %15, align 4, !tbaa !5
  %223 = icmp eq i32 %222, %194
  br i1 %223, label %243, label %224

224:                                              ; preds = %221, %218
  %225 = load i32, i32* %16, align 4, !tbaa !5
  %226 = icmp eq i32 %225, %192
  br i1 %226, label %227, label %230

227:                                              ; preds = %224
  %228 = load i32, i32* %17, align 4, !tbaa !5
  %229 = icmp eq i32 %228, %194
  br i1 %229, label %243, label %230

230:                                              ; preds = %227, %224
  %231 = load i32, i32* %18, align 4, !tbaa !5
  %232 = icmp eq i32 %231, %192
  br i1 %232, label %233, label %236

233:                                              ; preds = %230
  %234 = load i32, i32* %19, align 4, !tbaa !5
  %235 = icmp eq i32 %234, %194
  br i1 %235, label %243, label %236

236:                                              ; preds = %233, %230
  %237 = load i32, i32* %20, align 4, !tbaa !5
  %238 = icmp eq i32 %237, %192
  br i1 %238, label %239, label %275

239:                                              ; preds = %236
  %240 = load i32, i32* %21, align 4, !tbaa !5
  %241 = icmp eq i32 %240, %194
  br i1 %241, label %243, label %275

242:                                              ; preds = %22
  tail call void @failWithError(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0)) #4
  br label %243

243:                                              ; preds = %242, %35, %41, %47, %53, %59, %65, %71, %77, %89, %95, %101, %107, %113, %119, %125, %131, %143, %149, %155, %161, %167, %173, %179, %185, %197, %203, %209, %215, %221, %227, %233, %239
  %244 = icmp ugt i32 %24, 1
  br i1 %244, label %245, label %248

245:                                              ; preds = %243
  %246 = add nsw i32 %24, -1
  %247 = add nsw i32 %25, 1
  br label %22, !llvm.loop !16

248:                                              ; preds = %243
  tail call void @failWithError(i8* noundef getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i64 0, i64 0)) #4
  switch i32 %25, label %281 [
    i32 0, label %249
    i32 1, label %253
    i32 2, label %255
    i32 3, label %259
  ]

249:                                              ; preds = %248
  %250 = load i32, i32* %1, align 4, !tbaa !5
  %251 = add nsw i32 %250, 15
  %252 = srem i32 %251, 16
  br label %261

253:                                              ; preds = %248
  %254 = load i32, i32* %1, align 4, !tbaa !5
  br label %265

255:                                              ; preds = %248
  %256 = load i32, i32* %1, align 4, !tbaa !5
  %257 = add nsw i32 %256, 17
  %258 = srem i32 %257, 16
  br label %271

259:                                              ; preds = %248
  %260 = load i32, i32* %1, align 4, !tbaa !5
  br label %275

261:                                              ; preds = %77, %74, %249
  %262 = phi i32 [ %252, %249 ], [ %30, %74 ], [ %30, %77 ]
  store i32 %262, i32* %0, align 4, !tbaa !5
  %263 = load i32, i32* %5, align 4, !tbaa !5
  %264 = getelementptr inbounds i32, i32* %0, i64 1
  store i32 %263, i32* %264, align 4, !tbaa !5
  br label %282

265:                                              ; preds = %131, %128, %253
  %266 = phi i32 [ %254, %253 ], [ %81, %128 ], [ %81, %131 ]
  store i32 %266, i32* %0, align 4, !tbaa !5
  %267 = load i32, i32* %5, align 4, !tbaa !5
  %268 = add nsw i32 %267, 9
  %269 = srem i32 %268, 8
  %270 = getelementptr inbounds i32, i32* %0, i64 1
  store i32 %269, i32* %270, align 4, !tbaa !5
  br label %282

271:                                              ; preds = %185, %182, %255
  %272 = phi i32 [ %258, %255 ], [ %138, %182 ], [ %138, %185 ]
  store i32 %272, i32* %0, align 4, !tbaa !5
  %273 = load i32, i32* %5, align 4, !tbaa !5
  %274 = getelementptr inbounds i32, i32* %0, i64 1
  store i32 %273, i32* %274, align 4, !tbaa !5
  br label %282

275:                                              ; preds = %239, %236, %259
  %276 = phi i32 [ %260, %259 ], [ %189, %236 ], [ %189, %239 ]
  store i32 %276, i32* %0, align 4, !tbaa !5
  %277 = load i32, i32* %5, align 4, !tbaa !5
  %278 = add nsw i32 %277, 7
  %279 = srem i32 %278, 8
  %280 = getelementptr inbounds i32, i32* %0, i64 1
  store i32 %279, i32* %280, align 4, !tbaa !5
  br label %282

281:                                              ; preds = %248
  tail call void @failWithError(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0)) #4
  br label %282

282:                                              ; preds = %265, %275, %281, %271, %261
  ret void
}

declare void @failWithError(i8* noundef) local_unnamed_addr #3

declare void @putPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

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
