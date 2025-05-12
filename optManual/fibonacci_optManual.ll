@fmt_int    = internal constant [4 x i8]  c"%d\0A\00"
@fmt_string = internal constant [4 x i8]  c"%s\0A\00"
@msg        = internal constant [46 x i8] c"El resultado de la secuencia de fibonacci es:\00"

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  br label %loop

loop:                                             ; preds = %entry, %body
  ; φ-nodes correctamente referenciados
  %i = phi i32 [ 0,      %entry ], [ %i_next,    %body ]
  %a = phi i32 [ 0,      %entry ], [ %b,         %body ]
  %b = phi i32 [ 1,      %entry ], [ %next_val,  %body ]

  ; Condición del bucle: i < 10
  %cmp = icmp slt i32 %i, 10
  br i1 %cmp, label %body, label %exit

body:                                            ; preds = %loop
  ; Imprime el término actual
  call i32 @printf(i8* bitcast ([4 x i8]* @fmt_int to i8*), i32 %a)

  ; Calcula siguiente valor y el siguiente índice
  %next_val = add i32 %a, %b
  %i_next   = add i32 %i, 1

  br label %loop

exit:                                            ; preds = %loop
  ; Imprime mensaje final y resultado
  call i32 @printf(i8* bitcast ([4 x i8]* @fmt_string to i8*),
                   i8*  bitcast ([46 x i8]* @msg to i8*))
  call i32 @printf(i8* bitcast ([4 x i8]* @fmt_int to i8*),
                   i32 %a)
  ret i32 0
}
