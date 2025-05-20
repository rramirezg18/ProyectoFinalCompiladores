; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"sumar"(i32 %".1", i32 %".2")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  %"a.1" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %".6" = add i32 %"a.1", %"b.1"
  ret i32 %".6"
}

define i32 @"main"()
{
entry:
  %".2" = call i32 @"sumar"(i32 5, i32 7)
  %".3" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".2")
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"