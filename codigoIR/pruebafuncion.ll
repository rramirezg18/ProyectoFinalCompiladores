; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"strcpy"(i8* %".1", i8* %".2")

declare i8* @"strcat"(i8* %".1", i8* %".2")

declare i32 @"sprintf"(i8* %".1", i8* %".2", ...)

define i8* @"nombre"()
{
entry:
  %".2" = bitcast [5 x i8]* @"str.1666545231031851230" to i8*
  %".3" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i8* %".2")
  %".5" = bitcast [15 x i8]* @"str.-4926712726426503423" to i8*
  %".6" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i8* %".5")
  %".8" = bitcast [4 x i8]* @"str.607188762523666016" to i8*
  %".9" = bitcast [10 x i8]* @"str.-2939351836653923268" to i8*
  %"concat_buf" = alloca [256 x i8]
  %".10" = bitcast [256 x i8]* %"concat_buf" to i8*
  %".11" = call i8* @"strcpy"(i8* %".10", i8* %".8")
  %".12" = call i8* @"strcat"(i8* %".10", i8* %".9")
  %".13" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i8* %".10")
  ret i8* null
}

define i32 @"main"()
{
entry:
  %".2" = call i8* @"nombre"()
  %"miEdad" = alloca i32
  store i32 18, i32* %"miEdad"
  %".4" = bitcast [13 x i8]* @"str.1431939306580141950" to i8*
  %"miEdad.1" = load i32, i32* %"miEdad"
  %"strconv_buf" = alloca [32 x i8]
  %".5" = bitcast [32 x i8]* %"strconv_buf" to i8*
  %".6" = bitcast [3 x i8]* @"fmt_3897802095485994994" to i8*
  %".7" = call i32 (i8*, i8*, ...) @"sprintf"(i8* %".5", i8* %".6", i32 %"miEdad.1")
  %"concat_buf" = alloca [256 x i8]
  %".8" = bitcast [256 x i8]* %"concat_buf" to i8*
  %".9" = call i8* @"strcpy"(i8* %".8", i8* %".4")
  %".10" = call i8* @"strcat"(i8* %".8", i8* %".5")
  %".11" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i8* %".8")
  ret i32 0
}

@"str.1431939306580141950" = internal constant [13 x i8] c"mi edad es: \00"
@"fmt_3897802095485994994" = internal constant [3 x i8] c"%d\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"str.1666545231031851230" = internal constant [5 x i8] c"hola\00"
@"str.-4926712726426503423" = internal constant [15 x i8] c"hola soy messi\00"
@"str.607188762523666016" = internal constant [4 x i8] c"Soy\00"
@"str.-2939351836653923268" = internal constant [10 x i8] c"Cristiano\00"