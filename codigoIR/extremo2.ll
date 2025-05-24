; ModuleID = "main"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"strcpy"(i8* %".1", i8* %".2")

declare i8* @"strcat"(i8* %".1", i8* %".2")

declare i32 @"sprintf"(i8* %".1", i8* %".2", ...)

define i32 @"potencia"(i32 %".1", i32 %".2")
{
entry:
  %"base" = alloca i32
  store i32 %".1", i32* %"base"
  %"exponente" = alloca i32
  store i32 %".2", i32* %"exponente"
  %"base.1" = load i32, i32* %"base"
  %"exponente.1" = load i32, i32* %"exponente"
  %".6" = sitofp i32 %"base.1" to double
  %".7" = sitofp i32 %"exponente.1" to double
  %".8" = call double @"llvm.pow.f64"(double %".6", double %".7")
  %".9" = fptosi double %".8" to i32
  ret i32 %".9"
}

define i32 @"sumar"(i32 %".1", i32 %".2")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  %"a.1" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %".6" = add i32 %"a.1", %"b.1"
  ret i32 %".6"
}

define i32 @"sumaHasta"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  %"suma" = alloca i32
  store i32 0, i32* %"suma"
  %"contador" = alloca i32
  store i32 1, i32* %"contador"
  br label %"while.cond"
while.cond:
  %"contador.1" = load i32, i32* %"contador"
  %"n.1" = load i32, i32* %"n"
  %".7" = icmp slt i32 %"contador.1", %"n.1"
  br i1 %".7", label %"while.body", label %"while.end"
while.body:
  %"suma.1" = load i32, i32* %"suma"
  %"contador.2" = load i32, i32* %"contador"
  %".9" = add i32 %"suma.1", %"contador.2"
  store i32 %".9", i32* %"suma"
  %"contador.3" = load i32, i32* %"contador"
  %".11" = add i32 %"contador.3", 1
  store i32 %".11", i32* %"contador"
  br label %"while.cond"
while.end:
  %"suma.2" = load i32, i32* %"suma"
  ret i32 %"suma.2"
}

define i32 @"contarHasta"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  store i32 1, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".7" = icmp sle i32 %"i.1", %"n.1"
  br i1 %".7", label %"for.body", label %"for.exit"
for.body:
  %"i.2" = load i32, i32* %"i"
  %".9" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"i.2")
  br label %"for.inc"
for.inc:
  %"i.3" = load i32, i32* %"i"
  %"i.4" = load i32, i32* %"i"
  %".12" = add i32 %"i.4", 1
  store i32 %".12", i32* %"i"
  br label %"for.cond"
for.exit:
  ret i32 0
}

define i32 @"funcionA"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  %"n.1" = load i32, i32* %"n"
  %".4" = mul i32 %"n.1", 2
  ret i32 %".4"
}

define i32 @"funcionB"(i32 %".1")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  %"temp" = alloca i32
  %"x.1" = load i32, i32* %"x"
  %".4" = call i32 @"funcionA"(i32 %"x.1")
  store i32 %".4", i32* %"temp"
  %"temp.1" = load i32, i32* %"temp"
  %".6" = mul i32 %"temp.1", 3
  ret i32 %".6"
}

define i32 @"doble"(i32 %".1")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"a.1" = load i32, i32* %"a"
  %".4" = mul i32 %"a.1", 2
  ret i32 %".4"
}

