; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"n" = alloca i32
  store i32 3, i32* %"n"
  %"i" = alloca i32
  store i32 1, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".5" = icmp sle i32 %"i.1", %"n.1"
  br i1 %".5", label %"for.body", label %"for.exit"
for.body:
  %"j" = alloca i32
  store i32 1, i32* %"j"
  br label %"for.cond.1"
for.inc:
  %"i.5" = load i32, i32* %"i"
  %"i.6" = load i32, i32* %"i"
  %".43" = add i32 %"i.6", 1
  store i32 %".43", i32* %"i"
  br label %"for.cond"
for.exit:
  ret i32 0
for.cond.1:
  %"j.1" = load i32, i32* %"j"
  %"n.2" = load i32, i32* %"n"
  %".9" = icmp sle i32 %"j.1", %"n.2"
  br i1 %".9", label %"for.body.1", label %"for.exit.1"
for.body.1:
  %"i.2" = load i32, i32* %"i"
  %"j.2" = load i32, i32* %"j"
  %".11" = icmp ne i32 %"i.2", %"j.2"
  br i1 %".11", label %"then", label %"else"
for.inc.1:
  %"j.5" = load i32, i32* %"j"
  %"j.6" = load i32, i32* %"j"
  %".39" = add i32 %"j.6", 1
  store i32 %".39", i32* %"j"
  br label %"for.cond.1"
for.exit.1:
  br label %"for.inc"
then:
  %"k" = alloca i32
  store i32 1, i32* %"k"
  br label %"for.cond.2"
else:
  br label %"ifcont"
ifcont:
  br label %"for.inc.1"
for.cond.2:
  %"k.1" = load i32, i32* %"k"
  %"n.3" = load i32, i32* %"n"
  %".15" = icmp sle i32 %"k.1", %"n.3"
  br i1 %".15", label %"for.body.2", label %"for.exit.2"
for.body.2:
  %"k.2" = load i32, i32* %"k"
  %"i.3" = load i32, i32* %"i"
  %".17" = icmp ne i32 %"k.2", %"i.3"
  br i1 %".17", label %"then.1", label %"else.1"
for.inc.2:
  %"k.5" = load i32, i32* %"k"
  %"k.6" = load i32, i32* %"k"
  %".33" = add i32 %"k.6", 1
  store i32 %".33", i32* %"k"
  br label %"for.cond.2"
for.exit.2:
  br label %"ifcont"
then.1:
  %"k.3" = load i32, i32* %"k"
  %"j.3" = load i32, i32* %"j"
  %".19" = icmp ne i32 %"k.3", %"j.3"
  br i1 %".19", label %"then.2", label %"else.2"
else.1:
  br label %"ifcont.1"
ifcont.1:
  br label %"for.inc.2"
then.2:
  %"perm" = alloca i32
  %"i.4" = load i32, i32* %"i"
  %".21" = mul i32 %"i.4", 100
  %"j.4" = load i32, i32* %"j"
  %".22" = mul i32 %"j.4", 10
  %".23" = add i32 %".21", %".22"
  %"k.4" = load i32, i32* %"k"
  %".24" = add i32 %".23", %"k.4"
  store i32 %".24", i32* %"perm"
  %"perm.1" = load i32, i32* %"perm"
  %".26" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"perm.1")
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  br label %"ifcont.1"
}

@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"