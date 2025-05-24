; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"strcpy"(i8* %".1", i8* %".2")

declare i8* @"strcat"(i8* %".1", i8* %".2")

declare i32 @"sprintf"(i8* %".1", i8* %".2", ...)

define i32 @"main"()
{
entry:
  %"i" = alloca i32
  store i32 1, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %".4" = icmp sle i32 %"i.1", 10
  br i1 %".4", label %"for.body", label %"for.exit"
for.body:
  %"i.2" = load i32, i32* %"i"
  %".6" = srem i32 %"i.2", 2
  %".7" = icmp eq i32 %".6", 0
  br i1 %".7", label %"then", label %"else"
for.inc:
  %"i.4" = load i32, i32* %"i"
  %"i.5" = load i32, i32* %"i"
  %".18" = add i32 %"i.5", 1
  store i32 %".18", i32* %"i"
  br label %"for.cond"
for.exit:
  ret i32 0
then:
  %"i.3" = load i32, i32* %"i"
  %".9" = mul i32 %"i.3", 10
  %".10" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".9")
  br label %"ifcont"
else:
  %".13" = add i32 2, 2
  %".14" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".13")
  br label %"ifcont"
ifcont:
  br label %"for.inc"
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"