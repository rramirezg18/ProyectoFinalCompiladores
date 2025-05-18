; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"fibonacci"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  %"n.1" = load i32, i32* %"n"
  %".4" = icmp eq i32 %"n.1", 0
  br i1 %".4", label %"then", label %"else"
then:
  ret i32 0
else:
  br label %"ifcont"
ifcont:
  %"n.2" = load i32, i32* %"n"
  %".8" = icmp eq i32 %"n.2", 1
  br i1 %".8", label %"then.1", label %"else.1"
then.1:
  ret i32 1
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"n.3" = load i32, i32* %"n"
  %".12" = sub i32 %"n.3", 1
  %".13" = call i32 @"fibonacci"(i32 %".12")
  %"n.4" = load i32, i32* %"n"
  %".14" = sub i32 %"n.4", 2
  %".15" = call i32 @"fibonacci"(i32 %".14")
  %".16" = add i32 %".13", %".15"
  ret i32 %".16"
}

define i32 @"main"()
{
entry:
  %"resultado" = alloca i32
  %".2" = call i32 @"fibonacci"(i32 30)
  store i32 %".2", i32* %"resultado"
  %"resultado.1" = load i32, i32* %"resultado"
  %".4" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"resultado.1")
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"