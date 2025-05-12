; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@str.1729602204818254579 = internal constant [13 x i8] c"Bubble Sort:\00"
@fmt_int = internal constant [4 x i8] c"%d\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @bubbleSort(i32 %.1, i32 %.2, i32 %.3) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.smax.i32(i32 %.1, i32 %.2)
  %1 = tail call i32 @llvm.smin.i32(i32 %.1, i32 %.2)
  %2 = tail call i32 @llvm.smax.i32(i32 %0, i32 %.3)
  %3 = tail call i32 @llvm.smin.i32(i32 %0, i32 %.3)
  %4 = tail call i32 @llvm.smax.i32(i32 %1, i32 %3)
  %5 = tail call i32 @llvm.smin.i32(i32 %1, i32 %3)
  %.30 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %5)
  %.32 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %4)
  %.34 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %2)
  ret i32 0
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @str.1729602204818254579, i64 0, i64 0))
  %.8 = tail call i32 @bubbleSort(i32 3, i32 1, i32 2)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #1

attributes #0 = { nofree nounwind }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
