; ModuleID = 'lib/GraphicalApp/Snake.c'
source_filename = "lib/GraphicalApp/Snake.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [66 x i8] c"\D0\93\D0\BE\D1\81\D0\BF\D0\BE\D0\B4\D1\8C, \D0\BA\D0\B0\D0\BA \D0\B2\D0\B8\D0\B4\D0\BD\D0\BE, \D0\B7\D0\B0\D0\B1\D0\B8\D1\80\D0\B0\D0\B5\D1\82 \D0\BB\D1\83\D1\87\D1\88\D0\B8\D1\85.\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Unknown Choose\00", align 1

; Function Attrs: noreturn nounwind uwtable
define dso_local void @runSnake() local_unnamed_addr #0 {
  %1 = alloca i64, align 8
  %2 = alloca [8 x [2 x i32]], align 16
  %3 = bitcast [8 x [2 x i32]]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %3) #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %3, i8 0, i64 64, i1 false)
  %4 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 0, i64 0
  %5 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 0
  tail call void @doSrand(i32 noundef 0) #5
  %6 = tail call i32 (...) @getRand() #5
  %7 = srem i32 %6, 16
  %8 = tail call i32 (...) @getRand() #5
  %9 = srem i32 %8, 8
  store i32 %7, i32* %4, align 16, !tbaa !5
  %10 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 0, i64 1
  store i32 %9, i32* %10, align 4, !tbaa !5
  %11 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 1, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %11, i32* noundef nonnull %4, [2 x i32]* noundef nonnull %5) #5
  %12 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 2, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %12, i32* noundef nonnull %11, [2 x i32]* noundef nonnull %5) #5
  %13 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 3, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %13, i32* noundef nonnull %12, [2 x i32]* noundef nonnull %5) #5
  %14 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 4, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %14, i32* noundef nonnull %13, [2 x i32]* noundef nonnull %5) #5
  %15 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 5, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %15, i32* noundef nonnull %14, [2 x i32]* noundef nonnull %5) #5
  %16 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 6, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %16, i32* noundef nonnull %15, [2 x i32]* noundef nonnull %5) #5
  %17 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 7, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %17, i32* noundef nonnull %16, [2 x i32]* noundef nonnull %5) #5
  %18 = bitcast i64* %1 to [2 x i32]*
  %19 = bitcast i64* %1 to i8*
  %20 = bitcast i64* %1 to i32*
  %21 = getelementptr inbounds [2 x i32], [2 x i32]* %18, i64 0, i64 1
  br label %22

22:                                               ; preds = %191, %0
  %23 = phi i32 [ 0, %0 ], [ %195, %191 ]
  br label %24

24:                                               ; preds = %31, %22
  %25 = phi i32 [ 0, %22 ], [ %32, %31 ]
  %26 = shl nuw nsw i32 %25, 5
  %27 = shl nuw nsw i32 %25, 9
  %28 = add nuw nsw i32 %27, 512
  %29 = lshr exact i32 %28, 4
  %30 = icmp ult i32 %26, %29
  br label %36

31:                                               ; preds = %53
  %32 = add nuw nsw i32 %25, 1
  %33 = icmp eq i32 %32, 16
  br i1 %33, label %34, label %24, !llvm.loop !9

34:                                               ; preds = %31
  %35 = zext i32 %23 to i64
  br label %56

36:                                               ; preds = %53, %24
  %37 = phi i32 [ 0, %24 ], [ %54, %53 ]
  br i1 %30, label %38, label %53

38:                                               ; preds = %36
  %39 = shl nuw nsw i32 %37, 5
  %40 = shl nuw nsw i32 %37, 8
  %41 = add nuw nsw i32 %40, 256
  %42 = lshr exact i32 %41, 3
  %43 = icmp ult i32 %39, %42
  br label %44

44:                                               ; preds = %46, %38
  %45 = phi i32 [ %26, %38 ], [ %47, %46 ]
  br i1 %43, label %49, label %46

46:                                               ; preds = %49, %44
  %47 = add nuw nsw i32 %45, 1
  %48 = icmp eq i32 %47, %29
  br i1 %48, label %53, label %44, !llvm.loop !11

49:                                               ; preds = %44, %49
  %50 = phi i32 [ %51, %49 ], [ %39, %44 ]
  call void @putPixel(i32 noundef %45, i32 noundef %50, i32 noundef 12187338) #5
  %51 = add nuw nsw i32 %50, 1
  %52 = icmp eq i32 %51, %42
  br i1 %52, label %46, label %49, !llvm.loop !12

53:                                               ; preds = %46, %36
  %54 = add nuw nsw i32 %37, 1
  %55 = icmp eq i32 %54, 8
  br i1 %55, label %31, label %36, !llvm.loop !13

