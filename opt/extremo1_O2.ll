; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@str.5510459803934402180 = internal constant [21 x i8] c"aaaaaaaaaaaaaaaaaaaa\00"
@fmt_float = internal constant [4 x i8] c"%f\0A\00"
@fmt_int = internal constant [4 x i8] c"%d\0A\00"
@str.-5039348181066730845 = internal constant [12 x i8] c"Hola muando\00"
@str.-5270465473217331310 = internal constant [5 x i8] c"HOLA\00"
@str.-5297922248074510976 = internal constant [4 x i8] c"Bry\00"
@str.8035883297296007167 = internal constant [11 x i8] c"La suma es\00"
@str.7075219795740717658 = internal constant [73 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH\00"
@str.9007448794288354940 = internal constant [19 x i8] c"pruebaaaaaaaaaaaas\00"
@str.7429974814908541414 = internal constant [2 x i8] c" \00"
@str.-1696583040775164703 = internal constant [24 x i8] c"operaciones matematicas\00"
@str.-8500427329205055830 = internal constant [11 x i8] c"x es <= 15\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
define i32 @potencia(i32 %.1, i32 %.2) local_unnamed_addr #1 {
entry:
  %.6 = sitofp i32 %.1 to double
  %.7 = sitofp i32 %.2 to double
  %.8 = tail call double @llvm.pow.f64(double %.6, double %.7)
  %.9 = fptosi double %.8 to i32
  ret i32 %.9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @sumar(i32 %.1, i32 %.2) local_unnamed_addr #2 {
entry:
  %.6 = add i32 %.2, %.1
  ret i32 %.6
}

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @sumaHasta(i32 %.1) local_unnamed_addr #3 {
entry:
  %.71 = icmp sgt i32 %.1, 1
  br i1 %.71, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %entry
  %0 = shl nuw i32 %.1, 1
  %1 = add nsw i32 %.1, -2
  %2 = zext i32 %1 to i33
  %3 = add nsw i32 %.1, -3
  %4 = zext i32 %3 to i33
  %5 = mul i33 %2, %4
  %6 = lshr i33 %5, 1
  %7 = trunc i33 %6 to i32
  %8 = add i32 %0, %7
  %9 = add i32 %8, -3
  br label %while.end

while.end:                                        ; preds = %while.body.preheader, %entry
  %suma.0.lcssa = phi i32 [ 0, %entry ], [ %9, %while.body.preheader ]
  ret i32 %suma.0.lcssa
}

; Function Attrs: nofree nounwind
define i32 @contarHasta(i32 %.1) local_unnamed_addr #0 {
entry:
  %.7.not1 = icmp slt i32 %.1, 1
  br i1 %.7.not1, label %for.exit, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.02 = phi i32 [ %.12, %for.body ], [ 1, %entry ]
  %.10 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %i.02)
  %.12 = add i32 %i.02, 1
  %.7.not = icmp sgt i32 %.12, %.1
  br i1 %.7.not, label %for.exit, label %for.body

for.exit:                                         ; preds = %for.body, %entry
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @funcionA(i32 %.1) local_unnamed_addr #2 {
entry:
  %.4 = shl i32 %.1, 1
  ret i32 %.4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @funcionB(i32 %.1) local_unnamed_addr #2 {
entry:
  %.4 = tail call i32 @funcionA(i32 %.1)
  %.6 = mul i32 %.4, 3
  ret i32 %.6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @doble(i32 %.1) local_unnamed_addr #2 {
entry:
  %.4 = shl i32 %.1, 1
  ret i32 %.4
}

; Function Attrs: nofree nounwind
define i32 @suma() local_unnamed_addr #0 {
entry:
  %.9 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 60)
  ret i32 0
}

; Function Attrs: nofree nosync nounwind readnone
define i32 @fibonacci(i32 %.1) local_unnamed_addr #4 {
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

; Function Attrs: nofree
define i32 @main() local_unnamed_addr #5 {
entry:
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([21 x i8], [21 x i8]* @str.5510459803934402180, i64 0, i64 0))
  %.11 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x519249AD2594C37D)
  %.16 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x519249AD2594C37D)
  %.21 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x5E35F7F689C43051)
  %.32 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x518249AD2594C37D)
  %.39 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x518249AD2594C37D)
  %.46 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x514D42AEA2879F2E)
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %w.023 = phi i32 [ 0, %entry ], [ %.59, %for.body ]
  %.52 = sitofp i32 %w.023 to double
  %.53 = tail call double @llvm.pow.f64(double 5.000000e+01, double %.52)
  %.55 = fdiv double %.53, 5.000000e+01
  %.57 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.55)
  %.59 = add nuw nsw i32 %w.023, 1
  %.49 = icmp ult i32 %w.023, 100
  br i1 %.49, label %for.body, label %for.exit

