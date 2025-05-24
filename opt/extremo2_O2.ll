; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@str.-3210507871185922628 = internal constant [21 x i8] c"HOY ES UN % GRAN DIA\00"
@str.6675082147490602344 = internal constant [26 x i8] c"El resultado de 19^35 es \00"
@fmt_7450633905943628218 = internal constant [3 x i8] c"%f\00"
@str.3613693433752715259 = internal constant [9 x i8] c"Bryan + \00"
@str.4412541974357060881 = internal constant [12 x i8] c"Jonathan + \00"
@str.-4569468012284973367 = internal constant [20 x i8] c"el res de 3^333 es \00"
@fmt_float = internal constant [4 x i8] c"%f\0A\00"
@str.-643552820027265896 = internal constant [23 x i8] c"el resultado de gg es \00"
@str.-396560488125965123 = internal constant [9 x i8] c"Mi edad \00"
@fmt_122684548135079981 = internal constant [3 x i8] c"%d\00"
@str.7352403852144901648 = internal constant [18 x i8] c"La pot de 5^5 es \00"
@str.7291092878830289736 = internal constant [24 x i8] c"EXTREMOOOOOOOOOOOOOOOOO\00"
@str.8943300874301979134 = internal constant [21 x i8] c"aaaaaaaaaaaaaaaaaaaa\00"
@fmt_int = internal constant [4 x i8] c"%d\0A\00"
@str.7217103673683584462 = internal constant [6 x i8] c"Hola \00"
@str.-2119849515522328904 = internal constant [12 x i8] c"Hola muando\00"
@str.-7234436746275970846 = internal constant [5 x i8] c"HOLA\00"
@str.-2298784497398318728 = internal constant [4 x i8] c"Bry\00"
@str.8406852103763921732 = internal constant [11 x i8] c"La suma es\00"
@str.-4658157915766798537 = internal constant [73 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH\00"
@str.7395103503712258414 = internal constant [19 x i8] c"pruebaaaaaaaaaaaas\00"
@str.-3334893379800373686 = internal constant [2 x i8] c" \00"
@str.1587425158494560781 = internal constant [24 x i8] c"operaciones matematicas\00"
@str.4376633864494759195 = internal constant [11 x i8] c"x es <= 15\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare i8* @strcpy(i8* noalias returned writeonly, i8* noalias nocapture readonly) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare i8* @strcat(i8* noalias returned, i8* noalias nocapture readonly) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @sprintf(i8* noalias nocapture noundef writeonly, i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
define i32 @potencia(i32 %.1, i32 %.2) local_unnamed_addr #2 {
entry:
  %.6 = sitofp i32 %.1 to double
  %.7 = sitofp i32 %.2 to double
  %.8 = tail call double @llvm.pow.f64(double %.6, double %.7)
  %.9 = fptosi double %.8 to i32
  ret i32 %.9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @sumar(i32 %.1, i32 %.2) local_unnamed_addr #3 {
entry:
  %.6 = add i32 %.2, %.1
  ret i32 %.6
}

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @sumaHasta(i32 %.1) local_unnamed_addr #4 {
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
define i32 @funcionA(i32 %.1) local_unnamed_addr #3 {
entry:
  %.4 = shl i32 %.1, 1
  ret i32 %.4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @funcionB(i32 %.1) local_unnamed_addr #3 {
