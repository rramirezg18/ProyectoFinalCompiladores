; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"funcion"()
{
entry:
  ret i32 2
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %"y" = alloca i32
  store i32 8, i32* %"y"
  %".4" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 10)
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"