for.exit:                                         ; preds = %for.body
  %.75 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x41286A6880000000)
  %.82 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 616792064)
  %.89 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x418F28C280000000)
  %.96 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x3FC3800000000000)
  %.105 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x401802ECE80C541B)
  %.112 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 3.127000e+03)
  %.117 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x49C191F60B32349E)
  %.122 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x421C6BF526340000)
  %.125 = tail call double @llvm.pow.f64(double 8.300000e+01, double 5.550000e+02)
  %.127 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.125)
  %.134 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.089000e+03)
  %.140 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.000000e+01)
  %.160 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double -5.852000e+03)
  %.165 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x467078C6E4F7D754)
  %puts1 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @str.-5039348181066730845, i64 0, i64 0))
  %.179 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x425B0829007D0000)
  %.189 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.250500e+04)
  %.191 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 5)
  %.194 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 2)
  %puts14 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-5270465473217331310, i64 0, i64 0))
  %puts14.1 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-5270465473217331310, i64 0, i64 0))
  %puts14.2 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-5270465473217331310, i64 0, i64 0))
  %puts14.3 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-5270465473217331310, i64 0, i64 0))
  %puts14.4 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-5270465473217331310, i64 0, i64 0))
  %puts14.5 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-5270465473217331310, i64 0, i64 0))
  %puts14.6 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-5270465473217331310, i64 0, i64 0))
  %puts14.7 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-5270465473217331310, i64 0, i64 0))
  %puts14.8 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-5270465473217331310, i64 0, i64 0))
  %puts14.9 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-5270465473217331310, i64 0, i64 0))
  %puts14.10 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-5270465473217331310, i64 0, i64 0))
  %ldexp = tail call double @ldexp(double 1.000000e+00, i32 2)
  %.216 = fadd double %ldexp, 0x4140C91A00000000
  %.218 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.216)
  %.225 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 4.665800e+04)
  %x = alloca i32, align 4
  store i32 10, i32* %x, align 4
  %.232 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 1.000000e+20)
  %.239 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x438C1F14DD0B7DB2)
  %.243 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 16510)
  %.248 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.257 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.257.1 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.257.2 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.257.3 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.257.4 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.257.5 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.257.6 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.257.7 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.257.8 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.257.9 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.257.10 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.269 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4E7249AD2594C37D)
  %.270 = tail call i32 @fibonacci(i32 50)
  %.273 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.270)
  %.287 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x41286A6880000000)
  %.294 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 616792064)
  %.301 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x418F28C280000000)
  %.308 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x3FC3800000000000)
  %.317 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x401802ECE80C541B)
  %.324 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 3.127000e+03)
  %.329 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x49C191F60B32349E)
  %.334 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x421C6BF526340000)
  %.339 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.125)
  %.346 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.089000e+03)
  %.349 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 10)
  %.353 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 42)
  %.357 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 20)
  %.362 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.000000e+00)
  %.367 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 8.000000e+00)
  %.374 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.120000e+02)
  %.383 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 9.000000e+00)
  %.395 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.100000e+01)
  %.400 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.500000e+00)
  %.405 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -6)
  %.411 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 0)
  %ldexp13 = tail call double @ldexp(double 1.000000e+00, i32 0)
  %.416 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp13)
  %.411.1 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 1)
  %ldexp13.1 = tail call double @ldexp(double 1.000000e+00, i32 1)
  %.416.1 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp13.1)
  %.411.2 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 2)
  %ldexp13.2 = tail call double @ldexp(double 1.000000e+00, i32 2)
  %.416.2 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp13.2)
  %.411.3 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 3)
  %ldexp13.3 = tail call double @ldexp(double 1.000000e+00, i32 3)
  %.416.3 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp13.3)
  %.411.4 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 4)
  %ldexp13.4 = tail call double @ldexp(double 1.000000e+00, i32 4)
  %.416.4 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp13.4)
  %.411.5 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 5)
  %ldexp13.5 = tail call double @ldexp(double 1.000000e+00, i32 5)
  %.416.5 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp13.5)
  %.411.6 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 6)
  %ldexp13.6 = tail call double @ldexp(double 1.000000e+00, i32 6)
  %.416.6 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp13.6)
  %.411.7 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 7)
  %ldexp13.7 = tail call double @ldexp(double 1.000000e+00, i32 7)
  %.416.7 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp13.7)
  %.411.8 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 8)
  %ldexp13.8 = tail call double @ldexp(double 1.000000e+00, i32 8)
  %.416.8 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp13.8)
  %.411.9 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 9)
  %ldexp13.9 = tail call double @ldexp(double 1.000000e+00, i32 9)
  %.416.9 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp13.9)
  %puts4 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @str.-5297922248074510976, i64 0, i64 0))
  %puts5 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str.8035883297296007167, i64 0, i64 0))
  %.428 = tail call i32 @suma()
  %puts6 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([73 x i8], [73 x i8]* @str.7075219795740717658, i64 0, i64 0))
  %.433 = tail call i32 @doble(i32 10)
  %.436 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.433)
  %puts7 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([19 x i8], [19 x i8]* @str.9007448794288354940, i64 0, i64 0))
  %.440 = tail call i32 @funcionB(i32 5)
  %.442 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.440)
  %puts8 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([2 x i8], [2 x i8]* @str.7429974814908541414, i64 0, i64 0))
  %.448 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 10)
  %.450 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.500000e+01)
  %puts9 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @str.-1696583040775164703, i64 0, i64 0))
  %.461 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.314500e+05)
  %.470 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 8.000000e+02)
  %.477 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x43B4ADF4B7320335)
  %.481 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 23)
  %.486 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.904900e+14)
  %.508 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.400000e+01)
  %.516 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4202A05F20500000)
  %puts10 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str.-8500427329205055830, i64 0, i64 0))
  %.540 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x41286A6880000000)
  %.547 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 616792064)
  %.554 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x418F28C280000000)
  %.561 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x3FC3800000000000)
  %.570 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x401802ECE80C541B)
  %.577 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 3.127000e+03)
  %.582 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x49C191F60B32349E)
  %.587 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x421C6BF526340000)
  %.592 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.125)
  %.599 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.089000e+03)
  %x.7.pr = load i32, i32* %x, align 4
  %.60117 = icmp sgt i32 %x.7.pr, 0
  br i1 %.60117, label %while.body.1, label %for.cond.3.preheader

