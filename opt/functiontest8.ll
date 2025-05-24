; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"strcpy"(i8* %".1", i8* %".2")

declare i8* @"strcat"(i8* %".1", i8* %".2")

declare i32 @"sprintf"(i8* %".1", i8* %".2", ...)

define i32 @"suma"()
{
entry:
  %"num1" = alloca i32
  store i32 10, i32* %"num1"
  %"num2" = alloca i32
  store i32 20, i32* %"num2"
  %"num3" = alloca i32
  store i32 30, i32* %"num3"
  %"resultado" = alloca i32
  %"num1.1" = load i32, i32* %"num1"
  %"num2.1" = load i32, i32* %"num2"
  %".5" = add i32 %"num1.1", %"num2.1"
  %"num3.1" = load i32, i32* %"num3"
  %".6" = add i32 %".5", %"num3.1"
  store i32 %".6", i32* %"resultado"
  %"resultado.1" = load i32, i32* %"resultado"
  %".8" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"resultado.1")
  ret i32 0
}

define i32 @"main"()
{
entry:
  %".2" = bitcast [11 x i8]* @"str.8035883297296007167" to i8*
  %".3" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i8* %".2")
  %".5" = call i32 @"suma"()
  ret i32 0
}

@"str.8035883297296007167" = internal constant [11 x i8] c"La suma es\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"