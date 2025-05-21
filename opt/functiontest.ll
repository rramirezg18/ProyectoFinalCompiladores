; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"potencia"(i32 %".1", i32 %".2")
{
entry:
  %"base" = alloca i32
  store i32 %".1", i32* %"base"
  %"exponente" = alloca i32
  store i32 %".2", i32* %"exponente"
  %"base.1" = load i32, i32* %"base"
  %"exponente.1" = load i32, i32* %"exponente"
  %".6" = sitofp i32 %"base.1" to double
  %".7" = sitofp i32 %"exponente.1" to double
  %".8" = call double @"llvm.pow.f64"(double %".6", double %".7")
  %".9" = fptosi double %".8" to i32
  ret i32 %".9"
}

define i32 @"main"()
{
entry:
  %".2" = call i32 @"potencia"(i32 2, i32 3)
  %".3" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".2")
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"
declare double @"llvm.pow.f64"(double %".1", double %".2")
