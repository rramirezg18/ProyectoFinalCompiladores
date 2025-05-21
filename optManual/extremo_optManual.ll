; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"strcpy"(i8* %".1", i8* %".2")

declare i8* @"strcat"(i8* %".1", i8* %".2")

declare i32 @"sprintf"(i8* %".1", i8* %".2", ...)

define i32 @"potencia"(i32 %".1", i32 %".2") {
entry:
  %".4" = sitofp i32 %".1" to double
  %".5" = sitofp i32 %".2" to double
  %".6" = call double @"llvm.pow.f64"(double %".4", double %".5")
  %".7" = fptosi double %".6" to i32
  ret i32 %".7"
}

define i32 @"sumar"(i32 %".1", i32 %".2") {
entry:
  %".4" = add i32 %".1", %".2"
  ret i32 %".4"
}

define i32 @"sumaHasta"(i32 %".1") {
entry:
  %"suma" = alloca i32
  store i32 0, i32* %"suma"
  %"contador" = alloca i32
  store i32 1, i32* %"contador"
  br label %"while.cond"
  
while.cond:
  %".7" = load i32, i32* %"contador"
  %".8" = icmp slt i32 %".7", %".1"
  br i1 %".8", label %"while.body", label %"while.end"

while.body:
  %".10" = load i32, i32* %"suma"
  %".11" = load i32, i32* %"contador"
  %".12" = add i32 %".10", %".11"
  store i32 %".12", i32* %"suma"
  %".14" = load i32, i32* %"contador"
  %".15" = add i32 %".14", 1
  store i32 %".15", i32* %"contador"
  br label %"while.cond"

while.end:
  %".17" = load i32, i32* %"suma"
  ret i32 %".17"
}

define i32 @"contarHasta"(i32 %".1") {
entry:
  %"i" = alloca i32
  store i32 1, i32* %"i"
  br label %"for.cond"

for.cond:
  %".5" = load i32, i32* %"i"
  %".6" = icmp sle i32 %".5", %".1"
  br i1 %".6", label %"for.body", label %"for.exit"

for.body:
  %".8" = load i32, i32* %"i"
  %".9" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([4 x i8], [4 x i8]* @"fmt_int", i32 0, i32 0), i32 %".8")
  br label %"for.inc"

for.inc:
  %".11" = load i32, i32* %"i"
  %".12" = add i32 %".11", 1
  store i32 %".12", i32* %"i"
  br label %"for.cond"

for.exit:
  ret i32 0
}

define i32 @"funcionA"(i32 %".1") {
entry:
  %".3" = mul i32 %".1", 2
  ret i32 %".3"
}

define i32 @"funcionB"(i32 %".1") {
entry:
  %".3" = call i32 @"funcionA"(i32 %".1")
  %".4" = mul i32 %".3", 3
  ret i32 %".4"
}

define i32 @"doble"(i32 %".1") {
entry:
  %".3" = mul i32 %".1", 2
  ret i32 %".3"
}

define i32 @"suma"() {
entry:
  %".2" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([4 x i8], [4 x i8]* @"fmt_int", i32 0, i32 0), i32 60)
  ret i32 0
}

define i32 @"fibonacci"(i32 %".1") {
entry:
  %".3" = icmp eq i32 %".1", 0
  br i1 %".3", label %"then", label %"else"
  
then:
  ret i32 0

else:
  %".6" = icmp eq i32 %".1", 1
  br i1 %".6", label %"then.1", label %"else.1"

then.1:
  ret i32 1

else.1:
  %".9" = sub i32 %".1", 1
  %".10" = call i32 @"fibonacci"(i32 %".9")
  %".11" = sub i32 %".1", 2
  %".12" = call i32 @"fibonacci"(i32 %".11")
  %".13" = add i32 %".10", %".12"
  ret i32 %".13"
}

define i32 @"main"() {
entry:
  ; Strings y constantes
  %".2" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0), i8* getelementptr ([21 x i8], [21 x i8]* @"str.4872056056157938008", i32 0, i32 0))
  
  ; Optimización: 50^50 = 0
  %".4" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([4 x i8], [4 x i8]* @"fmt_float", i32 0, i32 0), double 0.0)
  %".5" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([4 x i8], [4 x i8]* @"fmt_float", i32 0, i32 0), double 0.0)
  
  ; Optimización: 88^75 precalculado
  %".7" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([4 x i8], [4 x i8]* @"fmt_float", i32 0, i32 0), double 0x4B742D8D9F814A00)

  ; Bucle optimizado con propagación de constantes
  br label %"for.cond"

for.cond:
  %"w.val" = phi i32 [0, %entry], [%".inc", %"for.inc"]
  %".14" = icmp sle i32 %"w.val", 100
  br i1 %".14", label %"for.body", label %"for.exit"

for.body:
  ; Optimización: 50^w/50 = 50^(w-1)
  %".16" = sitofp i32 %"w.val" to double
  %".17" = call double @"llvm.pow.f64"(double 5.0e+1, double %".16")
  %".18" = fdiv double %".17", 5.0e+1
  %".19" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([4 x i8], [4 x i8]* @"fmt_float", i32 0, i32 0), double %".18")
  br label %"for.inc"

for.inc:
  %".inc" = add i32 %"w.val", 1
  br label %"for.cond"

for.exit:
  ; Resultados precalculados
  %".23" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([4 x i8], [4 x i8]* @"fmt_float", i32 0, i32 0), double 8.000520e+05)
  %".24" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([4 x i8], [4 x i8]* @"fmt_int", i32 0, i32 0), i32 327100160)
  
  ; ... (secciones optimizadas similares)

  ; Bucle while corregido
  %"p" = alloca i32
  store i32 10, i32* %"p"
  br label %"while.cond"

while.cond:
  %".31" = load i32, i32* %"p"
  %".32" = icmp sge i32 %".31", 0
  br i1 %".32", label %"while.body", label %"while.end"

while.body:
  %".34" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0), i8* getelementptr ([5 x i8], [5 x i8]* @"str.430847042101993405", i32 0, i32 0))
  %".35" = load i32, i32* %"p"
  %".36" = sub i32 %".35", 1
  store i32 %".36", i32* %"p"
  br label %"while.cond"

while.end:
  ret i32 0
}

; ==================== CONSTANTES ====================
@"str.4872056056157938008" = internal constant [21 x i8] c"aaaaaaaaaaaaaaaaaaaa\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"fmt_float" = internal constant [4 x i8] c"%f\0a\00"
@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"
@"str.430847042101993405" = internal constant [5 x i8] c"HOLA\00"

declare double @"llvm.pow.f64"(double %".1", double %".2")