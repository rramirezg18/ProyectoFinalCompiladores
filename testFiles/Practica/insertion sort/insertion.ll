; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"insertionSort"(i32 %".1", i32 %".2", i32 %".3")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  %"c" = alloca i32
  store i32 %".3", i32* %"c"
  %"b.1" = load i32, i32* %"b"
  %"a.1" = load i32, i32* %"a"
  %".8" = icmp slt i32 %"b.1", %"a.1"
  br i1 %".8", label %"then", label %"else"
then:
  %"tmp" = alloca i32
  %"b.2" = load i32, i32* %"b"
  store i32 %"b.2", i32* %"tmp"
  %"a.2" = load i32, i32* %"a"
  store i32 %"a.2", i32* %"b"
  %"tmp.1" = load i32, i32* %"tmp"
  store i32 %"tmp.1", i32* %"a"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"c.1" = load i32, i32* %"c"
  %"b.3" = load i32, i32* %"b"
  %".15" = icmp slt i32 %"c.1", %"b.3"
  br i1 %".15", label %"then.1", label %"else.1"
then.1:
  %"tmp.2" = alloca i32
  %"c.2" = load i32, i32* %"c"
  store i32 %"c.2", i32* %"tmp.2"
  %"b.4" = load i32, i32* %"b"
  store i32 %"b.4", i32* %"c"
  %"tmp.3" = load i32, i32* %"tmp.2"
  store i32 %"tmp.3", i32* %"b"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"b.5" = load i32, i32* %"b"
  %"a.3" = load i32, i32* %"a"
  %".22" = icmp slt i32 %"b.5", %"a.3"
  br i1 %".22", label %"then.2", label %"else.2"
then.2:
  %"tmp.4" = alloca i32
  %"b.6" = load i32, i32* %"b"
  store i32 %"b.6", i32* %"tmp.4"
  %"a.4" = load i32, i32* %"a"
  store i32 %"a.4", i32* %"b"
  %"tmp.5" = load i32, i32* %"tmp.4"
  store i32 %"tmp.5", i32* %"a"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"a.5" = load i32, i32* %"a"
  %".29" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %"a.5")
  %"b.7" = load i32, i32* %"b"
  %".31" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"b.7")
  %"c.3" = load i32, i32* %"c"
  %".33" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %"c.3")
  ret i32 0
}

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 3, i32* %"a"
  %"b" = alloca i32
  store i32 1, i32* %"b"
  %"c" = alloca i32
  store i32 2, i32* %"c"
  %".5" = bitcast [16 x i8]* @"str.6538502647128232118" to i8*
  %".6" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i8* %".5")
  %"a.1" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %"c.1" = load i32, i32* %"c"
  %".8" = call i32 @"insertionSort"(i32 %"a.1", i32 %"b.1", i32 %"c.1")
  ret i32 0
}

@"str.6538502647128232118" = internal constant [16 x i8] c"Insertion Sort:\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"