define i32 @"suma"()
{
entry:
  %"num1" = alloca i32
  store i32 10, i32* %"num1"
  %"num2" = alloca i32
  store i32 20, i32* %"num2"
  %"num3" = alloca i32
  store i32 30, i32* %"num3"
  %"resultado" = alloca i32
  %"num1.1" = load i32, i32* %"num1"
  %"num2.1" = load i32, i32* %"num2"
  %".5" = add i32 %"num1.1", %"num2.1"
  %"num3.1" = load i32, i32* %"num3"
  %".6" = add i32 %".5", %"num3.1"
  store i32 %".6", i32* %"resultado"
  %"resultado.1" = load i32, i32* %"resultado"
  %".8" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"resultado.1")
  ret i32 0
}

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
  %".2" = bitcast [21 x i8]* @"str.-2299630381233036967" to i8*
  %".3" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i8* %".2")
  %".5" = bitcast [26 x i8]* @"str.1780731933373777837" to i8*
  %".6" = sitofp i32 19 to double
  %".7" = sitofp i32 35 to double
  %".8" = call double @"llvm.pow.f64"(double %".6", double %".7")
  %"strconv_buf" = alloca [32 x i8]
  %".9" = bitcast [32 x i8]* %"strconv_buf" to i8*
  %".10" = bitcast [3 x i8]* @"fmt_-8802024497518871077" to i8*
  %".11" = call i32 (i8*, i8*, ...) @"sprintf"(i8* %".9", i8* %".10", double %".8")
  %"concat_buf" = alloca [256 x i8]
  %".12" = bitcast [256 x i8]* %"concat_buf" to i8*
  %".13" = call i8* @"strcpy"(i8* %".12", i8* %".5")
  %".14" = call i8* @"strcat"(i8* %".12", i8* %".9")
  %".15" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", i8* %".12")
  %".17" = bitcast [9 x i8]* @"str.7820827835370743510" to i8*
  %".18" = bitcast [12 x i8]* @"str.-219633879990766185" to i8*
  %"concat_buf.1" = alloca [256 x i8]
  %".19" = bitcast [256 x i8]* %"concat_buf.1" to i8*
  %".20" = call i8* @"strcpy"(i8* %".19", i8* %".17")
  %".21" = call i8* @"strcat"(i8* %".19", i8* %".18")
  %".22" = bitcast [8 x i8]* @"str.29663516973537804" to i8*
  %"concat_buf.2" = alloca [256 x i8]
  %".23" = bitcast [256 x i8]* %"concat_buf.2" to i8*
  %".24" = call i8* @"strcpy"(i8* %".23", i8* %".19")
  %".25" = call i8* @"strcat"(i8* %".23", i8* %".22")
  %".26" = bitcast [8 x i8]* @"str.2055162134592748269" to i8*
  %"concat_buf.3" = alloca [256 x i8]
  %".27" = bitcast [256 x i8]* %"concat_buf.3" to i8*
  %".28" = call i8* @"strcpy"(i8* %".27", i8* %".23")
  %".29" = call i8* @"strcat"(i8* %".27", i8* %".26")
  %".30" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", i8* %".27")
  %".32" = bitcast [20 x i8]* @"str.-3774160135910516209" to i8*
  %".33" = sitofp i32 3 to double
  %".34" = sitofp i32 333 to double
  %".35" = call double @"llvm.pow.f64"(double %".33", double %".34")
  %"strconv_buf.1" = alloca [32 x i8]
  %".36" = bitcast [32 x i8]* %"strconv_buf.1" to i8*
  %".37" = bitcast [3 x i8]* @"fmt_-8802024497518871077" to i8*
  %".38" = call i32 (i8*, i8*, ...) @"sprintf"(i8* %".36", i8* %".37", double %".35")
  %"concat_buf.4" = alloca [256 x i8]
  %".39" = bitcast [256 x i8]* %"concat_buf.4" to i8*
  %".40" = call i8* @"strcpy"(i8* %".39", i8* %".32")
  %".41" = call i8* @"strcat"(i8* %".39", i8* %".36")
  %".42" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".42", i8* %".39")
  %".44" = sitofp i32 55 to double
  %".45" = sitofp i32 5 to double
  %".46" = call double @"llvm.pow.f64"(double %".44", double %".45")
  %".47" = sitofp i32 5 to double
  %".48" = fdiv double %".46", %".47"
  %".49" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".49", double %".48")
  %".51" = sitofp i32 5 to double
  %".52" = sitofp i32 3 to double
  %".53" = call double @"llvm.pow.f64"(double %".51", double %".52")
  %".54" = sitofp i32 99 to double
  %".55" = fmul double %".54", %".53"
  %".56" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".56", double %".55")
  %".58" = sitofp i32 3000 to double
  %".59" = sitofp i32 4 to double
  %".60" = fdiv double %".58", %".59"
  %".61" = sitofp i32 9000 to double
  %".62" = fmul double %".60", %".61"
  %".63" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".63", double %".62")
  %".65" = sub i32 88, 2
  %".66" = mul i32 85, 18
  %".67" = sitofp i32 100 to double
  %".68" = sitofp i32 4 to double
  %".69" = call double @"llvm.pow.f64"(double %".67", double %".68")
  %".70" = sitofp i32 %".66" to double
  %".71" = fdiv double %".70", %".69"
  %".72" = sitofp i32 %".65" to double
  %".73" = fadd double %".72", %".71"
  %".74" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".74", double %".73")
  %".76" = sitofp i32 100 to double
  %".77" = sitofp i32 2 to double
  %".78" = fdiv double %".76", %".77"
  %".79" = sitofp i32 88 to double
  %".80" = fmul double %".78", %".79"
  %".81" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".81", double %".80")
  %".83" = sitofp i32 58 to double
  %".84" = sitofp i32 58 to double
  %".85" = call double @"llvm.pow.f64"(double %".83", double %".84")
  %".86" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".86", double %".85")
  %"zz" = alloca i32
  store i32 33, i32* %"zz"
  %"zz.1" = load i32, i32* %"zz"
  %".89" = sitofp i32 2 to double
  %".90" = sitofp i32 %"zz.1" to double
  %".91" = call double @"llvm.pow.f64"(double %".89", double %".90")
  %".92" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".93" = call i32 (i8*, ...) @"printf"(i8* %".92", double %".91")
  %"jean" = alloca i8*
  %".94" = bitcast [5 x i8]* @"str.-5990469399282911138" to i8*
  store i8* %".94", i8** %"jean"
  %"gg" = alloca double
  %".96" = sitofp i32 28 to double
  %".97" = sitofp i32 3 to double
  %".98" = call double @"llvm.pow.f64"(double %".96", double %".97")
  store double %".98", double* %"gg"
  %".100" = bitcast [23 x i8]* @"str.3178796603870470836" to i8*
  %"gg.1" = load double, double* %"gg"
  %"strconv_buf.2" = alloca [32 x i8]
  %".101" = bitcast [32 x i8]* %"strconv_buf.2" to i8*
  %".102" = bitcast [3 x i8]* @"fmt_-8802024497518871077" to i8*
  %".103" = call i32 (i8*, i8*, ...) @"sprintf"(i8* %".101", i8* %".102", double %"gg.1")
  %"concat_buf.5" = alloca [256 x i8]
  %".104" = bitcast [256 x i8]* %"concat_buf.5" to i8*
  %".105" = call i8* @"strcpy"(i8* %".104", i8* %".100")
  %".106" = call i8* @"strcat"(i8* %".104", i8* %".101")
  %".107" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".108" = call i32 (i8*, ...) @"printf"(i8* %".107", i8* %".104")
  %".109" = bitcast [9 x i8]* @"str.-3492187847060208424" to i8*
  %"strconv_buf.3" = alloca [32 x i8]
  %".110" = bitcast [32 x i8]* %"strconv_buf.3" to i8*
  %".111" = bitcast [3 x i8]* @"fmt_-2690096950753263951" to i8*
  %".112" = call i32 (i8*, i8*, ...) @"sprintf"(i8* %".110", i8* %".111", i32 31)
  %"concat_buf.6" = alloca [256 x i8]
  %".113" = bitcast [256 x i8]* %"concat_buf.6" to i8*
  %".114" = call i8* @"strcpy"(i8* %".113", i8* %".109")
  %".115" = call i8* @"strcat"(i8* %".113", i8* %".110")
  %".116" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".117" = call i32 (i8*, ...) @"printf"(i8* %".116", i8* %".113")
  %".118" = bitcast [18 x i8]* @"str.-8496734725837645629" to i8*
  %".119" = sitofp i32 5 to double
  %".120" = sitofp i32 5 to double
  %".121" = call double @"llvm.pow.f64"(double %".119", double %".120")
  %"strconv_buf.4" = alloca [32 x i8]
  %".122" = bitcast [32 x i8]* %"strconv_buf.4" to i8*
  %".123" = bitcast [3 x i8]* @"fmt_-8802024497518871077" to i8*
  %".124" = call i32 (i8*, i8*, ...) @"sprintf"(i8* %".122", i8* %".123", double %".121")
  %"concat_buf.7" = alloca [256 x i8]
  %".125" = bitcast [256 x i8]* %"concat_buf.7" to i8*
  %".126" = call i8* @"strcpy"(i8* %".125", i8* %".118")
  %".127" = call i8* @"strcat"(i8* %".125", i8* %".122")
  %".128" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".129" = call i32 (i8*, ...) @"printf"(i8* %".128", i8* %".125")
  %".130" = sitofp i32 5 to double
  %".131" = sitofp i32 5 to double
  %".132" = call double @"llvm.pow.f64"(double %".130", double %".131")
  %".133" = sitofp i32 200 to double
  %".134" = fadd double %".132", %".133"
  %".135" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".136" = call i32 (i8*, ...) @"printf"(i8* %".135", double %".134")
  %".137" = sitofp i32 8 to double
  %".138" = sitofp i32 88 to double
  %".139" = call double @"llvm.pow.f64"(double %".137", double %".138")
  %".140" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".141" = call i32 (i8*, ...) @"printf"(i8* %".140", double %".139")
  %".142" = sitofp i32 200 to double
  %".143" = sitofp i32 50 to double
  %".144" = call double @"llvm.pow.f64"(double %".142", double %".143")
  %".145" = sitofp i32 50 to double
  %".146" = fdiv double %".144", %".145"
  %".147" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".148" = call i32 (i8*, ...) @"printf"(i8* %".147", double %".146")
  %".149" = sitofp i32 88 to double
  %".150" = sitofp i32 8 to double
  %".151" = call double @"llvm.pow.f64"(double %".149", double %".150")
  %".152" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".153" = call i32 (i8*, ...) @"printf"(i8* %".152", double %".151")
  %".154" = sitofp i32 70 to double
  %".155" = sitofp i32 5 to double
  %".156" = call double @"llvm.pow.f64"(double %".154", double %".155")
  %".157" = sitofp i32 8 to double
  %".158" = fdiv double %".156", %".157"
  %".159" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".160" = call i32 (i8*, ...) @"printf"(i8* %".159", double %".158")
  %".161" = bitcast [24 x i8]* @"str.2217310185640068682" to i8*
  %".162" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".163" = call i32 (i8*, ...) @"printf"(i8* %".162", i8* %".161")
  %".164" = sitofp i32 18 to double
  %".165" = sitofp i32 4 to double
  %".166" = call double @"llvm.pow.f64"(double %".164", double %".165")
  %".167" = sitofp i32 2 to double
  %".168" = fmul double %".167", %".166"
  %".169" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".170" = call i32 (i8*, ...) @"printf"(i8* %".169", double %".168")
  %".171" = bitcast [21 x i8]* @"str.-6927658657090574447" to i8*
  %".172" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".173" = call i32 (i8*, ...) @"printf"(i8* %".172", i8* %".171")
  %"num4" = alloca i32
  store i32 50, i32* %"num4"
  %"num5" = alloca i32
  store i32 50, i32* %"num5"
  %"num4.1" = load i32, i32* %"num4"
  %"num5.1" = load i32, i32* %"num5"
  %".176" = sitofp i32 %"num4.1" to double
  %".177" = sitofp i32 %"num5.1" to double
  %".178" = call double @"llvm.pow.f64"(double %".176", double %".177")
  %".179" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".180" = call i32 (i8*, ...) @"printf"(i8* %".179", double %".178")
  %".181" = sitofp i32 50 to double
  %".182" = sitofp i32 50 to double
  %".183" = call double @"llvm.pow.f64"(double %".181", double %".182")
  %".184" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".185" = call i32 (i8*, ...) @"printf"(i8* %".184", double %".183")
  %".186" = sitofp i32 88 to double
  %".187" = sitofp i32 75 to double
  %".188" = call double @"llvm.pow.f64"(double %".186", double %".187")
  %".189" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".190" = call i32 (i8*, ...) @"printf"(i8* %".189", double %".188")
  %"d" = alloca i32
  store i32 90, i32* %"d"
  %"num4.2" = load i32, i32* %"num4"
  %"num4.3" = load i32, i32* %"num4"
  %".192" = sitofp i32 %"num4.2" to double
  %".193" = sitofp i32 %"num4.3" to double
  %".194" = call double @"llvm.pow.f64"(double %".192", double %".193")
  %".195" = sitofp i32 2 to double
  %".196" = fdiv double %".194", %".195"
  %".197" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".198" = call i32 (i8*, ...) @"printf"(i8* %".197", double %".196")
  %"num4.4" = load i32, i32* %"num4"
  %".199" = sitofp i32 %"num4.4" to double
  %".200" = sitofp i32 50 to double
  %".201" = call double @"llvm.pow.f64"(double %".199", double %".200")
  %".202" = sitofp i32 2 to double
  %".203" = fdiv double %".201", %".202"
  %".204" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".205" = call i32 (i8*, ...) @"printf"(i8* %".204", double %".203")
  %"num5.2" = load i32, i32* %"num5"
  %".206" = sitofp i32 50 to double
  %".207" = sitofp i32 %"num5.2" to double
  %".208" = call double @"llvm.pow.f64"(double %".206", double %".207")
  %".209" = sitofp i32 20 to double
  %".210" = fdiv double %".208", %".209"
  %".211" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".212" = call i32 (i8*, ...) @"printf"(i8* %".211", double %".210")
  %"w" = alloca i32
  store i32 0, i32* %"w"
  br label %"for.cond"
for.cond:
  %"w.1" = load i32, i32* %"w"
  %".215" = icmp sle i32 %"w.1", 100
  br i1 %".215", label %"for.body", label %"for.exit"
for.body:
  %"num4.5" = load i32, i32* %"num4"
  %"w.2" = load i32, i32* %"w"
  %".217" = sitofp i32 %"num4.5" to double
  %".218" = sitofp i32 %"w.2" to double
  %".219" = call double @"llvm.pow.f64"(double %".217", double %".218")
  %"num5.3" = load i32, i32* %"num5"
  %".220" = sitofp i32 %"num5.3" to double
  %".221" = fdiv double %".219", %".220"
  %".222" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".223" = call i32 (i8*, ...) @"printf"(i8* %".222", double %".221")
  br label %"for.inc"
