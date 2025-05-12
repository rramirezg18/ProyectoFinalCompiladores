; ModuleID = "main"
declare i32 @printf(i8*, ...)

@"fmt_int"    = internal constant [4 x i8] c"%d\0a\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"str.Select" = internal constant [16 x i8] c"Selection Sort:\00"

; ------------------------------------------------------------------
; selectionSort optimizado (sin alloca/load/store internos)
; ------------------------------------------------------------------
define i32 @selectionSort(i32 %a, i32 %b, i32 %c) {
entry:
  ; 1) Ordenar a y b
  %cmp_ab   = icmp sgt i32 %a, %b
  %a1       = select i1 %cmp_ab, i32 %b, i32 %a
  %b1       = select i1 %cmp_ab, i32 %a, i32 %b

  ; 2) Ordenar a1 y c
  %cmp_ac   = icmp sgt i32 %a1, %c
  %a2       = select i1 %cmp_ac, i32 %c,  i32 %a1
  %c1       = select i1 %cmp_ac, i32 %a1, i32 %c

  ; 3) Ordenar b1 y c1
  %cmp_bc   = icmp sgt i32 %b1, %c1
  %b2       = select i1 %cmp_bc, i32 %c1, i32 %b1
  %c2       = select i1 %cmp_bc, i32 %b1, i32 %c1

  ; 4) Imprimir resultados
  %fmt_i    = bitcast [4 x i8]* @"fmt_int" to i8*
  call i32 (i8*, ...) @printf(i8* %fmt_i, i32 %a2)
  call i32 (i8*, ...) @printf(i8* %fmt_i, i32 %b2)
  call i32 (i8*, ...) @printf(i8* %fmt_i, i32 %c2)

  ret i32 0
}

; ------------------------------------------------------------------
; main optimizado (sólo un alloca por variable, carga única)
; ------------------------------------------------------------------
define i32 @main() {
entry:
  ; reservamos espacio y asignamos constantes
  %a = alloca i32
  %b = alloca i32
  %c = alloca i32
  store i32 3, i32* %a
  store i32 1, i32* %b
  store i32 2, i32* %c

  ; imprimimos encabezado
  %msg = bitcast [16 x i8]* @"str.Select" to i8*
  %fmt = bitcast [4 x i8]*  @"fmt_string" to i8*
  call i32 (i8*, ...) @printf(i8* %fmt, i8* %msg)

  ; cargamos valores una sola vez y llamamos
  %a0 = load i32, i32* %a
  %b0 = load i32, i32* %b
  %c0 = load i32, i32* %c
  call i32 @selectionSort(i32 %a0, i32 %b0, i32 %c0)

  ret i32 0
}