entry:
  %.4 = tail call i32 @funcionA(i32 %.1)
  %.6 = mul i32 %.4, 3
  ret i32 %.6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @doble(i32 %.1) local_unnamed_addr #3 {
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
define i32 @fibonacci(i32 %.1) local_unnamed_addr #5 {
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
define i32 @main() local_unnamed_addr #6 {
entry:
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([21 x i8], [21 x i8]* @str.-3210507871185922628, i64 0, i64 0))
  %strconv_buf1 = alloca [32 x i8], align 1
  %strconv_buf1.sub = getelementptr inbounds [32 x i8], [32 x i8]* %strconv_buf1, i64 0, i64 0
  %.11 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %strconv_buf1.sub, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_7450633905943628218, i64 0, i64 0), double 0x493996D59D516629)
  %concat_buf2 = alloca [256 x i8], align 1
  %concat_buf2.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf2, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(26) %concat_buf2.sub, i8* noundef nonnull align 16 dereferenceable(26) getelementptr inbounds ([26 x i8], [26 x i8]* @str.6675082147490602344, i64 0, i64 0), i64 26, i1 false)
  %.14 = call i8* @strcat(i8* noundef nonnull %concat_buf2.sub, i8* noundef nonnull %strconv_buf1.sub)
  %puts3 = call i32 @puts(i8* nonnull %concat_buf2.sub)
  %concat_buf.14 = alloca [256 x i8], align 1
  %concat_buf.14.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.14, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(9) %concat_buf.14.sub, i8* noundef nonnull align 1 dereferenceable(9) getelementptr inbounds ([9 x i8], [9 x i8]* @str.3613693433752715259, i64 0, i64 0), i64 9, i1 false)
  %strlen = call i64 @strlen(i8* noundef nonnull %concat_buf.14.sub)
  %endptr = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.14, i64 0, i64 %strlen
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(12) %endptr, i8* noundef nonnull align 1 dereferenceable(12) getelementptr inbounds ([12 x i8], [12 x i8]* @str.4412541974357060881, i64 0, i64 0), i64 12, i1 false)
  %concat_buf.25 = alloca [256 x i8], align 1
  %concat_buf.25.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.25, i64 0, i64 0
  %.24 = call i8* @strcpy(i8* noundef nonnull %concat_buf.25.sub, i8* noundef nonnull %concat_buf.14.sub)
  %strlen6 = call i64 @strlen(i8* noundef nonnull %concat_buf.25.sub)
  %endptr7 = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.25, i64 0, i64 %strlen6
  %0 = bitcast i8* %endptr7 to i64*
  store i64 9054617545565514, i64* %0, align 1
  %concat_buf.38 = alloca [256 x i8], align 1
  %concat_buf.38.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.38, i64 0, i64 0
  %.28 = call i8* @strcpy(i8* noundef nonnull %concat_buf.38.sub, i8* noundef nonnull %concat_buf.25.sub)
  %strlen9 = call i64 @strlen(i8* noundef nonnull %concat_buf.38.sub)
  %endptr10 = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.38, i64 0, i64 %strlen9
  %1 = bitcast i8* %endptr10 to i64*
  store i64 31371757090926418, i64* %1, align 1
  %puts11 = call i32 @puts(i8* nonnull %concat_buf.38.sub)
  %strconv_buf.112 = alloca [32 x i8], align 1
  %strconv_buf.112.sub = getelementptr inbounds [32 x i8], [32 x i8]* %strconv_buf.112, i64 0, i64 0
  %.38 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %strconv_buf.112.sub, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_7450633905943628218, i64 0, i64 0), double 0x60EBB6A28CCF8E12)
  %concat_buf.413 = alloca [256 x i8], align 1
  %concat_buf.413.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.413, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(20) %concat_buf.413.sub, i8* noundef nonnull align 16 dereferenceable(20) getelementptr inbounds ([20 x i8], [20 x i8]* @str.-4569468012284973367, i64 0, i64 0), i64 20, i1 false)
  %.41 = call i8* @strcat(i8* noundef nonnull %concat_buf.413.sub, i8* noundef nonnull %strconv_buf.112.sub)
  %puts14 = call i32 @puts(i8* nonnull %concat_buf.413.sub)
  %.50 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4197FF9BAC000000)
  %.57 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 1.237500e+04)
  %.64 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.750000e+06)
  %.75 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x40558000402C3FFA)
  %.82 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 4.400000e+03)
  %.87 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x552B267BE3DB4CA7)
  %.93 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4200000000000000)
  %strconv_buf.215 = alloca [32 x i8], align 1
  %strconv_buf.215.sub = getelementptr inbounds [32 x i8], [32 x i8]* %strconv_buf.215, i64 0, i64 0
  %.103 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %strconv_buf.215.sub, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_7450633905943628218, i64 0, i64 0), double 2.195200e+04)
  %concat_buf.516 = alloca [256 x i8], align 1
  %concat_buf.516.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.516, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %concat_buf.516.sub, i8* noundef nonnull align 16 dereferenceable(23) getelementptr inbounds ([23 x i8], [23 x i8]* @str.-643552820027265896, i64 0, i64 0), i64 23, i1 false)
  %.106 = call i8* @strcat(i8* noundef nonnull %concat_buf.516.sub, i8* noundef nonnull %strconv_buf.215.sub)
  %puts17 = call i32 @puts(i8* nonnull %concat_buf.516.sub)
  %strconv_buf.318 = alloca [32 x i8], align 1
  %strconv_buf.318.sub = getelementptr inbounds [32 x i8], [32 x i8]* %strconv_buf.318, i64 0, i64 0
  %.112 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %strconv_buf.318.sub, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_122684548135079981, i64 0, i64 0), i32 31)
  %concat_buf.619 = alloca [256 x i8], align 1
  %concat_buf.619.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.619, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(9) %concat_buf.619.sub, i8* noundef nonnull align 1 dereferenceable(9) getelementptr inbounds ([9 x i8], [9 x i8]* @str.-396560488125965123, i64 0, i64 0), i64 9, i1 false)
  %.115 = call i8* @strcat(i8* noundef nonnull %concat_buf.619.sub, i8* noundef nonnull %strconv_buf.318.sub)
  %puts20 = call i32 @puts(i8* nonnull %concat_buf.619.sub)
  %strconv_buf.421 = alloca [32 x i8], align 1
  %strconv_buf.421.sub = getelementptr inbounds [32 x i8], [32 x i8]* %strconv_buf.421, i64 0, i64 0
  %.124 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %strconv_buf.421.sub, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_7450633905943628218, i64 0, i64 0), double 3.125000e+03)
  %concat_buf.722 = alloca [256 x i8], align 1
  %concat_buf.722.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.722, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(18) %concat_buf.722.sub, i8* noundef nonnull align 16 dereferenceable(18) getelementptr inbounds ([18 x i8], [18 x i8]* @str.7352403852144901648, i64 0, i64 0), i64 18, i1 false)
  %.127 = call i8* @strcat(i8* noundef nonnull %concat_buf.722.sub, i8* noundef nonnull %strconv_buf.421.sub)
  %puts23 = call i32 @puts(i8* nonnull %concat_buf.722.sub)
  %.136 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 3.325000e+03)
  %.141 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x5070000000000000)
  %.148 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x5777688BB5394C25)
  %.153 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x43298DB6C2000000)
  %.160 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x41A90B5C98000000)
  %puts24 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @str.7291092878830289736, i64 0, i64 0))
  %.170 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.099520e+05)
  %puts25 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([21 x i8], [21 x i8]* @str.8943300874301979134, i64 0, i64 0))
  %.180 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x519249AD2594C37D)
  %.185 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x519249AD2594C37D)
  %.190 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x5E35F7F689C43051)
  %.198 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x518249AD2594C37D)
  %.205 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x518249AD2594C37D)
  %.212 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x514D42AEA2879F2E)
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %w.054 = phi i32 [ 0, %entry ], [ %.225, %for.body ]
  %.218 = sitofp i32 %w.054 to double
  %.219 = call double @llvm.pow.f64(double 5.000000e+01, double %.218)
  %.221 = fdiv double %.219, 5.000000e+01
  %.223 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.221)
  %.225 = add nuw nsw i32 %w.054, 1
  %.215 = icmp ult i32 %w.054, 100
  br i1 %.215, label %for.body, label %for.exit

