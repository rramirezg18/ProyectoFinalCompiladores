; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"n" = alloca i32
  store i32 100, i32* %"n"
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %"b" = alloca i32
  store i32 1, i32* %"b"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".7" = icmp slt i32 %"i.1", %"n.1"
  br i1 %".7", label %"for.body", label %"for.exit"
for.body:
  %"a.1" = load i32, i32* %"a"
  %".9" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"a.1")
  %"next" = alloca i32
  %"a.2" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %".11" = add i32 %"a.2", %"b.1"
  store i32 %".11", i32* %"next"
  %"b.2" = load i32, i32* %"b"
  store i32 %"b.2", i32* %"a"
  %"next.1" = load i32, i32* %"next"
  store i32 %"next.1", i32* %"b"
  br label %"for.inc"
for.inc:
  %"i.2" = load i32, i32* %"i"
  %"i.3" = load i32, i32* %"i"
  %".16" = add i32 %"i.3", 1
  store i32 %".16", i32* %"i"
  br label %"for.cond"
for.exit:
  %".19" = bitcast [46 x i8]* @"str.7484904253047083470" to i8*
  %".20" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", i8* %".19")
  %"a.3" = load i32, i32* %"a"
  %".22" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"a.3")
  ret i32 0
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"
@"str.7484904253047083470" = internal constant [46 x i8] c"El resultado de la secuencia de fibonacci es:\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"