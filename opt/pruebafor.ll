; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"i" = alloca i32
  store i32 1000000, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %".4" = icmp sge i32 %"i.1", 0
  br i1 %".4", label %"for.body", label %"for.exit"
for.body:
  %"i.2" = load i32, i32* %"i"
  %".6" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"i.2")
  br label %"for.inc"
for.inc:
  %"i.3" = load i32, i32* %"i"
  %"i.4" = load i32, i32* %"i"
  %".9" = sub i32 %"i.4", 1
  store i32 %".9", i32* %"i"
  br label %"for.cond"
for.exit:
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"