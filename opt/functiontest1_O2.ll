; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@str.-3280188425427068463 = internal constant [5 x i8] c"Luis\00"
@str.-5574945102278417222 = internal constant [6 x i8] c"EDad \00"
@fmt_1182425524083821122 = internal constant [3 x i8] c"%d\00"

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare i8* @strcat(i8* noalias returned, i8* noalias nocapture readonly) local_unnamed_addr #0

; Function Attrs: nofree nounwind
declare noundef i32 @sprintf(i8* noalias nocapture noundef writeonly, i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #1 {
entry:
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-3280188425427068463, i64 0, i64 0))
  %concat_buf1 = alloca [256 x i8], align 8
  %concat_buf1.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf1, i64 0, i64 0
  %0 = bitcast [256 x i8]* %concat_buf1 to i64*
  store i64 16437090601234286, i64* %0, align 8
  %strlen = call i64 @strlen(i8* noundef nonnull %concat_buf1.sub)
  %endptr = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf1, i64 0, i64 %strlen
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(5) %endptr, i8* noundef nonnull align 1 dereferenceable(5) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-3280188425427068463, i64 0, i64 0), i64 5, i1 false)
  %puts2 = call i32 @puts(i8* nonnull %concat_buf1.sub)
  %strconv_buf3 = alloca [32 x i8], align 1
  %strconv_buf3.sub = getelementptr inbounds [32 x i8], [32 x i8]* %strconv_buf3, i64 0, i64 0
  %.15 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %strconv_buf3.sub, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_1182425524083821122, i64 0, i64 0), i32 21)
  %concat_buf.14 = alloca [256 x i8], align 1
  %concat_buf.14.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf.14, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %concat_buf.14.sub, i8* noundef nonnull align 1 dereferenceable(6) getelementptr inbounds ([6 x i8], [6 x i8]* @str.-5574945102278417222, i64 0, i64 0), i64 6, i1 false)
  %.18 = call i8* @strcat(i8* noundef nonnull %concat_buf.14.sub, i8* noundef nonnull %strconv_buf3.sub)
  %puts5 = call i32 @puts(i8* nonnull %concat_buf.14.sub)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i64 @strlen(i8* nocapture) #3

attributes #0 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { argmemonly mustprogress nocallback nofree nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind readonly willreturn }
