; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  %".2" = add i32 5, 5
  store i32 %".2", i32* %"x"
  %".4" = bitcast [18 x i8]* @"str.-4271702283649005462" to i8*
  %".5" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i8* %".4")
  %"x.1" = load i32, i32* %"x"
  %".7" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"x.1")
  ret i32 0
}

@"str.-4271702283649005462" = internal constant [18 x i8] c"se esta mostrando\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"