for.inc:
  %"w.3" = load i32, i32* %"w"
  %"w.4" = load i32, i32* %"w"
  %".225" = add i32 %"w.4", 1
  store i32 %".225", i32* %"w"
  br label %"for.cond"
for.exit:
  %".228" = mul i32 18, 2
  %".229" = mul i32 5, 10
  %".230" = sitofp i32 %".229" to double
  %".231" = sitofp i32 8 to double
  %".232" = fdiv double %".230", %".231"
  %".233" = sitofp i32 %".228" to double
  %".234" = fadd double %".233", %".232"
  %".235" = mul i32 5, 2
  %".236" = sitofp i32 %".235" to double
  %".237" = fadd double %".234", %".236"
  %".238" = sitofp i32 800000 to double
  %".239" = fadd double %".237", %".238"
  %".240" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".241" = call i32 (i8*, ...) @"printf"(i8* %".240", double %".239")
  %".242" = mul i32 88, 88
  %".243" = mul i32 %".242", 88
  %".244" = mul i32 %".243", 88
  %".245" = mul i32 %".244", 88
  %".246" = mul i32 %".245", 5
  %".247" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".248" = call i32 (i8*, ...) @"printf"(i8* %".247", i32 %".246")
  %".249" = sitofp i32 42 to double
  %".250" = sitofp i32 5 to double
  %".251" = call double @"llvm.pow.f64"(double %".249", double %".250")
  %".252" = sitofp i32 2 to double
  %".253" = fdiv double %".251", %".252"
  %".254" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".255" = call i32 (i8*, ...) @"printf"(i8* %".254", double %".253")
  %".256" = sitofp i32 2 to double
  %".257" = sitofp i32 9 to double
  %".258" = call double @"llvm.pow.f64"(double %".256", double %".257")
  %".259" = sitofp i32 78 to double
  %".260" = fdiv double %".259", %".258"
  %".261" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".262" = call i32 (i8*, ...) @"printf"(i8* %".261", double %".260")
  %".263" = sitofp i32 99 to double
  %".264" = sitofp i32 2 to double
  %".265" = call double @"llvm.pow.f64"(double %".263", double %".264")
  %".266" = sitofp i32 28 to double
  %".267" = fdiv double %".266", %".265"
  %".268" = sitofp i32 6 to double
  %".269" = fadd double %".267", %".268"
  %".270" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".271" = call i32 (i8*, ...) @"printf"(i8* %".270", double %".269")
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"for.cond.1"
for.cond.1:
  %"i.1" = load i32, i32* %"i"
  %".274" = icmp sle i32 %"i.1", 100
  br i1 %".274", label %"for.body.1", label %"for.exit.1"
for.body.1:
  %"i.2" = load i32, i32* %"i"
  %".276" = sitofp i32 2 to double
  %".277" = sitofp i32 %"i.2" to double
  %".278" = call double @"llvm.pow.f64"(double %".276", double %".277")
  %".279" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".280" = call i32 (i8*, ...) @"printf"(i8* %".279", double %".278")
  %".281" = bitcast [6 x i8]* @"str.-4610371873025826167" to i8*
  %"i.3" = load i32, i32* %"i"
  %"strconv_buf.5" = alloca [32 x i8]
  %".282" = bitcast [32 x i8]* %"strconv_buf.5" to i8*
  %".283" = bitcast [3 x i8]* @"fmt_-2690096950753263951" to i8*
  %".284" = call i32 (i8*, i8*, ...) @"sprintf"(i8* %".282", i8* %".283", i32 %"i.3")
  %"concat_buf.8" = alloca [256 x i8]
  %".285" = bitcast [256 x i8]* %"concat_buf.8" to i8*
  %".286" = call i8* @"strcpy"(i8* %".285", i8* %".281")
  %".287" = call i8* @"strcat"(i8* %".285", i8* %".282")
  %".288" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".289" = call i32 (i8*, ...) @"printf"(i8* %".288", i8* %".285")
  br label %"for.inc.1"
for.inc.1:
  %"i.4" = load i32, i32* %"i"
  %"i.5" = load i32, i32* %"i"
  %".291" = add i32 %"i.5", 1
  store i32 %".291", i32* %"i"
  br label %"for.cond.1"
for.exit.1:
  %".294" = sitofp i32 5 to double
  %".295" = sitofp i32 5 to double
  %".296" = call double @"llvm.pow.f64"(double %".294", double %".295")
  %".297" = sitofp i32 2 to double
  %".298" = fadd double %".296", %".297"
  %".299" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".300" = call i32 (i8*, ...) @"printf"(i8* %".299", double %".298")
  %".301" = sitofp i32 78 to double
  %".302" = sitofp i32 25 to double
  %".303" = call double @"llvm.pow.f64"(double %".301", double %".302")
  %".304" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".305" = call i32 (i8*, ...) @"printf"(i8* %".304", double %".303")
  %".306" = sitofp i32 125 to double
  %".307" = sitofp i32 5 to double
  %".308" = call double @"llvm.pow.f64"(double %".306", double %".307")
  %".309" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".310" = call i32 (i8*, ...) @"printf"(i8* %".309", double %".308")
  %".311" = sitofp i32 83 to double
  %".312" = sitofp i32 555 to double
  %".313" = call double @"llvm.pow.f64"(double %".311", double %".312")
  %".314" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".315" = call i32 (i8*, ...) @"printf"(i8* %".314", double %".313")
  %".316" = sitofp i32 78 to double
  %".317" = sitofp i32 2 to double
  %".318" = call double @"llvm.pow.f64"(double %".316", double %".317")
  %".319" = sitofp i32 5 to double
  %".320" = fadd double %".318", %".319"
  %".321" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".322" = call i32 (i8*, ...) @"printf"(i8* %".321", double %".320")
  %"div" = alloca double
  %".323" = sitofp i32 100 to double
  %".324" = sitofp i32 5 to double
  %".325" = fdiv double %".323", %".324"
  store double %".325", double* %"div"
  %"div.1" = load double, double* %"div"
  %".327" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".328" = call i32 (i8*, ...) @"printf"(i8* %".327", double %"div.1")
  %".329" = mul i32 3, 5
  %".330" = add i32 %".329", 2
  %".331" = sub i32 %".330", 88
  %".332" = sitofp i32 250 to double
  %".333" = sitofp i32 2 to double
  %".334" = fdiv double %".332", %".333"
  %".335" = sitofp i32 %".331" to double
  %".336" = fadd double %".335", %".334"
  %".337" = mul i32 789, 2
  %".338" = sitofp i32 %".337" to double
  %".339" = fadd double %".336", %".338"
  %".340" = mul i32 56, 2
  %".341" = sitofp i32 %".340" to double
  %".342" = fadd double %".339", %".341"
  %".343" = sitofp i32 300 to double
  %".344" = fadd double %".342", %".343"
  %".345" = sitofp i32 7896 to double
  %".346" = fsub double %".344", %".345"
  %".347" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347", double %".346")
  %".349" = sitofp i32 23 to double
  %".350" = sitofp i32 23 to double
  %".351" = call double @"llvm.pow.f64"(double %".349", double %".350")
  %".352" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352", double %".351")
  %"var" = alloca i32
  store i32 5, i32* %"var"
  %"saludo" = alloca i8*
  %".355" = bitcast [12 x i8]* @"str.7099313127551586642" to i8*
  store i8* %".355", i8** %"saludo"
  %"saludo.1" = load i8*, i8** %"saludo"
  %".357" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".358" = call i32 (i8*, ...) @"printf"(i8* %".357", i8* %"saludo.1")
  %"t" = alloca double
  %".359" = sitofp i32 88 to double
  %".360" = sitofp i32 6 to double
  %".361" = call double @"llvm.pow.f64"(double %".359", double %".360")
  %".362" = mul i32 250, 2
  %".363" = sitofp i32 %".362" to double
  %".364" = fadd double %".361", %".363"
  store double %".364", double* %"t"
  %"t.1" = load double, double* %"t"
  %".366" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".367" = call i32 (i8*, ...) @"printf"(i8* %".366", double %"t.1")
  %"t.2" = load double, double* %"t"
  %".368" = sitofp i32 10 to double
  %".369" = fsub double %"t.2", %".368"
  store double %".369", double* %"t"
  %"var.1" = load i32, i32* %"var"
  %".371" = sitofp i32 250 to double
  %".372" = sitofp i32 2 to double
  %".373" = call double @"llvm.pow.f64"(double %".371", double %".372")
  %".374" = sitofp i32 %"var.1" to double
  %".375" = fadd double %".374", %".373"
  %".376" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".377" = call i32 (i8*, ...) @"printf"(i8* %".376", double %".375")
  %"var.2" = load i32, i32* %"var"
  %".378" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".379" = call i32 (i8*, ...) @"printf"(i8* %".378", i32 %"var.2")
  store i32 2, i32* %"var"
  %"var.3" = load i32, i32* %"var"
  %".381" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".382" = call i32 (i8*, ...) @"printf"(i8* %".381", i32 %"var.3")
  %"p" = alloca i32
  store i32 10, i32* %"p"
  br label %"while.cond"
while.cond:
  %"p.1" = load i32, i32* %"p"
  %".385" = icmp sge i32 %"p.1", 0
  br i1 %".385", label %"while.body", label %"while.end"
