; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"strcpy"(i8* %".1", i8* %".2")

declare i8* @"strcat"(i8* %".1", i8* %".2")

declare i32 @"sprintf"(i8* %".1", i8* %".2", ...)

define i1 @"esPrimo"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  %"n.1" = load i32, i32* %"n"
  %".4" = icmp slt i32 %"n.1", 2
  br i1 %".4", label %"then", label %"else"
then:
  ret i1 0
else:
  br label %"ifcont"
ifcont:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  store i32 2, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"i.2" = load i32, i32* %"i"
  %".11" = mul i32 %"i.1", %"i.2"
  %"n.2" = load i32, i32* %"n"
  %".12" = icmp sle i32 %".11", %"n.2"
  br i1 %".12", label %"for.body", label %"for.exit"
for.body:
  %"n.3" = load i32, i32* %"n"
  %"i.3" = load i32, i32* %"i"
  %".14" = srem i32 %"n.3", %"i.3"
  %".15" = icmp eq i32 %".14", 0
  br i1 %".15", label %"then.1", label %"else.1"
for.inc:
  %"i.4" = load i32, i32* %"i"
  %"i.5" = load i32, i32* %"i"
  %".20" = add i32 %"i.5", 1
  store i32 %".20", i32* %"i"
  br label %"for.cond"
for.exit:
  ret i1 1
then.1:
  ret i1 0
else.1:
  br label %"ifcont.1"
ifcont.1:
  br label %"for.inc"
}

define i32 @"main"()
{
entry:
  %".2" = call i1 @"esPrimo"(i32 7)
  %".3" = zext i1 %".2" to i32
  %".4" = bitcast [4 x i8]* @"fmt_boolean" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".3")
  %".6" = call i1 @"esPrimo"(i32 10)
  %".7" = zext i1 %".6" to i32
  %".8" = bitcast [4 x i8]* @"fmt_boolean" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".7")
  ret i32 0
}

@"fmt_boolean" = internal constant [4 x i8] c"%d\0a\00"