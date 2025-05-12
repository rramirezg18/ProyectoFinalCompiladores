; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = internal constant [4 x i8] c"%d\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nosync nounwind readnone
define i32 @ackermann(i32 %.1, i32 %.2) local_unnamed_addr #1 {
entry:
  %.61 = icmp eq i32 %.1, 0
  br i1 %.61, label %then, label %else

then:                                             ; preds = %else, %entry
  %.2.tr.lcssa = phi i32 [ %.2, %entry ], [ %.12, %else ]
  %.8 = add i32 %.2.tr.lcssa, 1
  ret i32 %.8

else:                                             ; preds = %entry, %else
  %.2.tr3 = phi i32 [ %.12, %else ], [ %.2, %entry ]
  %.1.tr2 = phi i32 [ %.10, %else ], [ %.1, %entry ]
  %.10 = add i32 %.1.tr2, -1
  %.11 = add i32 %.2.tr3, -1
  %.12 = tail call i32 @ackermann(i32 %.1.tr2, i32 %.11)
  %.6 = icmp eq i32 %.10, 0
  br i1 %.6, label %then, label %else
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %.4 = tail call i32 @ackermann(i32 2, i32 3)
  %.7 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.4)
  ret i32 0
}

attributes #0 = { nofree nounwind }
attributes #1 = { nofree nosync nounwind readnone }
