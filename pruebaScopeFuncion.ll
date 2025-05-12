; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"suma"()
{
entry:
  %"numero1" = alloca i32
  store i32 5, i32* %"numero1"
  %"numero2" = alloca i32
  store i32 5, i32* %"numero2"
  %"resultado" = alloca i32
  %"numero1.1" = load i32, i32* %"numero1"
  %"numero2.1" = load i32, i32* %"numero2"
  %".4" = add i32 %"numero1.1", %"numero2.1"
  store i32 %".4", i32* %"resultado"
  %"resultado.1" = load i32, i32* %"resultado"
  %".6" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"resultado.1")
  ret i32 0
}

define i32 @"main"()
{
entry:
  %"numero1" = alloca i32
  store i32 5, i32* %"numero1"
  %"numero2" = alloca i32
  store i32 5, i32* %"numero2"
  %".4" = call i32 @"suma"()
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"