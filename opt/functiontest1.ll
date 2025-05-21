; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"strcpy"(i8* %".1", i8* %".2")

declare i8* @"strcat"(i8* %".1", i8* %".2")

declare i32 @"sprintf"(i8* %".1", i8* %".2", ...)

define i32 @"main"()
{
entry:
  %"nombre" = alloca i8*
  %".2" = bitcast [5 x i8]* @"str.-3280188425427068463" to i8*
  store i8* %".2", i8** %"nombre"
  %"nombre.1" = load i8*, i8** %"nombre"
  %".4" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i8* %"nombre.1")
  %".6" = bitcast [8 x i8]* @"str.2419309492153709065" to i8*
  %"nombre.2" = load i8*, i8** %"nombre"
  %"concat_buf" = alloca [256 x i8]
  %".7" = bitcast [256 x i8]* %"concat_buf" to i8*
  %".8" = call i8* @"strcpy"(i8* %".7", i8* %".6")
  %".9" = call i8* @"strcat"(i8* %".7", i8* %"nombre.2")
  %".10" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", i8* %".7")
  %".12" = bitcast [6 x i8]* @"str.-5574945102278417222" to i8*
  %"strconv_buf" = alloca [32 x i8]
  %".13" = bitcast [32 x i8]* %"strconv_buf" to i8*
  %".14" = bitcast [3 x i8]* @"fmt_1182425524083821122" to i8*
  %".15" = call i32 (i8*, i8*, ...) @"sprintf"(i8* %".13", i8* %".14", i32 21)
  %"concat_buf.1" = alloca [256 x i8]
  %".16" = bitcast [256 x i8]* %"concat_buf.1" to i8*
  %".17" = call i8* @"strcpy"(i8* %".16", i8* %".12")
  %".18" = call i8* @"strcat"(i8* %".16", i8* %".13")
  %".19" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i8* %".16")
  ret i32 0
}

@"str.-3280188425427068463" = internal constant [5 x i8] c"Luis\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"str.2419309492153709065" = internal constant [8 x i8] c"nombre:\00"
@"str.-5574945102278417222" = internal constant [6 x i8] c"EDad \00"
@"fmt_1182425524083821122" = internal constant [3 x i8] c"%d\00"