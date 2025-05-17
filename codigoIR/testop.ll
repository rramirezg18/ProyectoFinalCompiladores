; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 3, i32* %"x"
  %".3" = mul i32 2, 5
  %".4" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".3")
  %"x.1" = load i32, i32* %"x"
  %".6" = mul i32 %"x.1", 4
  %".7" = add i32 2, %".6"
  %".8" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".7")
  %".10" = add i32 2, 3
  %".11" = mul i32 %".10", 4
  %".12" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".11")
  %".14" = sitofp i32 10 to double
  %".15" = sitofp i32 2 to double
  %".16" = fdiv double %".14", %".15"
  %".17" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17", double %".16")
  %".19" = sitofp i32 2 to double
  %".20" = sitofp i32 3 to double
  %".21" = call double @"llvm.pow.f64"(double %".19", double %".20")
  %".22" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", double %".21")
  %".24" = sitofp i32 3 to double
  %".25" = sitofp i32 2 to double
  %".26" = call double @"llvm.pow.f64"(double %".24", double %".25")
  %".27" = sitofp i32 2 to double
  %".28" = call double @"llvm.pow.f64"(double %".27", double %".26")
  %".29" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29", double %".28")
  %".31" = mul i32 3, 2
  %".32" = add i32 5, %".31"
  %".33" = sitofp i32 4 to double
  %".34" = sitofp i32 2 to double
  %".35" = fdiv double %".33", %".34"
  %".36" = sitofp i32 %".32" to double
  %".37" = fsub double %".36", %".35"
  %".38" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38", double %".37")
  %".40" = add i32 3, 4
  %".41" = sitofp i32 2 to double
  %".42" = sitofp i32 3 to double
  %".43" = call double @"llvm.pow.f64"(double %".41", double %".42")
  %".44" = sitofp i32 %".40" to double
  %".45" = fmul double %".44", %".43"
  %".46" = sitofp i32 10 to double
  %".47" = sitofp i32 2 to double
  %".48" = fdiv double %".46", %".47"
  %".49" = fsub double %".45", %".48"
  %".50" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50", double %".49")
  %".52" = sitofp i32 5 to double
  %".53" = sitofp i32 2 to double
  %".54" = fdiv double %".52", %".53"
  %".55" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".55", double %".54")
  %".57" = sub i32 0, 2
  %".58" = mul i32 4, %".57"
  %".59" = add i32 2, %".58"
  %".60" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".60", i32 %".59")
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"
@"fmt_float" = internal constant [4 x i8] c"%f\0a\00"
declare double @"llvm.pow.f64"(double %".1", double %".2")
