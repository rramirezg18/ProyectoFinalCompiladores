; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %".2" = sitofp i32 6 to double
  %".3" = sitofp i32 1 to double
  %".4" = fdiv double %".2", %".3"
  %".5" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", double %".4")
  ret i32 0
}

@"fmt_float" = internal constant [4 x i8] c"%f\0a\00"