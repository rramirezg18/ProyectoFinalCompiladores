@fmt_int    = internal constant [4 x i8]  c"%d\0A\00"
@fmt_string = internal constant [12 x i8] c"Resultado: \00"
declare i32 @printf(i8*, ...) 

define i64 @ackermann(i64 %m, i64 %n) {
entry:
  %is_m0 = icmp eq i64 %m, 0
  br i1 %is_m0, label %case_m0, label %m_pos

case_m0:
  %add0 = add i64 %n, 1
  ret i64 %add0

m_pos:
  %is_n0 = icmp eq i64 %n, 0
  br i1 %is_n0, label %case_n0, label %recursive

case_n0:
  %m_minus1 = sub i64 %m, 1
  %tc = tail call i64 @ackermann(i64 %m_minus1, i64 1)
  ret i64 %tc

recursive:
  %n_minus1   = sub i64 %n, 1
  %inner      = call    i64 @ackermann(i64 %m,       i64 %n_minus1)
  %m_minus1_2 = sub     i64 %m,       1
  %outer      = call    i64 @ackermann(i64 %m_minus1_2, i64 %inner)
  ret i64 %outer
}

define i32 @main() {
entry:
  %res = call i64 @ackermann(i64 2, i64 3)

  call i32 @printf(i8* bitcast ([12 x i8]* @fmt_string to i8*))
  call i32 @printf(i8* bitcast ([4 x i8]*  @fmt_int    to i8*), i64 %res)
  ret i32 0
}
