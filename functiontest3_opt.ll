; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = internal constant [4 x i8] c"%d\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nosync nounwind readnone
define i32 @factorial(i32 %.1) local_unnamed_addr #1 {
entry:
  %.41 = icmp slt i32 %.1, 1
  br i1 %.41, label %common.ret, label %ifcont

common.ret:                                       ; preds = %ifcont, %entry
  %accumulator.tr.lcssa = phi i32 [ 1, %entry ], [ %.10, %ifcont ]
  ret i32 %accumulator.tr.lcssa

ifcont:                                           ; preds = %entry, %ifcont
  %.1.tr3 = phi i32 [ %.8, %ifcont ], [ %.1, %entry ]
  %accumulator.tr2 = phi i32 [ %.10, %ifcont ], [ 1, %entry ]
  %.8 = add nsw i32 %.1.tr3, -1
  %.10 = mul i32 %.1.tr3, %accumulator.tr2
  %.4 = icmp ult i32 %.1.tr3, 2
  br i1 %.4, label %common.ret, label %ifcont
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %.2 = tail call i32 @factorial(i32 5)
  %.4 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.2)
  ret i32 0
}

attributes #0 = { nofree nounwind }
attributes #1 = { nofree nosync nounwind readnone }