for.exit:                                         ; preds = %for.body
  %.241 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x41286A6880000000)
  %.248 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 616792064)
  %.255 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x418F28C280000000)
  %.262 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x3FC3800000000000)
  %.271 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x401802ECE80C541B)
  br label %for.body.1

for.body.1:                                       ; preds = %for.exit, %for.body.1
  %storemerge53 = phi i32 [ 0, %for.exit ], [ %.291, %for.body.1 ]
  %ldexp41 = call double @ldexp(double 1.000000e+00, i32 %storemerge53)
  %.280 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp41)
  %strconv_buf.542 = alloca [32 x i8], align 1
  %strconv_buf.542.sub = getelementptr inbounds [32 x i8], [32 x i8]* %strconv_buf.542, i64 0, i64 0
  %.284 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %strconv_buf.542.sub, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_122684548135079981, i64 0, i64 0), i32 %storemerge53)
  %concat_buf.843 = alloca [256 x i8], align 1
  %concat_buf.843.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.843, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %concat_buf.843.sub, i8* noundef nonnull align 1 dereferenceable(6) getelementptr inbounds ([6 x i8], [6 x i8]* @str.7217103673683584462, i64 0, i64 0), i64 6, i1 false)
  %.287 = call i8* @strcat(i8* noundef nonnull %concat_buf.843.sub, i8* noundef nonnull %strconv_buf.542.sub)
  %puts44 = call i32 @puts(i8* nonnull %concat_buf.843.sub)
  %.291 = add nuw nsw i32 %storemerge53, 1
  %.274 = icmp ult i32 %storemerge53, 100
  br i1 %.274, label %for.body.1, label %for.exit.1

