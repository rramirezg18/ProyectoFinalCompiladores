; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 4, i32* %"x"
  %"x.1" = load i32, i32* %"x"
  %".3" = icmp slt i32 %"x.1", 5
  br i1 %".3", label %"then", label %"else"
then:
  store i32 3, i32* %"x"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i32, i32* %"x"
  %".8" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"x.2")
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"