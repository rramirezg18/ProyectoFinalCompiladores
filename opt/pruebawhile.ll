; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 0, i32* %"x"
  br label %"while.cond"
while.cond:
  %"x.1" = load i32, i32* %"x"
  %".4" = icmp sle i32 %"x.1", 10
  br i1 %".4", label %"while.body", label %"while.end"
while.body:
  %"x.2" = load i32, i32* %"x"
  %".6" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"x.2")
  %"x.3" = load i32, i32* %"x"
  %".8" = add i32 %"x.3", 1
  store i32 %".8", i32* %"x"
  br label %"while.cond"
while.end:
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"