56:                                               ; preds = %34, %189
  %57 = phi i64 [ %98, %189 ], [ 0, %34 ]
  %58 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %57, i64 0
  %59 = load i32, i32* %58, align 8, !tbaa !5
  %60 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %57, i64 1
  %61 = load i32, i32* %60, align 4, !tbaa !5
  %62 = icmp eq i64 %57, %35
  %63 = select i1 %62, i32 16301008, i32 14794471
  %64 = add nsw i32 %59, 16
  %65 = srem i32 %64, 16
  %66 = add nsw i32 %61, 8
  %67 = srem i32 %66, 8
  %68 = shl nsw i32 %65, 5
  %69 = shl nsw i32 %65, 9
  %70 = add nsw i32 %69, 512
  %71 = sdiv i32 %70, 16
  %72 = icmp slt i32 %68, %71
  br i1 %72, label %73, label %91

73:                                               ; preds = %56
  %74 = shl nsw i32 %67, 5
  %75 = shl nsw i32 %67, 8
  %76 = add nsw i32 %75, 256
  %77 = sdiv i32 %76, 8
  %78 = icmp slt i32 %74, %77
  br label %79

79:                                               ; preds = %81, %73
  %80 = phi i32 [ %68, %73 ], [ %82, %81 ]
  br i1 %78, label %84, label %81

81:                                               ; preds = %84, %79
  %82 = add nsw i32 %80, 1
  %83 = icmp eq i32 %82, %71
  br i1 %83, label %88, label %79, !llvm.loop !11

84:                                               ; preds = %79, %84
  %85 = phi i32 [ %86, %84 ], [ %74, %79 ]
  call void @putPixel(i32 noundef %80, i32 noundef %85, i32 noundef %63) #5
  %86 = add nsw i32 %85, 1
  %87 = icmp eq i32 %86, %77
  br i1 %87, label %81, label %84, !llvm.loop !12

88:                                               ; preds = %81
  %89 = load i32, i32* %58, align 8, !tbaa !5
  %90 = load i32, i32* %60, align 4, !tbaa !5
  br label %91

91:                                               ; preds = %88, %56
  %92 = phi i32 [ %90, %88 ], [ %61, %56 ]
  %93 = phi i32 [ %89, %88 ], [ %59, %56 ]
  %94 = add nuw nsw i64 %57, 7
  %95 = and i64 %94, 7
  %96 = trunc i64 %57 to i32
  %97 = select i1 %62, i64 %57, i64 %95
  %98 = add nuw nsw i64 %57, 1
  %99 = trunc i64 %98 to i32
  %100 = and i32 %99, 7
  %101 = icmp eq i32 %100, %23
  %102 = select i1 %101, i32 %96, i32 %100
  %103 = and i64 %97, 4294967295
  %104 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %103, i64 0
  %105 = load i32, i32* %104, align 8, !tbaa !5
  %106 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %103, i64 1
  %107 = load i32, i32* %106, align 4, !tbaa !5
  %108 = zext i32 %102 to i64
  %109 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %108, i64 0
  %110 = load i32, i32* %109, align 8, !tbaa !5
  %111 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %108, i64 1
  %112 = load i32, i32* %111, align 4, !tbaa !5
  %113 = add nsw i32 %92, 7
  %114 = srem i32 %113, 8
  %115 = icmp eq i32 %107, %114
  %116 = icmp eq i32 %112, %114
  %117 = select i1 %115, i1 true, i1 %116
  br i1 %117, label %134, label %118

118:                                              ; preds = %91
  %119 = shl nsw i32 %93, 5
  %120 = shl i32 %93, 9
  %121 = add i32 %120, 512
  %122 = sdiv i32 %121, 16
  %123 = icmp slt i32 %119, %122
  br i1 %123, label %124, label %134

124:                                              ; preds = %118
  %125 = shl nsw i32 %92, 5
  %126 = or i32 %125, 1
  %127 = icmp slt i32 %125, %126
  br label %128

128:                                              ; preds = %131, %124
  %129 = phi i32 [ %119, %124 ], [ %132, %131 ]
  br i1 %127, label %130, label %131

130:                                              ; preds = %128
  call void @putPixel(i32 noundef %129, i32 noundef %125, i32 noundef 0) #5
  br label %131

131:                                              ; preds = %130, %128
  %132 = add i32 %129, 1
  %133 = icmp eq i32 %132, %122
  br i1 %133, label %134, label %128, !llvm.loop !14

134:                                              ; preds = %131, %118, %91
  %135 = add nsw i32 %92, 1
  %136 = add nsw i32 %92, 9
  %137 = srem i32 %136, 8
  %138 = icmp eq i32 %107, %137
  %139 = icmp eq i32 %112, %137
  %140 = select i1 %138, i1 true, i1 %139
  br i1 %140, label %154, label %141

141:                                              ; preds = %134
  %142 = shl nsw i32 %93, 5
  %143 = shl i32 %93, 9
  %144 = add i32 %143, 512
  %145 = sdiv i32 %144, 16
  %146 = icmp slt i32 %142, %145
  br i1 %146, label %147, label %154

147:                                              ; preds = %141
  %148 = shl nsw i32 %135, 5
  %149 = add nsw i32 %148, -1
  br label %150

