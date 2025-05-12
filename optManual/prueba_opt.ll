; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = internal constant [4 x i8] c"%d\0A\00"
@fmt_float = internal constant [4 x i8] c"%f\0A\00"
@str.-714922273092054491 = internal constant [5 x i8] c"hola\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %.7 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 2)
  %.13 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 5)
  %.19 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 4.500000e+00)
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-714922273092054491, i64 0, i64 0))
  %.30 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 10)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) #0

attributes #0 = { nofree nounwind }