for.cond.3.preheader:                             ; preds = %while.body.1, %for.exit
  %x.7.lcssa = phi i32 [ %x.7.pr, %for.exit ], [ 0, %while.body.1 ]
  store i32 %x.7.lcssa, i32* %x, align 4
  br label %for.body.3

while.body.1:                                     ; preds = %for.exit, %while.body.1
  %x.718 = phi i32 [ %.605, %while.body.1 ], [ %x.7.pr, %for.exit ]
  %.604 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %x.718)
  %.605 = add nsw i32 %x.718, -1
  %.601 = icmp ugt i32 %x.718, 1
  br i1 %.601, label %while.body.1, label %for.cond.3.preheader

for.body.3:                                       ; preds = %for.cond.3.preheader, %for.body.3
  %storemerge1115 = phi i32 [ 0, %for.cond.3.preheader ], [ %.615, %for.body.3 ]
  %.613 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %storemerge1115)
  %.615 = add nuw nsw i32 %storemerge1115, 1
  %.610 = icmp ult i32 %storemerge1115, 100
  br i1 %.610, label %for.body.3, label %for.exit.3

for.exit.3:                                       ; preds = %for.body.3
  %.618 = tail call i32 @contarHasta(i32 5)
  %.619 = tail call i32 @potencia(i32 2, i32 3)
  %.621 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.619)
  %.622 = tail call i32 @sumar(i32 5, i32 7)
  %.624 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.622)
  %.625 = tail call i32 @sumaHasta(i32 5)
  %.628 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.625)
  %.642 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x41286A6880000000)
  %.649 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 616792064)
  %.656 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x418F28C280000000)
  %.663 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x3FC3800000000000)
  %.672 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x401802ECE80C541B)
  %.679 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 3.127000e+03)
  %.684 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x49C191F60B32349E)
  %.689 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x421C6BF526340000)
  %.694 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.125)
  %.701 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.089000e+03)
  %.704 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 10)
  %.705 = shl i32 %x.7.lcssa, 2
  %.706 = or i32 %.705, 2
  %.708 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.706)
  %.712 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 20)
  %.717 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.000000e+00)
  %.722 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 8.000000e+00)
  %.729 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.120000e+02)
  %.738 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 9.000000e+00)
  %.750 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.100000e+01)
  %.755 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.500000e+00)
  %.760 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -6)
  %.774 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x41286A6880000000)
  %.781 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 616792064)
  %.788 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x418F28C280000000)
  %.795 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x3FC3800000000000)
  %.804 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x401802ECE80C541B)
  %.811 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 3.127000e+03)
  %.816 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x49C191F60B32349E)
  %.821 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x421C6BF526340000)
  %.826 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.125)
  %.833 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.089000e+03)
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.pow.f64(double, double) #6

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) #0

; Function Attrs: mustprogress nofree willreturn
declare double @ldexp(double, i32) #7

attributes #0 = { nofree nounwind }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #2 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #3 = { nofree norecurse nosync nounwind readnone }
attributes #4 = { nofree nosync nounwind readnone }
attributes #5 = { nofree }
attributes #6 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { mustprogress nofree willreturn }