while.body:
  %".387" = bitcast [5 x i8]* @"str.-7668869861663883741" to i8*
  %".388" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".389" = call i32 (i8*, ...) @"printf"(i8* %".388", i8* %".387")
  %"p.2" = load i32, i32* %"p"
  %".390" = sub i32 %"p.2", 1
  store i32 %".390", i32* %"p"
  br label %"while.cond"
while.end:
  %"var.4" = load i32, i32* %"var"
  %".393" = sitofp i32 2 to double
  %".394" = sitofp i32 %"var.4" to double
  %".395" = call double @"llvm.pow.f64"(double %".393", double %".394")
  %".396" = sitofp i32 200 to double
  %".397" = sitofp i32 2 to double
  %".398" = call double @"llvm.pow.f64"(double %".396", double %".397")
  %".399" = sitofp i32 55 to double
  %".400" = fmul double %".399", %".398"
  %".401" = mul i32 58, 2
  %".402" = sitofp i32 %".401" to double
  %".403" = fadd double %".400", %".402"
  %".404" = fadd double %".395", %".403"
  %".405" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".406" = call i32 (i8*, ...) @"printf"(i8* %".405", double %".404")
  %".407" = sitofp i32 6 to double
  %".408" = sitofp i32 6 to double
  %".409" = call double @"llvm.pow.f64"(double %".407", double %".408")
  %".410" = sitofp i32 2 to double
  %".411" = fadd double %".409", %".410"
  %".412" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".413" = call i32 (i8*, ...) @"printf"(i8* %".412", double %".411")
  %"x" = alloca i32
  store i32 10, i32* %"x"
  %"variable" = alloca i32
  store i32 10, i32* %"variable"
  %"variable.1" = load i32, i32* %"variable"
  %".416" = sitofp i32 100 to double
  %".417" = sitofp i32 %"variable.1" to double
  %".418" = call double @"llvm.pow.f64"(double %".416", double %".417")
  %".419" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".420" = call i32 (i8*, ...) @"printf"(i8* %".419", double %".418")
  %"variable.2" = load i32, i32* %"variable"
  %".421" = sitofp i32 55 to double
  %".422" = sitofp i32 %"variable.2" to double
  %".423" = call double @"llvm.pow.f64"(double %".421", double %".422")
  %".424" = sitofp i32 300 to double
  %".425" = fadd double %".423", %".424"
  %".426" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".427" = call i32 (i8*, ...) @"printf"(i8* %".426", double %".425")
  %"variable.3" = load i32, i32* %"variable"
  %".428" = mul i32 300, 55
  %".429" = add i32 %"variable.3", %".428"
  %".430" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".431" = call i32 (i8*, ...) @"printf"(i8* %".430", i32 %".429")
  %".432" = add i32 3, 5
  %".433" = mul i32 25, %".432"
  %".434" = sub i32 5, %".433"
  %".435" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".436" = call i32 (i8*, ...) @"printf"(i8* %".435", i32 %".434")
  %"k" = alloca i32
  store i32 0, i32* %"k"
  br label %"for.cond.2"
for.cond.2:
  %"k.1" = load i32, i32* %"k"
  %".439" = icmp sle i32 %"k.1", 10
  br i1 %".439", label %"for.body.2", label %"for.exit.2"
for.body.2:
  %".441" = add i32 3, 5
  %".442" = mul i32 25, %".441"
  %".443" = sub i32 5, %".442"
  %".444" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".445" = call i32 (i8*, ...) @"printf"(i8* %".444", i32 %".443")
  br label %"for.inc.2"
for.inc.2:
  %"k.2" = load i32, i32* %"k"
  %"k.3" = load i32, i32* %"k"
  %".447" = add i32 %"k.3", 1
  store i32 %".447", i32* %"k"
  br label %"for.cond.2"
for.exit.2:
  %"z" = alloca double
  %".450" = sitofp i32 5 to double
  %".451" = sitofp i32 100 to double
  %".452" = call double @"llvm.pow.f64"(double %".450", double %".451")
  store double %".452", double* %"z"
  %"z.1" = load double, double* %"z"
  %".454" = sitofp i32 1 to double
  %".455" = fsub double %"z.1", %".454"
  %".456" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".457" = call i32 (i8*, ...) @"printf"(i8* %".456", double %".455")
  %"resultadoF" = alloca i32
  %".458" = call i32 @"fibonacci"(i32 50)
  store i32 %".458", i32* %"resultadoF"
  %"resultadoF.1" = load i32, i32* %"resultadoF"
  %".460" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".461" = call i32 (i8*, ...) @"printf"(i8* %".460", i32 %"resultadoF.1")
  %".462" = mul i32 18, 2
  %".463" = mul i32 5, 10
  %".464" = sitofp i32 %".463" to double
  %".465" = sitofp i32 8 to double
  %".466" = fdiv double %".464", %".465"
  %".467" = sitofp i32 %".462" to double
  %".468" = fadd double %".467", %".466"
  %".469" = mul i32 5, 2
  %".470" = sitofp i32 %".469" to double
  %".471" = fadd double %".468", %".470"
  %".472" = sitofp i32 800000 to double
  %".473" = fadd double %".471", %".472"
  %".474" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".475" = call i32 (i8*, ...) @"printf"(i8* %".474", double %".473")
  %".476" = mul i32 88, 88
  %".477" = mul i32 %".476", 88
  %".478" = mul i32 %".477", 88
  %".479" = mul i32 %".478", 88
  %".480" = mul i32 %".479", 5
  %".481" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".482" = call i32 (i8*, ...) @"printf"(i8* %".481", i32 %".480")
  %".483" = sitofp i32 42 to double
  %".484" = sitofp i32 5 to double
  %".485" = call double @"llvm.pow.f64"(double %".483", double %".484")
  %".486" = sitofp i32 2 to double
  %".487" = fdiv double %".485", %".486"
  %".488" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".489" = call i32 (i8*, ...) @"printf"(i8* %".488", double %".487")
  %".490" = sitofp i32 2 to double
  %".491" = sitofp i32 9 to double
  %".492" = call double @"llvm.pow.f64"(double %".490", double %".491")
  %".493" = sitofp i32 78 to double
  %".494" = fdiv double %".493", %".492"
  %".495" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".496" = call i32 (i8*, ...) @"printf"(i8* %".495", double %".494")
  %".497" = sitofp i32 99 to double
  %".498" = sitofp i32 2 to double
  %".499" = call double @"llvm.pow.f64"(double %".497", double %".498")
  %".500" = sitofp i32 28 to double
  %".501" = fdiv double %".500", %".499"
  %".502" = sitofp i32 6 to double
  %".503" = fadd double %".501", %".502"
  %".504" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".505" = call i32 (i8*, ...) @"printf"(i8* %".504", double %".503")
  %".506" = sitofp i32 5 to double
  %".507" = sitofp i32 5 to double
  %".508" = call double @"llvm.pow.f64"(double %".506", double %".507")
  %".509" = sitofp i32 2 to double
  %".510" = fadd double %".508", %".509"
  %".511" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".512" = call i32 (i8*, ...) @"printf"(i8* %".511", double %".510")
  %".513" = sitofp i32 78 to double
  %".514" = sitofp i32 25 to double
  %".515" = call double @"llvm.pow.f64"(double %".513", double %".514")
  %".516" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".517" = call i32 (i8*, ...) @"printf"(i8* %".516", double %".515")
  %".518" = sitofp i32 125 to double
  %".519" = sitofp i32 5 to double
  %".520" = call double @"llvm.pow.f64"(double %".518", double %".519")
  %".521" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".522" = call i32 (i8*, ...) @"printf"(i8* %".521", double %".520")
  %".523" = sitofp i32 83 to double
  %".524" = sitofp i32 555 to double
  %".525" = call double @"llvm.pow.f64"(double %".523", double %".524")
  %".526" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".527" = call i32 (i8*, ...) @"printf"(i8* %".526", double %".525")
  %".528" = sitofp i32 78 to double
  %".529" = sitofp i32 2 to double
  %".530" = call double @"llvm.pow.f64"(double %".528", double %".529")
  %".531" = sitofp i32 5 to double
  %".532" = fadd double %".530", %".531"
  %".533" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".534" = call i32 (i8*, ...) @"printf"(i8* %".533", double %".532")
  %"yy" = alloca i32
  store i32 2, i32* %"yy"
  %".536" = sitofp i32 55 to double
  %".537" = sitofp i32 5 to double
  %".538" = call double @"llvm.pow.f64"(double %".536", double %".537")
  %".539" = sitofp i32 5 to double
  %".540" = fdiv double %".538", %".539"
  %".541" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".542" = call i32 (i8*, ...) @"printf"(i8* %".541", double %".540")
  %".543" = sitofp i32 5 to double
  %".544" = sitofp i32 3 to double
  %".545" = call double @"llvm.pow.f64"(double %".543", double %".544")
  %".546" = sitofp i32 99 to double
  %".547" = fmul double %".546", %".545"
  %".548" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".549" = call i32 (i8*, ...) @"printf"(i8* %".548", double %".547")
  %".550" = sitofp i32 3000 to double
  %".551" = sitofp i32 4 to double
  %".552" = fdiv double %".550", %".551"
  %".553" = sitofp i32 9000 to double
  %".554" = fmul double %".552", %".553"
  %".555" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".556" = call i32 (i8*, ...) @"printf"(i8* %".555", double %".554")
  %".557" = sub i32 88, 2
  %".558" = mul i32 85, 18
  %".559" = sitofp i32 100 to double
  %".560" = sitofp i32 4 to double
  %".561" = call double @"llvm.pow.f64"(double %".559", double %".560")
  %".562" = sitofp i32 %".558" to double
  %".563" = fdiv double %".562", %".561"
  %".564" = sitofp i32 %".557" to double
  %".565" = fadd double %".564", %".563"
  %".566" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".567" = call i32 (i8*, ...) @"printf"(i8* %".566", double %".565")
  %".568" = sitofp i32 100 to double
  %".569" = sitofp i32 2 to double
  %".570" = fdiv double %".568", %".569"
  %".571" = sitofp i32 88 to double
  %".572" = fmul double %".570", %".571"
  %".573" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".574" = call i32 (i8*, ...) @"printf"(i8* %".573", double %".572")
  %".575" = sitofp i32 58 to double
  %".576" = sitofp i32 58 to double
  %".577" = call double @"llvm.pow.f64"(double %".575", double %".576")
  %".578" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".579" = call i32 (i8*, ...) @"printf"(i8* %".578", double %".577")
  %"zz.2" = load i32, i32* %"zz"
  %".580" = sitofp i32 2 to double
  %".581" = sitofp i32 %"zz.2" to double
  %".582" = call double @"llvm.pow.f64"(double %".580", double %".581")
  %".583" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".584" = call i32 (i8*, ...) @"printf"(i8* %".583", double %".582")
  %".585" = mul i32 2, 5
  %".586" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".587" = call i32 (i8*, ...) @"printf"(i8* %".586", i32 %".585")
  %"x.1" = load i32, i32* %"x"
  %".588" = mul i32 %"x.1", 4
  %".589" = add i32 2, %".588"
  %".590" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".591" = call i32 (i8*, ...) @"printf"(i8* %".590", i32 %".589")
  %".592" = add i32 2, 3
  %".593" = mul i32 %".592", 4
  %".594" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".595" = call i32 (i8*, ...) @"printf"(i8* %".594", i32 %".593")
  %".596" = sitofp i32 10 to double
  %".597" = sitofp i32 2 to double
  %".598" = fdiv double %".596", %".597"
  %".599" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".600" = call i32 (i8*, ...) @"printf"(i8* %".599", double %".598")
  %".601" = sitofp i32 2 to double
  %".602" = sitofp i32 3 to double
  %".603" = call double @"llvm.pow.f64"(double %".601", double %".602")
  %".604" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".605" = call i32 (i8*, ...) @"printf"(i8* %".604", double %".603")
  %".606" = sitofp i32 3 to double
  %".607" = sitofp i32 2 to double
  %".608" = call double @"llvm.pow.f64"(double %".606", double %".607")
  %".609" = sitofp i32 2 to double
  %".610" = call double @"llvm.pow.f64"(double %".609", double %".608")
  %".611" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".612" = call i32 (i8*, ...) @"printf"(i8* %".611", double %".610")
  %".613" = mul i32 3, 2
  %".614" = add i32 5, %".613"
  %".615" = sitofp i32 4 to double
  %".616" = sitofp i32 2 to double
  %".617" = fdiv double %".615", %".616"
  %".618" = sitofp i32 %".614" to double
  %".619" = fsub double %".618", %".617"
  %".620" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".621" = call i32 (i8*, ...) @"printf"(i8* %".620", double %".619")
  %".622" = add i32 3, 4
  %".623" = sitofp i32 2 to double
  %".624" = sitofp i32 3 to double
  %".625" = call double @"llvm.pow.f64"(double %".623", double %".624")
  %".626" = sitofp i32 %".622" to double
  %".627" = fmul double %".626", %".625"
  %".628" = sitofp i32 10 to double
  %".629" = sitofp i32 2 to double
  %".630" = fdiv double %".628", %".629"
  %".631" = fsub double %".627", %".630"
  %".632" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".633" = call i32 (i8*, ...) @"printf"(i8* %".632", double %".631")
  %".634" = sitofp i32 5 to double
  %".635" = sitofp i32 2 to double
  %".636" = fdiv double %".634", %".635"
  %".637" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".638" = call i32 (i8*, ...) @"printf"(i8* %".637", double %".636")
  %".639" = sub i32 0, 2
  %".640" = mul i32 4, %".639"
  %".641" = add i32 2, %".640"
  %".642" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".643" = call i32 (i8*, ...) @"printf"(i8* %".642", i32 %".641")
  %"j" = alloca i32
  store i32 0, i32* %"j"
  br label %"for.cond.3"