for.exit.1:                                       ; preds = %for.body.1
  %.300 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 3.127000e+03)
  %.305 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x49C191F60B32349E)
  %.310 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x421C6BF526340000)
  %.313 = call double @llvm.pow.f64(double 8.300000e+01, double 5.550000e+02)
  %.315 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.313)
  %.322 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.089000e+03)
  %.328 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.000000e+01)
  %.348 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double -5.852000e+03)
  %.353 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x467078C6E4F7D754)
  %puts26 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @str.-2119849515522328904, i64 0, i64 0))
  %.367 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x425B0829007D0000)
  %.377 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.250500e+04)
  %.379 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 5)
  %.382 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 2)
  %puts40 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-7234436746275970846, i64 0, i64 0))
  %puts40.1 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-7234436746275970846, i64 0, i64 0))
  %puts40.2 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-7234436746275970846, i64 0, i64 0))
  %puts40.3 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-7234436746275970846, i64 0, i64 0))
  %puts40.4 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-7234436746275970846, i64 0, i64 0))
  %puts40.5 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-7234436746275970846, i64 0, i64 0))
  %puts40.6 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-7234436746275970846, i64 0, i64 0))
  %puts40.7 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-7234436746275970846, i64 0, i64 0))
  %puts40.8 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-7234436746275970846, i64 0, i64 0))
  %puts40.9 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-7234436746275970846, i64 0, i64 0))
  %puts40.10 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-7234436746275970846, i64 0, i64 0))
  %ldexp = call double @ldexp(double 1.000000e+00, i32 2)
  %.404 = fadd double %ldexp, 0x4140C91A00000000
  %.406 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.404)
  %.413 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 4.665800e+04)
  %x = alloca i32, align 4
  store i32 10, i32* %x, align 4
  %.420 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 1.000000e+20)
  %.427 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x438C1F14DD0B7DB2)
  %.431 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 16510)
  %.436 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.445 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.445.1 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.445.2 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.445.3 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.445.4 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.445.5 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.445.6 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.445.7 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.445.8 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.445.9 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.445.10 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -195)
  %.457 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4E7249AD2594C37D)
  %.458 = call i32 @fibonacci(i32 50)
  %.461 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.458)
  %.475 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x41286A6880000000)
  %.482 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 616792064)
  %.489 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x418F28C280000000)
  %.496 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x3FC3800000000000)
  %.505 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x401802ECE80C541B)
  %.512 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 3.127000e+03)
  %.517 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x49C191F60B32349E)
  %.522 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x421C6BF526340000)
  %.527 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.313)
  %.534 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.089000e+03)
  %.542 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4197FF9BAC000000)
  %.549 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 1.237500e+04)
  %.556 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.750000e+06)
  %.567 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x40558000402C3FFA)
  %.574 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 4.400000e+03)
  %.579 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x552B267BE3DB4CA7)
  %.584 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4200000000000000)
  %.587 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 10)
  %.591 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 42)
  %.595 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 20)
  %.600 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.000000e+00)
  %.605 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 8.000000e+00)
  %.612 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.120000e+02)
  %.621 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 9.000000e+00)
  %.633 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.100000e+01)
  %.638 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.500000e+00)
  %.643 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -6)
  %.649 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 0)
  %ldexp39 = call double @ldexp(double 1.000000e+00, i32 0)
  %.654 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp39)
  %.649.1 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 1)
  %ldexp39.1 = call double @ldexp(double 1.000000e+00, i32 1)
  %.654.1 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp39.1)
  %.649.2 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 2)
  %ldexp39.2 = call double @ldexp(double 1.000000e+00, i32 2)
  %.654.2 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp39.2)
  %.649.3 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 3)
  %ldexp39.3 = call double @ldexp(double 1.000000e+00, i32 3)
  %.654.3 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp39.3)
  %.649.4 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 4)
  %ldexp39.4 = call double @ldexp(double 1.000000e+00, i32 4)
  %.654.4 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp39.4)
  %.649.5 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 5)
  %ldexp39.5 = call double @ldexp(double 1.000000e+00, i32 5)
  %.654.5 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp39.5)
  %.649.6 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 6)
  %ldexp39.6 = call double @ldexp(double 1.000000e+00, i32 6)
  %.654.6 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp39.6)
  %.649.7 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 7)
  %ldexp39.7 = call double @ldexp(double 1.000000e+00, i32 7)
  %.654.7 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp39.7)
  %.649.8 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 8)
  %ldexp39.8 = call double @ldexp(double 1.000000e+00, i32 8)
  %.654.8 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp39.8)
  %.649.9 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 9)
  %ldexp39.9 = call double @ldexp(double 1.000000e+00, i32 9)
  %.654.9 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %ldexp39.9)
  %.665 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4197FF9BAC000000)
  %.672 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 1.237500e+04)
  %.679 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.750000e+06)
  %.690 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x40558000402C3FFA)
  %.697 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 4.400000e+03)
  %.702 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x552B267BE3DB4CA7)
  %.707 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4200000000000000)
  %puts30 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @str.-2298784497398318728, i64 0, i64 0))
  %puts31 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str.8406852103763921732, i64 0, i64 0))
  %.715 = call i32 @suma()
  %puts32 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([73 x i8], [73 x i8]* @str.-4658157915766798537, i64 0, i64 0))
  %.720 = call i32 @doble(i32 10)
  %.723 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.720)
  %puts33 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([19 x i8], [19 x i8]* @str.7395103503712258414, i64 0, i64 0))
  %.727 = call i32 @funcionB(i32 5)
  %.729 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.727)
  %puts34 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([2 x i8], [2 x i8]* @str.-3334893379800373686, i64 0, i64 0))
  %.739 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4197FF9BAC000000)
  %.746 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 1.237500e+04)
  %.753 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.750000e+06)
  %.764 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x40558000402C3FFA)
  %.771 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 4.400000e+03)
  %.776 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x552B267BE3DB4CA7)
  %.781 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4200000000000000)
  %.784 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 10)
  %.786 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.500000e+01)
  %puts35 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @str.1587425158494560781, i64 0, i64 0))
  %.797 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.314500e+05)
  %.806 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 8.000000e+02)
  %.813 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x43B4ADF4B7320335)
  %.817 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 23)
  %.822 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.904900e+14)
  %.844 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.400000e+01)
  %.852 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x4202A05F20500000)
  %puts36 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str.4376633864494759195, i64 0, i64 0))
  %.876 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x41286A6880000000)
  %.883 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 616792064)
  %.890 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x418F28C280000000)
  %.897 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x3FC3800000000000)
  %.906 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x401802ECE80C541B)
  %.913 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 3.127000e+03)
  %.918 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x49C191F60B32349E)
  %.923 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x421C6BF526340000)
  %.928 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.313)
  %.935 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.089000e+03)
  %x.7.pr = load i32, i32* %x, align 4
  %.93747 = icmp sgt i32 %x.7.pr, 0
  br i1 %.93747, label %while.body.1, label %for.cond.4.preheader

