; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"strcpy"(i8* %".1", i8* %".2")

declare i8* @"strcat"(i8* %".1", i8* %".2")

declare i32 @"sprintf"(i8* %".1", i8* %".2", ...)

define i32 @"funcionA"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  %"n.1" = load i32, i32* %"n"
  %".4" = mul i32 %"n.1", 2
  ret i32 %".4"
}

define i32 @"funcionB"(i32 %".1")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  %"temp" = alloca i32
  %"x.1" = load i32, i32* %"x"
  %".4" = call i32 @"funcionA"(i32 %"x.1")
  store i32 %".4", i32* %"temp"
  %"temp.1" = load i32, i32* %"temp"
  %".6" = mul i32 %"temp.1", 3
  ret i32 %".6"
}

define i32 @"main"()
{
entry:
  %".2" = call i32 @"funcionB"(i32 5)
  %".3" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".2")
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"