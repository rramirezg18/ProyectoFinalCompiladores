; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@fmt_float = internal constant [4 x i8] c"%f\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %.24 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.500000e+01)
  ret i32 0
}

attributes #0 = { nofree nounwind }