for.cond.4.preheader:                             ; preds = %while.body.1, %for.exit.1
  %x.7.lcssa = phi i32 [ %x.7.pr, %for.exit.1 ], [ 0, %while.body.1 ]
  store i32 %x.7.lcssa, i32* %x, align 4
  br label %for.body.4

while.body.1:                                     ; preds = %for.exit.1, %while.body.1
  %x.748 = phi i32 [ %.941, %while.body.1 ], [ %x.7.pr, %for.exit.1 ]
  %.940 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %x.748)
  %.941 = add nsw i32 %x.748, -1
  %.937 = icmp ugt i32 %x.748, 1
  br i1 %.937, label %while.body.1, label %for.cond.4.preheader

for.body.4:                                       ; preds = %for.cond.4.preheader, %for.body.4
  %storemerge3745 = phi i32 [ 0, %for.cond.4.preheader ], [ %.951, %for.body.4 ]
  %.949 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %storemerge3745)
  %.951 = add nuw nsw i32 %storemerge3745, 1
  %.946 = icmp ult i32 %storemerge3745, 100
  br i1 %.946, label %for.body.4, label %for.exit.4

for.exit.4:                                       ; preds = %for.body.4
  %.954 = call i32 @contarHasta(i32 5)
  %.955 = call i32 @potencia(i32 2, i32 3)
  %.957 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.955)
  %.958 = call i32 @sumar(i32 5, i32 7)
  %.960 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.958)
  %.961 = call i32 @sumaHasta(i32 5)
  %.964 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.961)
  %.978 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x41286A6880000000)
  %.985 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 616792064)
  %.992 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x418F28C280000000)
  %.999 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x3FC3800000000000)
  %.1008 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x401802ECE80C541B)
  %.1015 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 3.127000e+03)
  %.1020 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x49C191F60B32349E)
  %.1025 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x421C6BF526340000)
  %.1030 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double %.313)
  %.1037 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.089000e+03)
  %.1041 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.458)
  %.1044 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 10)
  %.1045 = shl i32 %x.7.lcssa, 2
  %.1046 = or i32 %.1045, 2
  %.1048 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.1046)
  %.1052 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 20)
  %.1057 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.000000e+00)
  %.1062 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 8.000000e+00)
  %.1069 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.120000e+02)
  %.1078 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 9.000000e+00)
  %.1090 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 5.100000e+01)
  %.1095 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 2.500000e+00)
  %.1100 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 -6)
  %.1114 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x41286A6880000000)
  %.1121 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 616792064)
  %.1128 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x418F28C280000000)
  %.1135 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x3FC3800000000000)
  %.1144 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x401802ECE80C541B)
  %.1148 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i64 0, i64 0), i32 %.458)
  %.1155 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 3.127000e+03)
  %.1160 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x49C191F60B32349E)
  %.1165 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x421C6BF526340000)
  %.1170 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 0x55D8B666059ED379)
  %.1177 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_float, i64 0, i64 0), double 6.089000e+03)
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.pow.f64(double, double) #7

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #8

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i64 @strlen(i8* nocapture) #9

; Function Attrs: mustprogress nofree willreturn
declare double @ldexp(double, i32) #10

attributes #0 = { nofree nounwind }
attributes #1 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #3 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #4 = { nofree norecurse nosync nounwind readnone }
attributes #5 = { nofree nosync nounwind readnone }
attributes #6 = { nofree }
attributes #7 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #8 = { argmemonly mustprogress nocallback nofree nounwind willreturn }
attributes #9 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #10 = { mustprogress nofree willreturn }
