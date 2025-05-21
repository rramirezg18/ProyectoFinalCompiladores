; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = internal constant [4 x i8] c"%d\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 1000000, %entry ], [ %.9, %for.body ]
  %.7 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %i.01)
  %.9 = add nsw i32 %i.01, -1
  %.4.not = icmp eq i32 %i.01, 0
  br i1 %.4.not, label %for.exit, label %for.body

for.exit:                                         ; preds = %for.body
  ret i32 0
}

attributes #0 = { nofree nounwind }
