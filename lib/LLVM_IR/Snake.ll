; ModuleID = '/home/dobrovolskaya/Desktop/LLVM-course/lib/GraphicalApp/SnakeSimple.c'
source_filename = "/home/dobrovolskaya/Desktop/LLVM-course/lib/GraphicalApp/SnakeSimple.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@llvm.compiler.used = appending global [1 x i8*] [i8* bitcast (void ()* @finalizeSnake to i8*)], section "llvm.metadata"

; Function Attrs: naked noinline nounwind uwtable
define dso_local void @finalizeSnake() #0 {
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local void @putCells(i32 noundef %0) local_unnamed_addr #1 {
  br label %2

2:                                                ; preds = %1, %17
  %3 = phi i32 [ 0, %1 ], [ %18, %17 ]
  %4 = shl nsw i32 %3, 5
  %5 = shl i32 %3, 9
  %6 = add nuw nsw i32 %5, 512
  %7 = lshr exact i32 %6, 4
  %8 = icmp ult i32 %4, %7
  br label %20

9:                                                ; preds = %17
  %10 = add i32 %0, 8
  %11 = srem i32 %10, 8
  %12 = shl nsw i32 %11, 5
  %13 = shl nsw i32 %11, 8
  %14 = add nsw i32 %13, 256
  %15 = sdiv i32 %14, 8
  %16 = icmp slt i32 %12, %15
  br label %40

17:                                               ; preds = %37
  %18 = add nuw nsw i32 %3, 1
  %19 = icmp eq i32 %18, 16
  br i1 %19, label %9, label %2, !llvm.loop !5

20:                                               ; preds = %2, %37
  %21 = phi i32 [ 0, %2 ], [ %38, %37 ]
  br i1 %8, label %22, label %37

22:                                               ; preds = %20
  %23 = shl nuw nsw i32 %21, 5
  %24 = shl nuw nsw i32 %21, 8
  %25 = add nuw nsw i32 %24, 256
  %26 = lshr exact i32 %25, 3
  %27 = icmp ult i32 %23, %26
  br label %28

28:                                               ; preds = %30, %22
  %29 = phi i32 [ %4, %22 ], [ %31, %30 ]
  br i1 %27, label %33, label %30

30:                                               ; preds = %33, %28
  %31 = add nuw nsw i32 %29, 1
  %32 = icmp eq i32 %31, %7
  br i1 %32, label %37, label %28, !llvm.loop !7

33:                                               ; preds = %28, %33
  %34 = phi i32 [ %35, %33 ], [ %23, %28 ]
  tail call void @putPixel(i32 noundef %29, i32 noundef %34, i32 noundef 12187338) #3
  %35 = add nuw nsw i32 %34, 1
  %36 = icmp eq i32 %35, %26
  br i1 %36, label %30, label %33, !llvm.loop !8

37:                                               ; preds = %30, %20
  %38 = add nuw nsw i32 %21, 1
  %39 = icmp eq i32 %38, 8
  br i1 %39, label %17, label %20, !llvm.loop !9

40:                                               ; preds = %42, %9
  %41 = phi i32 [ 160, %9 ], [ %43, %42 ]
  br i1 %16, label %45, label %42

42:                                               ; preds = %45, %40
  %43 = add nuw nsw i32 %41, 1
  %44 = icmp eq i32 %43, 192
  br i1 %44, label %49, label %40, !llvm.loop !7

45:                                               ; preds = %40, %45
  %46 = phi i32 [ %47, %45 ], [ %12, %40 ]
  tail call void @putPixel(i32 noundef %41, i32 noundef %46, i32 noundef 14794471) #3
  %47 = add nsw i32 %46, 1
  %48 = icmp eq i32 %47, %15
  br i1 %48, label %42, label %45, !llvm.loop !8

49:                                               ; preds = %42
  %50 = add i32 %0, 9
  %51 = srem i32 %50, 8
  %52 = shl nsw i32 %51, 5
  %53 = shl nsw i32 %51, 8
  %54 = add nsw i32 %53, 256
  %55 = sdiv i32 %54, 8
  %56 = icmp slt i32 %52, %55
  br label %57

57:                                               ; preds = %63, %49
  %58 = phi i32 [ 160, %49 ], [ %64, %63 ]
  br i1 %56, label %59, label %63

59:                                               ; preds = %57, %59
  %60 = phi i32 [ %61, %59 ], [ %52, %57 ]
  tail call void @putPixel(i32 noundef %58, i32 noundef %60, i32 noundef 14794471) #3
  %61 = add nsw i32 %60, 1
  %62 = icmp eq i32 %61, %55
  br i1 %62, label %63, label %59, !llvm.loop !8

63:                                               ; preds = %59, %57
  %64 = add nuw nsw i32 %58, 1
  %65 = icmp eq i32 %64, 192
  br i1 %65, label %66, label %57, !llvm.loop !7

66:                                               ; preds = %63
  %67 = add i32 %0, 10
  %68 = srem i32 %67, 8
  %69 = shl nsw i32 %68, 5
  %70 = shl nsw i32 %68, 8
  %71 = add nsw i32 %70, 256
  %72 = sdiv i32 %71, 8
  %73 = icmp slt i32 %69, %72
  br label %74

74:                                               ; preds = %80, %66
  %75 = phi i32 [ 160, %66 ], [ %81, %80 ]
  br i1 %73, label %76, label %80

76:                                               ; preds = %74, %76
  %77 = phi i32 [ %78, %76 ], [ %69, %74 ]
  tail call void @putPixel(i32 noundef %75, i32 noundef %77, i32 noundef 14794471) #3
  %78 = add nsw i32 %77, 1
  %79 = icmp eq i32 %78, %72
  br i1 %79, label %80, label %76, !llvm.loop !8

80:                                               ; preds = %76, %74
  %81 = add nuw nsw i32 %75, 1
  %82 = icmp eq i32 %81, 192
  br i1 %82, label %83, label %74, !llvm.loop !7

83:                                               ; preds = %80
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @runSnake() local_unnamed_addr #1 {
  tail call void @putCells(i32 noundef 1)
  tail call void (...) @updateScreen() #3
  tail call void @putCells(i32 noundef 2)
  tail call void (...) @updateScreen() #3
  tail call void @putCells(i32 noundef 3)
  tail call void (...) @updateScreen() #3
  tail call void @putCells(i32 noundef 4)
  tail call void (...) @updateScreen() #3
  tail call void @putCells(i32 noundef 5)
  tail call void (...) @updateScreen() #3
  tail call void @finalizeSnake()
  ret void
}

declare void @updateScreen(...) local_unnamed_addr #2

declare void @putPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

attributes #0 = { naked noinline nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
