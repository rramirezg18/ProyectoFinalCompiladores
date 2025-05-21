; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-linux-gnu"

@str.-7167250634943350552 = internal constant [13 x i8] c"mi edad es: \00"
@fmt_1182425524083821122 = internal constant [3 x i8] c"%d\00"
@str.-3853744401923204774 = internal constant [5 x i8] c"hola\00"
@str.-9121464976246647715 = internal constant [15 x i8] c"hola soy messi\00"
@str.-6629683823316762691 = internal constant [10 x i8] c"Cristiano\00"

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare i8* @strcat(i8* noalias returned, i8* noalias nocapture readonly) local_unnamed_addr #0

; Function Attrs: nofree nounwind
declare noundef i32 @sprintf(i8* noalias nocapture noundef writeonly, i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree nounwind
define noalias i8* @nombre() local_unnamed_addr #1 {
entry:
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.-3853744401923204774, i64 0, i64 0))
  %puts1 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str.-9121464976246647715, i64 0, i64 0))
  %concat_buf2 = alloca [256 x i8], align 4
  %concat_buf2.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf2, i64 0, i64 0
  %0 = bitcast [256 x i8]* %concat_buf2 to i32*
  store i32 7958355, i32* %0, align 4
  %strlen = call i64 @strlen(i8* noundef nonnull %concat_buf2.sub)
  %endptr = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf2, i64 0, i64 %strlen
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(10) %endptr, i8* noundef nonnull align 1 dereferenceable(10) getelementptr inbounds ([10 x i8], [10 x i8]* @str.-6629683823316762691, i64 0, i64 0), i64 10, i1 false)
  %puts3 = call i32 @puts(i8* nonnull %concat_buf2.sub)
  ret i8* null
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #1 {
entry:
  %.2 = tail call i8* @nombre()
  %strconv_buf1 = alloca [32 x i8], align 1
  %strconv_buf1.sub = getelementptr inbounds [32 x i8], [32 x i8]* %strconv_buf1, i64 0, i64 0
  %.7 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %strconv_buf1.sub, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_1182425524083821122, i64 0, i64 0), i32 18)
  %concat_buf2 = alloca [256 x i8], align 1
  %concat_buf2.sub = getelementptr inbounds [256 x i8], [256 x i8]* %concat_buf2, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(13) %concat_buf2.sub, i8* noundef nonnull align 1 dereferenceable(13) getelementptr inbounds ([13 x i8], [13 x i8]* @str.-7167250634943350552, i64 0, i64 0), i64 13, i1 false)
  %.10 = call i8* @strcat(i8* noundef nonnull %concat_buf2.sub, i8* noundef nonnull %strconv_buf1.sub)
  %puts = call i32 @puts(i8* nonnull %concat_buf2.sub)
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
