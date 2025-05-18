; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = internal constant [4 x i8] c"%d\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nosync nounwind readnone
define i32 @fibonacci(i32 %.1) local_unnamed_addr #1 {
entry:
  br label %tailrecurse

tailrecurse:                                      ; preds = %ifcont.1, %entry
  %accumulator.tr = phi i32 [ 0, %entry ], [ %.16, %ifcont.1 ]
  %.1.tr = phi i32 [ %.1, %entry ], [ %.14, %ifcont.1 ]
  %switch = icmp ult i32 %.1.tr, 2
  br i1 %switch, label %common.ret, label %ifcont.1

common.ret:                                       ; preds = %tailrecurse
  %accumulator.ret.tr = add i32 %.1.tr, %accumulator.tr
  ret i32 %accumulator.ret.tr

ifcont.1:                                         ; preds = %tailrecurse
  %.12 = add i32 %.1.tr, -1
  %.13 = tail call i32 @fibonacci(i32 %.12)
  %.14 = add i32 %.1.tr, -2
  %.16 = add i32 %.13, %accumulator.tr
  br label %tailrecurse
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %.2 = tail call i32 @fibonacci(i32 30)
  %.5 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.2)
  ret i32 0
}

attributes #0 = { nofree nounwind }
attributes #1 = { nofree nosync nounwind readnone }