150:                                              ; preds = %150, %147
  %151 = phi i32 [ %142, %147 ], [ %152, %150 ]
  call void @putPixel(i32 noundef %151, i32 noundef %149, i32 noundef 0) #5
  %152 = add i32 %151, 1
  %153 = icmp eq i32 %152, %145
  br i1 %153, label %154, label %150, !llvm.loop !15

154:                                              ; preds = %150, %141, %134
  %155 = add nsw i32 %93, 17
  %156 = srem i32 %155, 16
  %157 = icmp eq i32 %105, %156
  %158 = icmp eq i32 %110, %156
  %159 = select i1 %157, i1 true, i1 %158
  br i1 %159, label %172, label %160

160:                                              ; preds = %154
  %161 = shl i32 %93, 5
  %162 = add i32 %161, 32
  %163 = or i32 %161, 31
  %164 = icmp slt i32 %163, %162
  br i1 %164, label %165, label %172

165:                                              ; preds = %160
  %166 = shl nsw i32 %92, 5
  %167 = shl nsw i32 %135, 5
  br label %168

168:                                              ; preds = %168, %165
  %169 = phi i32 [ %166, %165 ], [ %170, %168 ]
  call void @putPixel(i32 noundef %163, i32 noundef %169, i32 noundef 0) #5
  %170 = add nsw i32 %169, 1
  %171 = icmp slt i32 %170, %167
  br i1 %171, label %168, label %172, !llvm.loop !16

172:                                              ; preds = %168, %160, %154
  %173 = add nsw i32 %93, 15
  %174 = srem i32 %173, 16
  %175 = icmp eq i32 %105, %174
  %176 = icmp eq i32 %110, %174
  %177 = select i1 %175, i1 true, i1 %176
  br i1 %177, label %189, label %178

178:                                              ; preds = %172
  %179 = shl nsw i32 %93, 5
  %180 = or i32 %179, 1
  %181 = icmp slt i32 %179, %180
  br i1 %181, label %182, label %189

182:                                              ; preds = %178
  %183 = shl nsw i32 %92, 5
  %184 = shl nsw i32 %135, 5
  br label %185

185:                                              ; preds = %185, %182
  %186 = phi i32 [ %183, %182 ], [ %187, %185 ]
  call void @putPixel(i32 noundef %179, i32 noundef %186, i32 noundef 0) #5
  %187 = add nsw i32 %186, 1
  %188 = icmp slt i32 %187, %184
  br i1 %188, label %185, label %189, !llvm.loop !17

189:                                              ; preds = %185, %178, %172
  %190 = icmp eq i64 %98, 8
  br i1 %190, label %191, label %56, !llvm.loop !18

191:                                              ; preds = %189
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %19) #5
  store i64 0, i64* %1, align 8
  %192 = zext i32 %23 to i64
  %193 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %192, i64 0
  call fastcc void @fillNewCell(i32* noundef nonnull %20, i32* noundef nonnull %193, [2 x i32]* noundef nonnull %5) #5
  %194 = add nsw i32 %23, 7
  %195 = srem i32 %194, 8
  %196 = load i32, i32* %20, align 8, !tbaa !5
  %197 = zext i32 %195 to i64
  %198 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %197, i64 0
  store i32 %196, i32* %198, align 8, !tbaa !5
  %199 = load i32, i32* %21, align 4, !tbaa !5
  %200 = getelementptr inbounds [8 x [2 x i32]], [8 x [2 x i32]]* %2, i64 0, i64 %197, i64 1
  store i32 %199, i32* %200, align 4, !tbaa !5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %19) #5
  call void (...) @updateScreen() #5
  br label %22
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @updateScreen(...) local_unnamed_addr #3

declare void @doSrand(i32 noundef) local_unnamed_addr #3

declare i32 @getRand(...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define internal fastcc void @fillNewCell(i32* nocapture noundef writeonly %0, i32* nocapture noundef readonly %1, [2 x i32]* noundef readonly %2) unnamed_addr #4 {
  %4 = tail call i32 (...) @getRand() #5
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
  tail call void @failWithError(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0)) #5
  br label %243

243:                                              ; preds = %242, %35, %41, %47, %53, %59, %65, %71, %77, %89, %95, %101, %107, %113, %119, %125, %131, %143, %149, %155, %161, %167, %173, %179, %185, %197, %203, %209, %215, %221, %227, %233, %239
  %244 = icmp ugt i32 %24, 1
  br i1 %244, label %245, label %248

245:                                              ; preds = %243
  %246 = add nsw i32 %24, -1
  %247 = add nsw i32 %25, 1
  br label %22, !llvm.loop !19

248:                                              ; preds = %243
  tail call void @failWithError(i8* noundef getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i64 0, i64 0)) #5
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
  tail call void @failWithError(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0)) #5
  br label %282

282:                                              ; preds = %265, %275, %281, %271, %261
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare void @failWithError(i8* noundef) local_unnamed_addr #3

declare void @putPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

attributes #0 = { noreturn nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

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
!17 = distinct !{!17, !10}
!18 = distinct !{!18, !10}
!19 = distinct !{!19, !10}
