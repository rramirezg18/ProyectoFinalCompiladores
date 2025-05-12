; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"ackermann"(i32 %".1", i32 %".2")
{
entry:
  %"m" = alloca i32
  store i32 %".1", i32* %"m"
  %"n" = alloca i32
  store i32 %".2", i32* %"n"
  %"m.1" = load i32, i32* %"m"
  %".6" = icmp eq i32 %"m.1", 0
  br i1 %".6", label %"then", label %"else"
then:
  %"n.1" = load i32, i32* %"n"
  %".8" = add i32 %"n.1", 1
  ret i32 %".8"
else:
  %"m.2" = load i32, i32* %"m"
  %".10" = sub i32 %"m.2", 1
  %"m.3" = load i32, i32* %"m"
  %"n.2" = load i32, i32* %"n"
  %".11" = sub i32 %"n.2", 1
  %".12" = call i32 @"ackermann"(i32 %"m.3", i32 %".11")
  %".13" = call i32 @"ackermann"(i32 %".10", i32 %".12")
  ret i32 %".13"
ifcont:
  ret i32 0
}

define i32 @"main"()
{
entry:
  %"m" = alloca i32
  store i32 2, i32* %"m"
  %"n" = alloca i32
  store i32 3, i32* %"n"
  %"resultado" = alloca i32
  %"m.1" = load i32, i32* %"m"
  %"n.1" = load i32, i32* %"n"
  %".4" = call i32 @"ackermann"(i32 %"m.1", i32 %"n.1")
  store i32 %".4", i32* %"resultado"
  %"resultado.1" = load i32, i32* %"resultado"
  %".6" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"resultado.1")
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"