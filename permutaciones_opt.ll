; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = internal constant [4 x i8] c"%d\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
for.cond.1.preheader.peel.next:
  %.27.2.1.peel = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 123)
  %.27.1.2.peel = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 132)
  br label %ifcont.1

for.exit:                                         ; preds = %ifcont.1.1
  %.24.1825 = add nuw nsw i32 %.21, 21
  %.27.1926 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.24.1825)
  ret i32 0

then.2.1.2:                                       ; preds = %ifcont.1.1
  %.24.2 = add nuw nsw i32 %.21, 13
  %.27.2 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.24.2)
  %.24.18 = add nuw nsw i32 %.21, 21
  %.27.19 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.24.18)
  %.24.2.1 = add nuw nsw i32 %.21, 23
  %.27.2.1 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.24.2.1)
  br label %ifcont.2

ifcont.2:                                         ; preds = %ifcont.1, %then.2.1.2
  %.sink42 = phi i32 [ 31, %then.2.1.2 ], [ 13, %ifcont.1 ]
  %.sink = phi i32 [ 32, %then.2.1.2 ], [ 31, %ifcont.1 ]
  %.24.239 = add nuw nsw i32 %.21, %.sink42
  %.27.240 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.24.239)
  %.24.21633 = add nuw nsw i32 %.21, %.sink
  %.27.21734 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.24.21633)
  %.43 = add nuw nsw i32 %i.04, 1
  br label %ifcont.1, !llvm.loop !0

ifcont.1:                                         ; preds = %for.cond.1.preheader.peel.next, %ifcont.2
  %i.04 = phi i32 [ 2, %for.cond.1.preheader.peel.next ], [ %.43, %ifcont.2 ]
  %.21 = mul nuw nsw i32 %i.04, 100
  %.17.not.1 = icmp eq i32 %i.04, 2
  br i1 %.17.not.1, label %ifcont.2, label %ifcont.1.1

ifcont.1.1:                                       ; preds = %ifcont.1
  %.24.1 = add nuw nsw i32 %.21, 12
  %.27.1 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.24.1)
  %.17.not.2 = icmp eq i32 %i.04, 3
  br i1 %.17.not.2, label %for.exit, label %then.2.1.2
}

attributes #0 = { nofree nounwind }

!0 = distinct !{!0, !1}
!1 = !{!"llvm.loop.peeled.count", i32 1}
