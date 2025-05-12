; Hoisted format string
@fmt_int = internal constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  br label %i.loop

; Outer loop: for i = 1 to 3
i.loop:                                    ; preds = %entry, %i.inc
  %i = phi i32 [ 1, %entry ], [ %i_next, %i.inc ]
  %cmp_i = icmp sle i32 %i, 3
  br i1 %cmp_i, label %j.loop_entry, label %exit

; Middle loop: for j = 1 to 3
j.loop_entry:                              ; preds = %i.loop, %j.inc
  %j = phi i32 [ 1, %i.loop ], [ %j_next, %j.inc ]
  %cmp_j = icmp sle i32 %j, 3
  br i1 %cmp_j, label %j.body, label %j.exit

j.body:                                    ; preds = %j.loop_entry
  %neq_ij = icmp ne i32 %i, %j
  br i1 %neq_ij, label %k.loop_entry, label %j.inc

; Inner loop: for k = 1 to 3
k.loop_entry:                              ; preds = %j.body, %k.inc
  %k = phi i32 [ 1, %j.body ], [ %k_next, %k.inc ]
  %cmp_k = icmp sle i32 %k, 3
  br i1 %cmp_k, label %k.body, label %k.exit

k.body:                                    ; preds = %k.loop_entry
  %neq_ik = icmp ne i32 %i, %k
  br i1 %neq_ik, label %k.check_j, label %k.inc

k.check_j:                                 ; preds = %k.body
  %neq_jk = icmp ne i32 %j, %k
  br i1 %neq_jk, label %print, label %k.inc

print:                                     ; preds = %k.check_j
  ; perm = i*100 + j*10 + k
  %mul_i = mul i32 %i, 100
  %mul_j = mul i32 %j, 10
  %add_ij = add i32 %mul_i, %mul_j
  %perm = add i32 %add_ij, %k
  call i32 @printf(i8* bitcast ([4 x i8]* @fmt_int to i8*), i32 %perm)
  br label %k.inc

k.inc:                                     ; preds = %print, %k.body, %k.check_j
  %k_next = add i32 %k, 1
  br label %k.loop_entry

k.exit:                                    ; preds = %k.loop_entry
  br label %j.inc

j.inc:                                     ; preds = %k.exit, %j.body
  %j_next = add i32 %j, 1
  br label %j.loop_entry

j.exit:                                    ; preds = %j.loop_entry
  br label %i.inc

i.inc:                                     ; preds = %j.exit
  %i_next = add i32 %i, 1
  br label %i.loop

exit:                                      ; preds = %i.loop
  ret i32 0
}
