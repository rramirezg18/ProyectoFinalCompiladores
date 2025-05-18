; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@fmt_float = internal constant [4 x i8] c"%f\0A\00"
@fmt_int = internal constant [4 x i8] c"%d\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree
define i32 @main() local_unnamed_addr #1 {
entry:
  %.6 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x47311B0EC57E649A)
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %.19, %for.body ]
  %.12 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %i.01)
  %ldexp = tail call double @ldexp(double 1.000000e+00, i32 %i.01)
  %.17 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp)
  %.19 = add nuw nsw i32 %i.01, 1
  %.9 = icmp ult i32 %i.01, 1000
  br i1 %.9, label %for.body, label %for.exit

for.exit:                                         ; preds = %for.body
  ret i32 0
}

; Function Attrs: mustprogress nofree willreturn
declare double @ldexp(double, i32) #2

attributes #0 = { nofree nounwind }
attributes #1 = { nofree }
attributes #2 = { mustprogress nofree willreturn }
