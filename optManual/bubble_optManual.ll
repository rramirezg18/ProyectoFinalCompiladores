; Módulo optimizado

declare i32 @printf(i8*, ...)

; Formato para enteros y strings
@"fmt_int"    = internal constant [4 x i8] c"%d\0a\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"str.Bubble" = internal constant [13 x i8] c"Bubble Sort:\00"

; ------------------------------------------------------------------
; Versión optimizada de bubbleSort, sin allocas ni stores intermedios
; ------------------------------------------------------------------
define i32 @bubbleSort(i32 %a, i32 %b, i32 %c) {
entry:
  ; Primer swap: if (a > b) swap(a,b)
  %cmp1     = icmp sgt i32 %a, %b
  br i1 %cmp1, label %swap1, label %cont1

swap1:
  ; Intercambio: a_new = b, b_new = a
  br label %cont1

cont1:
  %a1 = phi i32 [ %b, %swap1 ], [ %a, %entry ]
  %b1 = phi i32 [ %a, %swap1 ], [ %b, %entry ]

  ; Segundo swap: if (b1 > c) swap(b1,c)
  %cmp2     = icmp sgt i32 %b1, %c
  br i1 %cmp2, label %swap2, label %cont2

swap2:
  ; Intercambio: b2 = c, c2 = b1
  br label %cont2

cont2:
  %b2 = phi i32 [ %c,  %swap2 ], [ %b1, %cont1 ]
  %c2 = phi i32 [ %b1, %swap2 ], [ %c,  %cont1 ]

  ; Tercer swap: if (a1 > b2) swap(a1,b2)
  %cmp3     = icmp sgt i32 %a1, %b2
  br i1 %cmp3, label %swap3, label %cont3

swap3:
  ; Intercambio: a3 = b2, b3 = a1
  br label %cont3

cont3:
  %a3 = phi i32 [ %b2, %swap3 ], [ %a1, %cont2 ]
  %b3 = phi i32 [ %a1, %swap3 ], [ %b2, %cont2 ]

  ; Impresión de resultados
  %fmt_i = bitcast [4 x i8]* @"fmt_int" to i8*
  call i32 (i8*, ...) @printf(i8* %fmt_i, i32 %a3)
  call i32 (i8*, ...) @printf(i8* %fmt_i, i32 %b3)
  call i32 (i8*, ...) @printf(i8* %fmt_i, i32 %c2)

  ; Siempre devolvemos 0
  ret i32 0
}

; ------------------------------------------------------------------
; Versión optimizada de main: eliminamos cargas redundantes
; ------------------------------------------------------------------
define i32 @main() {
entry:
  ; Inmediata inicialización de a,b,c
  %a = alloca i32
  %b = alloca i32
  %c = alloca i32
  store i32 3, i32* %a
  store i32 1, i32* %b
  store i32 2, i32* %c

  ; Print “Bubble Sort:”
  %msg = bitcast [13 x i8]* @"str.Bubble" to i8*
  %fmt = bitcast [4 x i8]* @"fmt_string" to i8*
  call i32 (i8*, ...) @printf(i8* %fmt, i8* %msg)

  ; Llamada optimizada: cargamos valores solo una vez
  %a0 = load i32, i32* %a
  %b0 = load i32, i32* %b
  %c0 = load i32, i32* %c
  call i32 @bubbleSort(i32 %a0, i32 %b0, i32 %c0)

  ret i32 0
}
