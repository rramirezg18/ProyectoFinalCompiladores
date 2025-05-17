; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = internal constant [4 x i8] c"%d\0A\00"
@str.7484904253047083470 = internal constant [46 x i8] c"El resultado de la secuencia de fibonacci es:\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.03 = phi i32 [ 0, %entry ], [ %.16, %for.body ]
  %a.02 = phi i32 [ 0, %entry ], [ %b.01, %for.body ]
  %b.01 = phi i32 [ 1, %entry ], [ %.11, %for.body ]
  %.10 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %a.02)
  %.11 = add i32 %a.02, %b.01
  %.16 = add nuw nsw i32 %i.03, 1
  %.7 = icmp ult i32 %i.03, 99
  br i1 %.7, label %for.body, label %for.exit

for.exit:                                         ; preds = %for.body
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([46 x i8], [46 x i8]* @str.7484904253047083470, i64 0, i64 0))
  %.23 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -980107325)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) #0

attributes #0 = { nofree nounwind }