for.cond.3:
  %"j.1" = load i32, i32* %"j"
  %".646" = icmp slt i32 %"j.1", 10
  br i1 %".646", label %"for.body.3", label %"for.exit.3"
for.body.3:
  %"j.2" = load i32, i32* %"j"
  %".648" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".649" = call i32 (i8*, ...) @"printf"(i8* %".648", i32 %"j.2")
  %"j.3" = load i32, i32* %"j"
  %".650" = sitofp i32 2 to double
  %".651" = sitofp i32 %"j.3" to double
  %".652" = call double @"llvm.pow.f64"(double %".650", double %".651")
  %".653" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".654" = call i32 (i8*, ...) @"printf"(i8* %".653", double %".652")
  br label %"for.inc.3"
for.inc.3:
  %"j.4" = load i32, i32* %"j"
  %"j.5" = load i32, i32* %"j"
  %".656" = add i32 %"j.5", 1
  store i32 %".656", i32* %"j"
  br label %"for.cond.3"
for.exit.3:
  %".659" = sitofp i32 55 to double
  %".660" = sitofp i32 5 to double
  %".661" = call double @"llvm.pow.f64"(double %".659", double %".660")
  %".662" = sitofp i32 5 to double
  %".663" = fdiv double %".661", %".662"
  %".664" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".665" = call i32 (i8*, ...) @"printf"(i8* %".664", double %".663")
  %".666" = sitofp i32 5 to double
  %".667" = sitofp i32 3 to double
  %".668" = call double @"llvm.pow.f64"(double %".666", double %".667")
  %".669" = sitofp i32 99 to double
  %".670" = fmul double %".669", %".668"
  %".671" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".672" = call i32 (i8*, ...) @"printf"(i8* %".671", double %".670")
  %".673" = sitofp i32 3000 to double
  %".674" = sitofp i32 4 to double
  %".675" = fdiv double %".673", %".674"
  %".676" = sitofp i32 9000 to double
  %".677" = fmul double %".675", %".676"
  %".678" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".679" = call i32 (i8*, ...) @"printf"(i8* %".678", double %".677")
  %".680" = sub i32 88, 2
  %".681" = mul i32 85, 18
  %".682" = sitofp i32 100 to double
  %".683" = sitofp i32 4 to double
  %".684" = call double @"llvm.pow.f64"(double %".682", double %".683")
  %".685" = sitofp i32 %".681" to double
  %".686" = fdiv double %".685", %".684"
  %".687" = sitofp i32 %".680" to double
  %".688" = fadd double %".687", %".686"
  %".689" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".690" = call i32 (i8*, ...) @"printf"(i8* %".689", double %".688")
  %".691" = sitofp i32 100 to double
  %".692" = sitofp i32 2 to double
  %".693" = fdiv double %".691", %".692"
  %".694" = sitofp i32 88 to double
  %".695" = fmul double %".693", %".694"
  %".696" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".697" = call i32 (i8*, ...) @"printf"(i8* %".696", double %".695")
  %".698" = sitofp i32 58 to double
  %".699" = sitofp i32 58 to double
  %".700" = call double @"llvm.pow.f64"(double %".698", double %".699")
  %".701" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".702" = call i32 (i8*, ...) @"printf"(i8* %".701", double %".700")
  %"zz.3" = load i32, i32* %"zz"
  %".703" = sitofp i32 2 to double
  %".704" = sitofp i32 %"zz.3" to double
  %".705" = call double @"llvm.pow.f64"(double %".703", double %".704")
  %".706" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".707" = call i32 (i8*, ...) @"printf"(i8* %".706", double %".705")
  %"juan" = alloca i8*
  %".708" = bitcast [4 x i8]* @"str.8271418719002564090" to i8*
  store i8* %".708", i8** %"juan"
  %"juan.1" = load i8*, i8** %"juan"
  %".710" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".711" = call i32 (i8*, ...) @"printf"(i8* %".710", i8* %"juan.1")
  %".712" = bitcast [11 x i8]* @"str.-3636893698882659382" to i8*
  %".713" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".714" = call i32 (i8*, ...) @"printf"(i8* %".713", i8* %".712")
  %".715" = call i32 @"suma"()
  %".716" = bitcast [73 x i8]* @"str.8051997403959528221" to i8*
  %".717" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".718" = call i32 (i8*, ...) @"printf"(i8* %".717", i8* %".716")
  %"a" = alloca i32
  store i32 10, i32* %"a"
  %"b" = alloca i32
  %"a.1" = load i32, i32* %"a"
  %".720" = call i32 @"doble"(i32 %"a.1")
  store i32 %".720", i32* %"b"
  %"b.1" = load i32, i32* %"b"
  %".722" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".723" = call i32 (i8*, ...) @"printf"(i8* %".722", i32 %"b.1")
  %".724" = bitcast [19 x i8]* @"str.-2942038614238143277" to i8*
  %".725" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".726" = call i32 (i8*, ...) @"printf"(i8* %".725", i8* %".724")
  %".727" = call i32 @"funcionB"(i32 5)
  %".728" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".729" = call i32 (i8*, ...) @"printf"(i8* %".728", i32 %".727")
  %".730" = bitcast [2 x i8]* @"str.1459553535582526388" to i8*
  %".731" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".732" = call i32 (i8*, ...) @"printf"(i8* %".731", i8* %".730")
  %".733" = sitofp i32 55 to double
  %".734" = sitofp i32 5 to double
  %".735" = call double @"llvm.pow.f64"(double %".733", double %".734")
  %".736" = sitofp i32 5 to double
  %".737" = fdiv double %".735", %".736"
  %".738" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".739" = call i32 (i8*, ...) @"printf"(i8* %".738", double %".737")
  %".740" = sitofp i32 5 to double
  %".741" = sitofp i32 3 to double
  %".742" = call double @"llvm.pow.f64"(double %".740", double %".741")
  %".743" = sitofp i32 99 to double
  %".744" = fmul double %".743", %".742"
  %".745" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".746" = call i32 (i8*, ...) @"printf"(i8* %".745", double %".744")
  %".747" = sitofp i32 3000 to double
  %".748" = sitofp i32 4 to double
  %".749" = fdiv double %".747", %".748"
  %".750" = sitofp i32 9000 to double
  %".751" = fmul double %".749", %".750"
  %".752" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".753" = call i32 (i8*, ...) @"printf"(i8* %".752", double %".751")
  %".754" = sub i32 88, 2
  %".755" = mul i32 85, 18
  %".756" = sitofp i32 100 to double
  %".757" = sitofp i32 4 to double
  %".758" = call double @"llvm.pow.f64"(double %".756", double %".757")
  %".759" = sitofp i32 %".755" to double
  %".760" = fdiv double %".759", %".758"
  %".761" = sitofp i32 %".754" to double
  %".762" = fadd double %".761", %".760"
  %".763" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".764" = call i32 (i8*, ...) @"printf"(i8* %".763", double %".762")
  %".765" = sitofp i32 100 to double
  %".766" = sitofp i32 2 to double
  %".767" = fdiv double %".765", %".766"
  %".768" = sitofp i32 88 to double
  %".769" = fmul double %".767", %".768"
  %".770" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".771" = call i32 (i8*, ...) @"printf"(i8* %".770", double %".769")
  %".772" = sitofp i32 58 to double
  %".773" = sitofp i32 58 to double
  %".774" = call double @"llvm.pow.f64"(double %".772", double %".773")
  %".775" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".776" = call i32 (i8*, ...) @"printf"(i8* %".775", double %".774")
  %"zz.4" = load i32, i32* %"zz"
  %".777" = sitofp i32 2 to double
  %".778" = sitofp i32 %"zz.4" to double
  %".779" = call double @"llvm.pow.f64"(double %".777", double %".778")
  %".780" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".781" = call i32 (i8*, ...) @"printf"(i8* %".780", double %".779")
  %"y" = alloca double
  store double 0x4039000000000000, double* %"y"
  %"x.2" = load i32, i32* %"x"
  %".783" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".784" = call i32 (i8*, ...) @"printf"(i8* %".783", i32 %"x.2")
  %"y.1" = load double, double* %"y"
  %".785" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".786" = call i32 (i8*, ...) @"printf"(i8* %".785", double %"y.1")
  %".787" = bitcast [24 x i8]* @"str.-2024933119051681849" to i8*
  %".788" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".789" = call i32 (i8*, ...) @"printf"(i8* %".788", i8* %".787")
  %".790" = add i32 7, 2
  %".791" = sitofp i32 3 to double
  %".792" = sitofp i32 12 to double
  %".793" = call double @"llvm.pow.f64"(double %".791", double %".792")
  %".794" = sitofp i32 %".790" to double
  %".795" = fadd double %".794", %".793"
  %".796" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".797" = call i32 (i8*, ...) @"printf"(i8* %".796", double %".795")
  %".798" = sitofp i32 2 to double
  %".799" = sitofp i32 5 to double
  %".800" = call double @"llvm.pow.f64"(double %".798", double %".799")
  %".801" = sitofp i32 5 to double
  %".802" = sitofp i32 2 to double
  %".803" = call double @"llvm.pow.f64"(double %".801", double %".802")
  %".804" = fmul double %".800", %".803"
  %".805" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".806" = call i32 (i8*, ...) @"printf"(i8* %".805", double %".804")
  %".807" = sitofp i32 5 to double
  %".808" = sitofp i32 25 to double
  %".809" = call double @"llvm.pow.f64"(double %".807", double %".808")
  %".810" = sitofp i32 5 to double
  %".811" = fmul double %".810", %".809"
  %".812" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".813" = call i32 (i8*, ...) @"printf"(i8* %".812", double %".811")
  %".814" = mul i32 2, 23
  %".815" = sub i32 %".814", 23
  %".816" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".817" = call i32 (i8*, ...) @"printf"(i8* %".816", i32 %".815")
  %"x.3" = load i32, i32* %"x"
  %".818" = sitofp i32 30 to double
  %".819" = sitofp i32 %"x.3" to double
  %".820" = call double @"llvm.pow.f64"(double %".818", double %".819")
  %".821" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".822" = call i32 (i8*, ...) @"printf"(i8* %".821", double %".820")
  %".823" = mul i32 2, 2
  %".824" = mul i32 %".823", 2
  %".825" = sitofp i32 %".824" to double
  %".826" = sitofp i32 2 to double
  %".827" = fdiv double %".825", %".826"
  %".828" = mul i32 2, 2
  %".829" = sitofp i32 %".828" to double
  %".830" = fadd double %".827", %".829"
  %".831" = mul i32 2, 2
  %".832" = sitofp i32 %".831" to double
  %".833" = fadd double %".830", %".832"
  %".834" = mul i32 2, 2
  %".835" = sitofp i32 %".834" to double
  %".836" = fadd double %".833", %".835"
  %".837" = mul i32 2, 2
  %".838" = sitofp i32 %".837" to double
  %".839" = fadd double %".836", %".838"
  %".840" = mul i32 2, 2
  %".841" = sitofp i32 %".840" to double
  %".842" = fadd double %".839", %".841"
  %".843" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".844" = call i32 (i8*, ...) @"printf"(i8* %".843", double %".842")
  %"x.4" = load i32, i32* %"x"
  %"x.5" = load i32, i32* %"x"
  %".845" = sitofp i32 %"x.4" to double
  %".846" = sitofp i32 %"x.5" to double
  %".847" = call double @"llvm.pow.f64"(double %".845", double %".846")
  %".848" = mul i32 2, 5
  %".849" = sitofp i32 %".848" to double
  %".850" = fadd double %".847", %".849"
  %".851" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".852" = call i32 (i8*, ...) @"printf"(i8* %".851", double %".850")
  %"x.6" = load i32, i32* %"x"
  %".853" = icmp sgt i32 %"x.6", 15
  br i1 %".853", label %"then", label %"else"
