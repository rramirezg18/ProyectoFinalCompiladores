; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %".2" = sitofp i32 25 to double
  %".3" = sitofp i32 25 to double
  %".4" = call double @"llvm.pow.f64"(double %".2", double %".3")
  %".5" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", double %".4")
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %".9" = icmp sle i32 %"i.1", 1000
  br i1 %".9", label %"for.body", label %"for.exit"
for.body:
  %"i.2" = load i32, i32* %"i"
  %".11" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"i.2")
  %"i.3" = load i32, i32* %"i"
  %".13" = sitofp i32 2 to double
  %".14" = sitofp i32 %"i.3" to double
  %".15" = call double @"llvm.pow.f64"(double %".13", double %".14")
  %".16" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16", double %".15")
  br label %"for.inc"
for.inc:
  %"i.4" = load i32, i32* %"i"
  %"i.5" = load i32, i32* %"i"
  %".19" = add i32 %"i.5", 1
  store i32 %".19", i32* %"i"
  br label %"for.cond"
for.exit:
  ret i32 0
}

declare double @"llvm.pow.f64"(double %".1", double %".2")

@"fmt_float" = internal constant [4 x i8] c"%f\0a\00"
@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"