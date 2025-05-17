; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"selectionSort"(i32 %".1", i32 %".2", i32 %".3")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  %"c" = alloca i32
  store i32 %".3", i32* %"c"
  %"a.1" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %".8" = icmp sgt i32 %"a.1", %"b.1"
  br i1 %".8", label %"then", label %"else"
then:
  %"tmp" = alloca i32
  %"a.2" = load i32, i32* %"a"
  store i32 %"a.2", i32* %"tmp"
  %"b.2" = load i32, i32* %"b"
  store i32 %"b.2", i32* %"a"
  %"tmp.1" = load i32, i32* %"tmp"
  store i32 %"tmp.1", i32* %"b"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"a.3" = load i32, i32* %"a"
  %"c.1" = load i32, i32* %"c"
  %".15" = icmp sgt i32 %"a.3", %"c.1"
  br i1 %".15", label %"then.1", label %"else.1"
then.1:
  %"tmp.2" = alloca i32
  %"a.4" = load i32, i32* %"a"
  store i32 %"a.4", i32* %"tmp.2"
  %"c.2" = load i32, i32* %"c"
  store i32 %"c.2", i32* %"a"
  %"tmp.3" = load i32, i32* %"tmp.2"
  store i32 %"tmp.3", i32* %"c"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"b.3" = load i32, i32* %"b"
  %"c.3" = load i32, i32* %"c"
  %".22" = icmp sgt i32 %"b.3", %"c.3"
  br i1 %".22", label %"then.2", label %"else.2"
then.2:
  %"tmp.4" = alloca i32
  %"b.4" = load i32, i32* %"b"
  store i32 %"b.4", i32* %"tmp.4"
  %"c.4" = load i32, i32* %"c"
  store i32 %"c.4", i32* %"b"
  %"tmp.5" = load i32, i32* %"tmp.4"
  store i32 %"tmp.5", i32* %"c"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"a.5" = load i32, i32* %"a"
  %".29" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %"a.5")
  %"b.5" = load i32, i32* %"b"
  %".31" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"b.5")
  %"c.5" = load i32, i32* %"c"
  %".33" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %"c.5")
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
  %".5" = bitcast [16 x i8]* @"str.-5406797491829922513" to i8*
  %".6" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i8* %".5")
  %"a.1" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %"c.1" = load i32, i32* %"c"
  %".8" = call i32 @"selectionSort"(i32 %"a.1", i32 %"b.1", i32 %"c.1")
  ret i32 0
}

@"str.-5406797491829922513" = internal constant [16 x i8] c"Selection Sort:\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"