then:
  %".855" = bitcast [7 x i8]* @"str.-7370349512111764288" to i8*
  %".856" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".857" = call i32 (i8*, ...) @"printf"(i8* %".856", i8* %".855")
  br label %"ifcont"
else:
  %".859" = bitcast [11 x i8]* @"str.-5818741745685491019" to i8*
  %".860" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".861" = call i32 (i8*, ...) @"printf"(i8* %".860", i8* %".859")
  br label %"ifcont"
ifcont:
  %".863" = mul i32 18, 2
  %".864" = mul i32 5, 10
  %".865" = sitofp i32 %".864" to double
  %".866" = sitofp i32 8 to double
  %".867" = fdiv double %".865", %".866"
  %".868" = sitofp i32 %".863" to double
  %".869" = fadd double %".868", %".867"
  %".870" = mul i32 5, 2
  %".871" = sitofp i32 %".870" to double
  %".872" = fadd double %".869", %".871"
  %".873" = sitofp i32 800000 to double
  %".874" = fadd double %".872", %".873"
  %".875" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".876" = call i32 (i8*, ...) @"printf"(i8* %".875", double %".874")
  %".877" = mul i32 88, 88
  %".878" = mul i32 %".877", 88
  %".879" = mul i32 %".878", 88
  %".880" = mul i32 %".879", 88
  %".881" = mul i32 %".880", 5
  %".882" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".883" = call i32 (i8*, ...) @"printf"(i8* %".882", i32 %".881")
  %".884" = sitofp i32 42 to double
  %".885" = sitofp i32 5 to double
  %".886" = call double @"llvm.pow.f64"(double %".884", double %".885")
  %".887" = sitofp i32 2 to double
  %".888" = fdiv double %".886", %".887"
  %".889" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".890" = call i32 (i8*, ...) @"printf"(i8* %".889", double %".888")
  %".891" = sitofp i32 2 to double
  %".892" = sitofp i32 9 to double
  %".893" = call double @"llvm.pow.f64"(double %".891", double %".892")
  %".894" = sitofp i32 78 to double
  %".895" = fdiv double %".894", %".893"
  %".896" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".897" = call i32 (i8*, ...) @"printf"(i8* %".896", double %".895")
  %".898" = sitofp i32 99 to double
  %".899" = sitofp i32 2 to double
  %".900" = call double @"llvm.pow.f64"(double %".898", double %".899")
  %".901" = sitofp i32 28 to double
  %".902" = fdiv double %".901", %".900"
  %".903" = sitofp i32 6 to double
  %".904" = fadd double %".902", %".903"
  %".905" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".906" = call i32 (i8*, ...) @"printf"(i8* %".905", double %".904")
  %".907" = sitofp i32 5 to double
  %".908" = sitofp i32 5 to double
  %".909" = call double @"llvm.pow.f64"(double %".907", double %".908")
  %".910" = sitofp i32 2 to double
  %".911" = fadd double %".909", %".910"
  %".912" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".913" = call i32 (i8*, ...) @"printf"(i8* %".912", double %".911")
  %".914" = sitofp i32 78 to double
  %".915" = sitofp i32 25 to double
  %".916" = call double @"llvm.pow.f64"(double %".914", double %".915")
  %".917" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".918" = call i32 (i8*, ...) @"printf"(i8* %".917", double %".916")
  %".919" = sitofp i32 125 to double
  %".920" = sitofp i32 5 to double
  %".921" = call double @"llvm.pow.f64"(double %".919", double %".920")
  %".922" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".923" = call i32 (i8*, ...) @"printf"(i8* %".922", double %".921")
  %".924" = sitofp i32 83 to double
  %".925" = sitofp i32 555 to double
  %".926" = call double @"llvm.pow.f64"(double %".924", double %".925")
  %".927" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".928" = call i32 (i8*, ...) @"printf"(i8* %".927", double %".926")
  %".929" = sitofp i32 78 to double
  %".930" = sitofp i32 2 to double
  %".931" = call double @"llvm.pow.f64"(double %".929", double %".930")
  %".932" = sitofp i32 5 to double
  %".933" = fadd double %".931", %".932"
  %".934" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".935" = call i32 (i8*, ...) @"printf"(i8* %".934", double %".933")
  br label %"while.cond.1"
