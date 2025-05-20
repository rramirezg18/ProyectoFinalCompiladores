; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = internal constant [4 x i8] c"%d\0A\00"
@fmt_float = internal constant [4 x i8] c"%f\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %.5 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 10)
  %.9 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 14)
  %.13 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 20)
  %.18 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.000000e+00)
  %.23 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 8.000000e+00)
  %.30 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.120000e+02)
  %.39 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 9.000000e+00)
  %.51 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.100000e+01)
  %.56 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.500000e+00)
  %.61 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -6)
  ret i32 0
}

attributes #0 = { nofree nounwind }
