; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = internal constant [4 x i8] c"%d\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
define i32 @potencia(i32 %.1, i32 %.2) local_unnamed_addr #1 {
entry:
  %.6 = sitofp i32 %.1 to double
  %.7 = sitofp i32 %.2 to double
  %.8 = tail call double @llvm.pow.f64(double %.6, double %.7)
  %.9 = fptosi double %.8 to i32
  ret i32 %.9
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %.2 = tail call i32 @potencia(i32 2, i32 3)
  %.4 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.2)
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.pow.f64(double, double) #2

attributes #0 = { nofree nounwind }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