while.cond.1:
  %"x.7" = load i32, i32* %"x"
  %".937" = icmp sgt i32 %"x.7", 0
  br i1 %".937", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"x.8" = load i32, i32* %"x"
  %".939" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".940" = call i32 (i8*, ...) @"printf"(i8* %".939", i32 %"x.8")
  %"x.9" = load i32, i32* %"x"
  %".941" = sub i32 %"x.9", 1
  store i32 %".941", i32* %"x"
  br label %"while.cond.1"
while.end.1:
  %"i.6" = alloca i32
  store i32 0, i32* %"i.6"
  br label %"for.cond.4"
for.cond.4:
  %"i.7" = load i32, i32* %"i.6"
  %".946" = icmp sle i32 %"i.7", 100
  br i1 %".946", label %"for.body.4", label %"for.exit.4"
for.body.4:
  %"i.8" = load i32, i32* %"i.6"
  %".948" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".949" = call i32 (i8*, ...) @"printf"(i8* %".948", i32 %"i.8")
  br label %"for.inc.4"
for.inc.4:
  %"i.9" = load i32, i32* %"i.6"
  %"i.10" = load i32, i32* %"i.6"
  %".951" = add i32 %"i.10", 1
  store i32 %".951", i32* %"i.6"
  br label %"for.cond.4"
