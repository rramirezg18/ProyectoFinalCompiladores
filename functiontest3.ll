; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"factorial"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  %"n.1" = load i32, i32* %"n"
  %".4" = icmp sle i32 %"n.1", 0
  br i1 %".4", label %"then", label %"else"
then:
  ret i32 1
else:
  br label %"ifcont"
ifcont:
  %"n.2" = load i32, i32* %"n"
  %"n.3" = load i32, i32* %"n"
  %".8" = sub i32 %"n.3", 1
  %".9" = call i32 @"factorial"(i32 %".8")
  %".10" = mul i32 %"n.2", %".9"
  ret i32 %".10"
}

define i32 @"main"()
{
entry:
  %".2" = call i32 @"factorial"(i32 5)
  %".3" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".2")
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"