for.exit.4:
  %".954" = call i32 @"contarHasta"(i32 5)
  %".955" = call i32 @"potencia"(i32 2, i32 3)
  %".956" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".957" = call i32 (i8*, ...) @"printf"(i8* %".956", i32 %".955")
  %".958" = call i32 @"sumar"(i32 5, i32 7)
  %".959" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".960" = call i32 (i8*, ...) @"printf"(i8* %".959", i32 %".958")
  %"resultado" = alloca i32
  %".961" = call i32 @"sumaHasta"(i32 5)
  store i32 %".961", i32* %"resultado"
  %"resultado.1" = load i32, i32* %"resultado"
  %".963" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".964" = call i32 (i8*, ...) @"printf"(i8* %".963", i32 %"resultado.1")
  %".965" = mul i32 18, 2
  %".966" = mul i32 5, 10
  %".967" = sitofp i32 %".966" to double
  %".968" = sitofp i32 8 to double
  %".969" = fdiv double %".967", %".968"
  %".970" = sitofp i32 %".965" to double
  %".971" = fadd double %".970", %".969"
  %".972" = mul i32 5, 2
  %".973" = sitofp i32 %".972" to double
  %".974" = fadd double %".971", %".973"
  %".975" = sitofp i32 800000 to double
  %".976" = fadd double %".974", %".975"
  %".977" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".978" = call i32 (i8*, ...) @"printf"(i8* %".977", double %".976")
  %".979" = mul i32 88, 88
  %".980" = mul i32 %".979", 88
  %".981" = mul i32 %".980", 88
  %".982" = mul i32 %".981", 88
  %".983" = mul i32 %".982", 5
  %".984" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".985" = call i32 (i8*, ...) @"printf"(i8* %".984", i32 %".983")
  %".986" = sitofp i32 42 to double
  %".987" = sitofp i32 5 to double
  %".988" = call double @"llvm.pow.f64"(double %".986", double %".987")
  %".989" = sitofp i32 2 to double
  %".990" = fdiv double %".988", %".989"
  %".991" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".992" = call i32 (i8*, ...) @"printf"(i8* %".991", double %".990")
  %".993" = sitofp i32 2 to double
  %".994" = sitofp i32 9 to double
  %".995" = call double @"llvm.pow.f64"(double %".993", double %".994")
  %".996" = sitofp i32 78 to double
  %".997" = fdiv double %".996", %".995"
  %".998" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".999" = call i32 (i8*, ...) @"printf"(i8* %".998", double %".997")
  %".1000" = sitofp i32 99 to double
  %".1001" = sitofp i32 2 to double
  %".1002" = call double @"llvm.pow.f64"(double %".1000", double %".1001")
  %".1003" = sitofp i32 28 to double
  %".1004" = fdiv double %".1003", %".1002"
  %".1005" = sitofp i32 6 to double
  %".1006" = fadd double %".1004", %".1005"
  %".1007" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1008" = call i32 (i8*, ...) @"printf"(i8* %".1007", double %".1006")
  %".1009" = sitofp i32 5 to double
  %".1010" = sitofp i32 5 to double
  %".1011" = call double @"llvm.pow.f64"(double %".1009", double %".1010")
  %".1012" = sitofp i32 2 to double
  %".1013" = fadd double %".1011", %".1012"
  %".1014" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1015" = call i32 (i8*, ...) @"printf"(i8* %".1014", double %".1013")
  %".1016" = sitofp i32 78 to double
  %".1017" = sitofp i32 25 to double
  %".1018" = call double @"llvm.pow.f64"(double %".1016", double %".1017")
  %".1019" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1020" = call i32 (i8*, ...) @"printf"(i8* %".1019", double %".1018")
  %".1021" = sitofp i32 125 to double
  %".1022" = sitofp i32 5 to double
  %".1023" = call double @"llvm.pow.f64"(double %".1021", double %".1022")
  %".1024" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1025" = call i32 (i8*, ...) @"printf"(i8* %".1024", double %".1023")
  %".1026" = sitofp i32 83 to double
  %".1027" = sitofp i32 555 to double
  %".1028" = call double @"llvm.pow.f64"(double %".1026", double %".1027")
  %".1029" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1030" = call i32 (i8*, ...) @"printf"(i8* %".1029", double %".1028")
  %".1031" = sitofp i32 78 to double
  %".1032" = sitofp i32 2 to double
  %".1033" = call double @"llvm.pow.f64"(double %".1031", double %".1032")
  %".1034" = sitofp i32 5 to double
  %".1035" = fadd double %".1033", %".1034"
  %".1036" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1037" = call i32 (i8*, ...) @"printf"(i8* %".1036", double %".1035")
  %"resultadoFFF" = alloca i32
  %".1038" = call i32 @"fibonacci"(i32 50)
  store i32 %".1038", i32* %"resultadoFFF"
  %"resultadoFFF.1" = load i32, i32* %"resultadoFFF"
  %".1040" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1041" = call i32 (i8*, ...) @"printf"(i8* %".1040", i32 %"resultadoFFF.1")
  %".1042" = mul i32 2, 5
  %".1043" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1044" = call i32 (i8*, ...) @"printf"(i8* %".1043", i32 %".1042")
  %"x.10" = load i32, i32* %"x"
  %".1045" = mul i32 %"x.10", 4
  %".1046" = add i32 2, %".1045"
  %".1047" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1048" = call i32 (i8*, ...) @"printf"(i8* %".1047", i32 %".1046")
  %".1049" = add i32 2, 3
  %".1050" = mul i32 %".1049", 4
  %".1051" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1052" = call i32 (i8*, ...) @"printf"(i8* %".1051", i32 %".1050")
  %".1053" = sitofp i32 10 to double
  %".1054" = sitofp i32 2 to double
  %".1055" = fdiv double %".1053", %".1054"
  %".1056" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1057" = call i32 (i8*, ...) @"printf"(i8* %".1056", double %".1055")
  %".1058" = sitofp i32 2 to double
  %".1059" = sitofp i32 3 to double
  %".1060" = call double @"llvm.pow.f64"(double %".1058", double %".1059")
  %".1061" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1062" = call i32 (i8*, ...) @"printf"(i8* %".1061", double %".1060")
  %".1063" = sitofp i32 3 to double
  %".1064" = sitofp i32 2 to double
  %".1065" = call double @"llvm.pow.f64"(double %".1063", double %".1064")
  %".1066" = sitofp i32 2 to double
  %".1067" = call double @"llvm.pow.f64"(double %".1066", double %".1065")
  %".1068" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1069" = call i32 (i8*, ...) @"printf"(i8* %".1068", double %".1067")
  %".1070" = mul i32 3, 2
  %".1071" = add i32 5, %".1070"
  %".1072" = sitofp i32 4 to double
  %".1073" = sitofp i32 2 to double
  %".1074" = fdiv double %".1072", %".1073"
  %".1075" = sitofp i32 %".1071" to double
  %".1076" = fsub double %".1075", %".1074"
  %".1077" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1078" = call i32 (i8*, ...) @"printf"(i8* %".1077", double %".1076")
  %".1079" = add i32 3, 4
  %".1080" = sitofp i32 2 to double
  %".1081" = sitofp i32 3 to double
  %".1082" = call double @"llvm.pow.f64"(double %".1080", double %".1081")
  %".1083" = sitofp i32 %".1079" to double
  %".1084" = fmul double %".1083", %".1082"
  %".1085" = sitofp i32 10 to double
  %".1086" = sitofp i32 2 to double
  %".1087" = fdiv double %".1085", %".1086"
  %".1088" = fsub double %".1084", %".1087"
  %".1089" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1090" = call i32 (i8*, ...) @"printf"(i8* %".1089", double %".1088")
  %".1091" = sitofp i32 5 to double
  %".1092" = sitofp i32 2 to double
  %".1093" = fdiv double %".1091", %".1092"
  %".1094" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1095" = call i32 (i8*, ...) @"printf"(i8* %".1094", double %".1093")
  %".1096" = sub i32 0, 2
  %".1097" = mul i32 4, %".1096"
  %".1098" = add i32 2, %".1097"
  %".1099" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1100" = call i32 (i8*, ...) @"printf"(i8* %".1099", i32 %".1098")
  %".1101" = mul i32 18, 2
  %".1102" = mul i32 5, 10
  %".1103" = sitofp i32 %".1102" to double
  %".1104" = sitofp i32 8 to double
  %".1105" = fdiv double %".1103", %".1104"
  %".1106" = sitofp i32 %".1101" to double
  %".1107" = fadd double %".1106", %".1105"
  %".1108" = mul i32 5, 2
  %".1109" = sitofp i32 %".1108" to double
  %".1110" = fadd double %".1107", %".1109"
  %".1111" = sitofp i32 800000 to double
  %".1112" = fadd double %".1110", %".1111"
  %".1113" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1114" = call i32 (i8*, ...) @"printf"(i8* %".1113", double %".1112")
  %".1115" = mul i32 88, 88
  %".1116" = mul i32 %".1115", 88
  %".1117" = mul i32 %".1116", 88
  %".1118" = mul i32 %".1117", 88
  %".1119" = mul i32 %".1118", 5
  %".1120" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1121" = call i32 (i8*, ...) @"printf"(i8* %".1120", i32 %".1119")
  %".1122" = sitofp i32 42 to double
  %".1123" = sitofp i32 5 to double
  %".1124" = call double @"llvm.pow.f64"(double %".1122", double %".1123")
  %".1125" = sitofp i32 2 to double
  %".1126" = fdiv double %".1124", %".1125"
  %".1127" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1128" = call i32 (i8*, ...) @"printf"(i8* %".1127", double %".1126")
  %".1129" = sitofp i32 2 to double
  %".1130" = sitofp i32 9 to double
  %".1131" = call double @"llvm.pow.f64"(double %".1129", double %".1130")
  %".1132" = sitofp i32 78 to double
  %".1133" = fdiv double %".1132", %".1131"
  %".1134" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1135" = call i32 (i8*, ...) @"printf"(i8* %".1134", double %".1133")
  %".1136" = sitofp i32 99 to double
  %".1137" = sitofp i32 2 to double
  %".1138" = call double @"llvm.pow.f64"(double %".1136", double %".1137")
  %".1139" = sitofp i32 28 to double
  %".1140" = fdiv double %".1139", %".1138"
  %".1141" = sitofp i32 6 to double
  %".1142" = fadd double %".1140", %".1141"
  %".1143" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1144" = call i32 (i8*, ...) @"printf"(i8* %".1143", double %".1142")
  %"resultadoFFFF" = alloca i32
  %".1145" = call i32 @"fibonacci"(i32 50)
  store i32 %".1145", i32* %"resultadoFFFF"
  %"resultadoFFFF.1" = load i32, i32* %"resultadoFFFF"
  %".1147" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1148" = call i32 (i8*, ...) @"printf"(i8* %".1147", i32 %"resultadoFFFF.1")
  %".1149" = sitofp i32 5 to double
  %".1150" = sitofp i32 5 to double
  %".1151" = call double @"llvm.pow.f64"(double %".1149", double %".1150")
  %".1152" = sitofp i32 2 to double
  %".1153" = fadd double %".1151", %".1152"
  %".1154" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1155" = call i32 (i8*, ...) @"printf"(i8* %".1154", double %".1153")
  %".1156" = sitofp i32 78 to double
  %".1157" = sitofp i32 25 to double
  %".1158" = call double @"llvm.pow.f64"(double %".1156", double %".1157")
  %".1159" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1160" = call i32 (i8*, ...) @"printf"(i8* %".1159", double %".1158")
  %".1161" = sitofp i32 125 to double
  %".1162" = sitofp i32 5 to double
  %".1163" = call double @"llvm.pow.f64"(double %".1161", double %".1162")
  %".1164" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1165" = call i32 (i8*, ...) @"printf"(i8* %".1164", double %".1163")
  %".1166" = sitofp i32 83 to double
  %".1167" = sitofp i32 55 to double
  %".1168" = call double @"llvm.pow.f64"(double %".1166", double %".1167")
  %".1169" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1170" = call i32 (i8*, ...) @"printf"(i8* %".1169", double %".1168")
  %".1171" = sitofp i32 78 to double
  %".1172" = sitofp i32 2 to double
  %".1173" = call double @"llvm.pow.f64"(double %".1171", double %".1172")
  %".1174" = sitofp i32 5 to double
  %".1175" = fadd double %".1173", %".1174"
  %".1176" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1177" = call i32 (i8*, ...) @"printf"(i8* %".1176", double %".1175")
  ret i32 0
}

@"str.-2299630381233036967" = internal constant [21 x i8] c"HOY ES UN % GRAN DIA\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"str.1780731933373777837" = internal constant [26 x i8] c"El resultado de 19^35 es \00"
declare double @"llvm.pow.f64"(double %".1", double %".2")

@"fmt_-8802024497518871077" = internal constant [3 x i8] c"%f\00"
@"str.7820827835370743510" = internal constant [9 x i8] c"Bryan + \00"
@"str.-219633879990766185" = internal constant [12 x i8] c"Jonathan + \00"
@"str.29663516973537804" = internal constant [8 x i8] c"Jean + \00"
@"str.2055162134592748269" = internal constant [8 x i8] c"Roberto\00"
@"str.-3774160135910516209" = internal constant [20 x i8] c"el res de 3^333 es \00"
@"fmt_float" = internal constant [4 x i8] c"%f\0a\00"
@"str.-5990469399282911138" = internal constant [5 x i8] c"hola\00"
@"str.3178796603870470836" = internal constant [23 x i8] c"el resultado de gg es \00"
@"str.-3492187847060208424" = internal constant [9 x i8] c"Mi edad \00"
@"fmt_-2690096950753263951" = internal constant [3 x i8] c"%d\00"
@"str.-8496734725837645629" = internal constant [18 x i8] c"La pot de 5^5 es \00"
@"str.2217310185640068682" = internal constant [24 x i8] c"EXTREMOOOOOOOOOOOOOOOOO\00"
@"str.-6927658657090574447" = internal constant [21 x i8] c"aaaaaaaaaaaaaaaaaaaa\00"
@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"
@"str.-4610371873025826167" = internal constant [6 x i8] c"Hola \00"
@"str.7099313127551586642" = internal constant [12 x i8] c"Hola muando\00"
@"str.-7668869861663883741" = internal constant [5 x i8] c"HOLA\00"
@"str.8271418719002564090" = internal constant [4 x i8] c"Bry\00"
@"str.-3636893698882659382" = internal constant [11 x i8] c"La suma es\00"
@"str.8051997403959528221" = internal constant [73 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH\00"
@"str.-2942038614238143277" = internal constant [19 x i8] c"pruebaaaaaaaaaaaas\00"
@"str.1459553535582526388" = internal constant [2 x i8] c" \00"
@"str.-2024933119051681849" = internal constant [24 x i8] c"operaciones matematicas\00"
@"str.-7370349512111764288" = internal constant [7 x i8] c"x > 15\00"
@"str.-5818741745685491019" = internal constant [11 x i8] c"x es <= 15\00"