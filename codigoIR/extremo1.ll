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
  %".2" = bitcast [21 x i8]* @"str.-6927658657090574447" to i8*
  %".3" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i8* %".2")
  %"num4" = alloca i32
  store i32 50, i32* %"num4"
  %"num5" = alloca i32
  store i32 50, i32* %"num5"
  %"num4.1" = load i32, i32* %"num4"
  %"num5.1" = load i32, i32* %"num5"
  %".7" = sitofp i32 %"num4.1" to double
  %".8" = sitofp i32 %"num5.1" to double
  %".9" = call double @"llvm.pow.f64"(double %".7", double %".8")
  %".10" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", double %".9")
  %".12" = sitofp i32 50 to double
  %".13" = sitofp i32 50 to double
  %".14" = call double @"llvm.pow.f64"(double %".12", double %".13")
  %".15" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", double %".14")
  %".17" = sitofp i32 88 to double
  %".18" = sitofp i32 75 to double
  %".19" = call double @"llvm.pow.f64"(double %".17", double %".18")
  %".20" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", double %".19")
  %"d" = alloca i32
  store i32 90, i32* %"d"
  %"num4.2" = load i32, i32* %"num4"
  %"num4.3" = load i32, i32* %"num4"
  %".23" = sitofp i32 %"num4.2" to double
  %".24" = sitofp i32 %"num4.3" to double
  %".25" = call double @"llvm.pow.f64"(double %".23", double %".24")
  %".26" = sitofp i32 2 to double
  %".27" = fdiv double %".25", %".26"
  %".28" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28", double %".27")
  %"num4.4" = load i32, i32* %"num4"
  %".30" = sitofp i32 %"num4.4" to double
  %".31" = sitofp i32 50 to double
  %".32" = call double @"llvm.pow.f64"(double %".30", double %".31")
  %".33" = sitofp i32 2 to double
  %".34" = fdiv double %".32", %".33"
  %".35" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".35", double %".34")
  %"num5.2" = load i32, i32* %"num5"
  %".37" = sitofp i32 50 to double
  %".38" = sitofp i32 %"num5.2" to double
  %".39" = call double @"llvm.pow.f64"(double %".37", double %".38")
  %".40" = sitofp i32 20 to double
  %".41" = fdiv double %".39", %".40"
  %".42" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".42", double %".41")
  %"w" = alloca i32
  store i32 0, i32* %"w"
  br label %"for.cond"
for.cond:
  %"w.1" = load i32, i32* %"w"
  %".46" = icmp sle i32 %"w.1", 100
  br i1 %".46", label %"for.body", label %"for.exit"
for.body:
  %"num4.5" = load i32, i32* %"num4"
  %"w.2" = load i32, i32* %"w"
  %".48" = sitofp i32 %"num4.5" to double
  %".49" = sitofp i32 %"w.2" to double
  %".50" = call double @"llvm.pow.f64"(double %".48", double %".49")
  %"num5.3" = load i32, i32* %"num5"
  %".51" = sitofp i32 %"num5.3" to double
  %".52" = fdiv double %".50", %".51"
  %".53" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".53", double %".52")
  br label %"for.inc"
for.inc:
  %"w.3" = load i32, i32* %"w"
  %"w.4" = load i32, i32* %"w"
  %".56" = add i32 %"w.4", 1
  store i32 %".56", i32* %"w"
  br label %"for.cond"
for.exit:
  %".59" = mul i32 18, 2
  %".60" = mul i32 5, 10
  %".61" = sitofp i32 %".60" to double
  %".62" = sitofp i32 8 to double
  %".63" = fdiv double %".61", %".62"
  %".64" = sitofp i32 %".59" to double
  %".65" = fadd double %".64", %".63"
  %".66" = mul i32 5, 2
  %".67" = sitofp i32 %".66" to double
  %".68" = fadd double %".65", %".67"
  %".69" = sitofp i32 800000 to double
  %".70" = fadd double %".68", %".69"
  %".71" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".71", double %".70")
  %".73" = mul i32 88, 88
  %".74" = mul i32 %".73", 88
  %".75" = mul i32 %".74", 88
  %".76" = mul i32 %".75", 88
  %".77" = mul i32 %".76", 5
  %".78" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".78", i32 %".77")
  %".80" = sitofp i32 42 to double
  %".81" = sitofp i32 5 to double
  %".82" = call double @"llvm.pow.f64"(double %".80", double %".81")
  %".83" = sitofp i32 2 to double
  %".84" = fdiv double %".82", %".83"
  %".85" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".85", double %".84")
  %".87" = sitofp i32 2 to double
  %".88" = sitofp i32 9 to double
  %".89" = call double @"llvm.pow.f64"(double %".87", double %".88")
  %".90" = sitofp i32 78 to double
  %".91" = fdiv double %".90", %".89"
  %".92" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".93" = call i32 (i8*, ...) @"printf"(i8* %".92", double %".91")
  %".94" = sitofp i32 99 to double
  %".95" = sitofp i32 2 to double
  %".96" = call double @"llvm.pow.f64"(double %".94", double %".95")
  %".97" = sitofp i32 28 to double
  %".98" = fdiv double %".97", %".96"
  %".99" = sitofp i32 6 to double
  %".100" = fadd double %".98", %".99"
  %".101" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".102" = call i32 (i8*, ...) @"printf"(i8* %".101", double %".100")
  %".103" = sitofp i32 5 to double
  %".104" = sitofp i32 5 to double
  %".105" = call double @"llvm.pow.f64"(double %".103", double %".104")
  %".106" = sitofp i32 2 to double
  %".107" = fadd double %".105", %".106"
  %".108" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".109" = call i32 (i8*, ...) @"printf"(i8* %".108", double %".107")
  %".110" = sitofp i32 78 to double
  %".111" = sitofp i32 25 to double
  %".112" = call double @"llvm.pow.f64"(double %".110", double %".111")
  %".113" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".114" = call i32 (i8*, ...) @"printf"(i8* %".113", double %".112")
  %".115" = sitofp i32 125 to double
  %".116" = sitofp i32 5 to double
  %".117" = call double @"llvm.pow.f64"(double %".115", double %".116")
  %".118" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".119" = call i32 (i8*, ...) @"printf"(i8* %".118", double %".117")
  %".120" = sitofp i32 83 to double
  %".121" = sitofp i32 555 to double
  %".122" = call double @"llvm.pow.f64"(double %".120", double %".121")
  %".123" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".124" = call i32 (i8*, ...) @"printf"(i8* %".123", double %".122")
  %".125" = sitofp i32 78 to double
  %".126" = sitofp i32 2 to double
  %".127" = call double @"llvm.pow.f64"(double %".125", double %".126")
  %".128" = sitofp i32 5 to double
  %".129" = fadd double %".127", %".128"
  %".130" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".131" = call i32 (i8*, ...) @"printf"(i8* %".130", double %".129")
  %"div" = alloca double
  %".132" = sitofp i32 100 to double
  %".133" = sitofp i32 5 to double
  %".134" = fdiv double %".132", %".133"
  store double %".134", double* %"div"
  %"div.1" = load double, double* %"div"
  %".136" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".137" = call i32 (i8*, ...) @"printf"(i8* %".136", double %"div.1")
  %".138" = mul i32 3, 5
  %".139" = add i32 %".138", 2
  %".140" = sub i32 %".139", 88
  %".141" = sitofp i32 250 to double
  %".142" = sitofp i32 2 to double
  %".143" = fdiv double %".141", %".142"
  %".144" = sitofp i32 %".140" to double
  %".145" = fadd double %".144", %".143"
  %".146" = mul i32 789, 2
  %".147" = sitofp i32 %".146" to double
  %".148" = fadd double %".145", %".147"
  %".149" = mul i32 56, 2
  %".150" = sitofp i32 %".149" to double
  %".151" = fadd double %".148", %".150"
  %".152" = sitofp i32 300 to double
  %".153" = fadd double %".151", %".152"
  %".154" = sitofp i32 7896 to double
  %".155" = fsub double %".153", %".154"
  %".156" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".157" = call i32 (i8*, ...) @"printf"(i8* %".156", double %".155")
  %".158" = sitofp i32 23 to double
  %".159" = sitofp i32 23 to double
  %".160" = call double @"llvm.pow.f64"(double %".158", double %".159")
  %".161" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".162" = call i32 (i8*, ...) @"printf"(i8* %".161", double %".160")
  %"var" = alloca i32
  store i32 5, i32* %"var"
  %"saludo" = alloca i8*
  %".164" = bitcast [12 x i8]* @"str.7099313127551586642" to i8*
  store i8* %".164", i8** %"saludo"
  %"saludo.1" = load i8*, i8** %"saludo"
  %".166" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".167" = call i32 (i8*, ...) @"printf"(i8* %".166", i8* %"saludo.1")
  %"t" = alloca double
  %".168" = sitofp i32 88 to double
  %".169" = sitofp i32 6 to double
  %".170" = call double @"llvm.pow.f64"(double %".168", double %".169")
  %".171" = mul i32 250, 2
  %".172" = sitofp i32 %".171" to double
  %".173" = fadd double %".170", %".172"
  store double %".173", double* %"t"
  %"t.1" = load double, double* %"t"
  %".175" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".176" = call i32 (i8*, ...) @"printf"(i8* %".175", double %"t.1")
  %"t.2" = load double, double* %"t"
  %".177" = sitofp i32 10 to double
  %".178" = fsub double %"t.2", %".177"
  store double %".178", double* %"t"
  %"var.1" = load i32, i32* %"var"
  %".180" = sitofp i32 250 to double
  %".181" = sitofp i32 2 to double
  %".182" = call double @"llvm.pow.f64"(double %".180", double %".181")
  %".183" = sitofp i32 %"var.1" to double
  %".184" = fadd double %".183", %".182"
  %".185" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".186" = call i32 (i8*, ...) @"printf"(i8* %".185", double %".184")
  %"var.2" = load i32, i32* %"var"
  %".187" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".188" = call i32 (i8*, ...) @"printf"(i8* %".187", i32 %"var.2")
  store i32 2, i32* %"var"
  %"var.3" = load i32, i32* %"var"
  %".190" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".191" = call i32 (i8*, ...) @"printf"(i8* %".190", i32 %"var.3")
  %"p" = alloca i32
  store i32 10, i32* %"p"
  br label %"while.cond"
while.cond:
  %"p.1" = load i32, i32* %"p"
  %".194" = icmp sge i32 %"p.1", 0
  br i1 %".194", label %"while.body", label %"while.end"
while.body:
  %".196" = bitcast [5 x i8]* @"str.-7668869861663883741" to i8*
  %".197" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".198" = call i32 (i8*, ...) @"printf"(i8* %".197", i8* %".196")
  %"p.2" = load i32, i32* %"p"
  %".199" = sub i32 %"p.2", 1
  store i32 %".199", i32* %"p"
  br label %"while.cond"
while.end:
  %"var.4" = load i32, i32* %"var"
  %".202" = sitofp i32 2 to double
  %".203" = sitofp i32 %"var.4" to double
  %".204" = call double @"llvm.pow.f64"(double %".202", double %".203")
  %".205" = sitofp i32 200 to double
  %".206" = sitofp i32 2 to double
  %".207" = call double @"llvm.pow.f64"(double %".205", double %".206")
  %".208" = sitofp i32 55 to double
  %".209" = fmul double %".208", %".207"
  %".210" = mul i32 58, 2
  %".211" = sitofp i32 %".210" to double
  %".212" = fadd double %".209", %".211"
  %".213" = fadd double %".204", %".212"
  %".214" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".215" = call i32 (i8*, ...) @"printf"(i8* %".214", double %".213")
  %".216" = sitofp i32 6 to double
  %".217" = sitofp i32 6 to double
  %".218" = call double @"llvm.pow.f64"(double %".216", double %".217")
  %".219" = sitofp i32 2 to double
  %".220" = fadd double %".218", %".219"
  %".221" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".222" = call i32 (i8*, ...) @"printf"(i8* %".221", double %".220")
  %"x" = alloca i32
  store i32 10, i32* %"x"
  %"variable" = alloca i32
  store i32 10, i32* %"variable"
  %"variable.1" = load i32, i32* %"variable"
  %".225" = sitofp i32 100 to double
  %".226" = sitofp i32 %"variable.1" to double
  %".227" = call double @"llvm.pow.f64"(double %".225", double %".226")
  %".228" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".229" = call i32 (i8*, ...) @"printf"(i8* %".228", double %".227")
  %"variable.2" = load i32, i32* %"variable"
  %".230" = sitofp i32 55 to double
  %".231" = sitofp i32 %"variable.2" to double
  %".232" = call double @"llvm.pow.f64"(double %".230", double %".231")
  %".233" = sitofp i32 300 to double
  %".234" = fadd double %".232", %".233"
  %".235" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".236" = call i32 (i8*, ...) @"printf"(i8* %".235", double %".234")
  %"variable.3" = load i32, i32* %"variable"
  %".237" = mul i32 300, 55
  %".238" = add i32 %"variable.3", %".237"
  %".239" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".240" = call i32 (i8*, ...) @"printf"(i8* %".239", i32 %".238")
  %".241" = add i32 3, 5
  %".242" = mul i32 25, %".241"
  %".243" = sub i32 5, %".242"
  %".244" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".245" = call i32 (i8*, ...) @"printf"(i8* %".244", i32 %".243")
  %"k" = alloca i32
  store i32 0, i32* %"k"
  br label %"for.cond.1"
for.cond.1:
  %"k.1" = load i32, i32* %"k"
  %".248" = icmp sle i32 %"k.1", 10
  br i1 %".248", label %"for.body.1", label %"for.exit.1"
for.body.1:
  %".250" = add i32 3, 5
  %".251" = mul i32 25, %".250"
  %".252" = sub i32 5, %".251"
  %".253" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".254" = call i32 (i8*, ...) @"printf"(i8* %".253", i32 %".252")
  br label %"for.inc.1"
for.inc.1:
  %"k.2" = load i32, i32* %"k"
  %"k.3" = load i32, i32* %"k"
  %".256" = add i32 %"k.3", 1
  store i32 %".256", i32* %"k"
  br label %"for.cond.1"
for.exit.1:
  %"z" = alloca double
  %".259" = sitofp i32 5 to double
  %".260" = sitofp i32 100 to double
  %".261" = call double @"llvm.pow.f64"(double %".259", double %".260")
  store double %".261", double* %"z"
  %"z.1" = load double, double* %"z"
  %".263" = sitofp i32 1 to double
  %".264" = fsub double %"z.1", %".263"
  %".265" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".266" = call i32 (i8*, ...) @"printf"(i8* %".265", double %".264")
  %"resultadoF" = alloca i32
  %".267" = call i32 @"fibonacci"(i32 50)
  store i32 %".267", i32* %"resultadoF"
  %"resultadoF.1" = load i32, i32* %"resultadoF"
  %".269" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".270" = call i32 (i8*, ...) @"printf"(i8* %".269", i32 %"resultadoF.1")
  %".271" = mul i32 18, 2
  %".272" = mul i32 5, 10
  %".273" = sitofp i32 %".272" to double
  %".274" = sitofp i32 8 to double
  %".275" = fdiv double %".273", %".274"
  %".276" = sitofp i32 %".271" to double
  %".277" = fadd double %".276", %".275"
  %".278" = mul i32 5, 2
  %".279" = sitofp i32 %".278" to double
  %".280" = fadd double %".277", %".279"
  %".281" = sitofp i32 800000 to double
  %".282" = fadd double %".280", %".281"
  %".283" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".284" = call i32 (i8*, ...) @"printf"(i8* %".283", double %".282")
  %".285" = mul i32 88, 88
  %".286" = mul i32 %".285", 88
  %".287" = mul i32 %".286", 88
  %".288" = mul i32 %".287", 88
  %".289" = mul i32 %".288", 5
  %".290" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".291" = call i32 (i8*, ...) @"printf"(i8* %".290", i32 %".289")
  %".292" = sitofp i32 42 to double
  %".293" = sitofp i32 5 to double
  %".294" = call double @"llvm.pow.f64"(double %".292", double %".293")
  %".295" = sitofp i32 2 to double
  %".296" = fdiv double %".294", %".295"
  %".297" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297", double %".296")
  %".299" = sitofp i32 2 to double
  %".300" = sitofp i32 9 to double
  %".301" = call double @"llvm.pow.f64"(double %".299", double %".300")
  %".302" = sitofp i32 78 to double
  %".303" = fdiv double %".302", %".301"
  %".304" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".305" = call i32 (i8*, ...) @"printf"(i8* %".304", double %".303")
  %".306" = sitofp i32 99 to double
  %".307" = sitofp i32 2 to double
  %".308" = call double @"llvm.pow.f64"(double %".306", double %".307")
  %".309" = sitofp i32 28 to double
  %".310" = fdiv double %".309", %".308"
  %".311" = sitofp i32 6 to double
  %".312" = fadd double %".310", %".311"
  %".313" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".314" = call i32 (i8*, ...) @"printf"(i8* %".313", double %".312")
  %".315" = sitofp i32 5 to double
  %".316" = sitofp i32 5 to double
  %".317" = call double @"llvm.pow.f64"(double %".315", double %".316")
  %".318" = sitofp i32 2 to double
  %".319" = fadd double %".317", %".318"
  %".320" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".321" = call i32 (i8*, ...) @"printf"(i8* %".320", double %".319")
  %".322" = sitofp i32 78 to double
  %".323" = sitofp i32 25 to double
  %".324" = call double @"llvm.pow.f64"(double %".322", double %".323")
  %".325" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".326" = call i32 (i8*, ...) @"printf"(i8* %".325", double %".324")
  %".327" = sitofp i32 125 to double
  %".328" = sitofp i32 5 to double
  %".329" = call double @"llvm.pow.f64"(double %".327", double %".328")
  %".330" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".331" = call i32 (i8*, ...) @"printf"(i8* %".330", double %".329")
  %".332" = sitofp i32 83 to double
  %".333" = sitofp i32 555 to double
  %".334" = call double @"llvm.pow.f64"(double %".332", double %".333")
  %".335" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".336" = call i32 (i8*, ...) @"printf"(i8* %".335", double %".334")
  %".337" = sitofp i32 78 to double
  %".338" = sitofp i32 2 to double
  %".339" = call double @"llvm.pow.f64"(double %".337", double %".338")
  %".340" = sitofp i32 5 to double
  %".341" = fadd double %".339", %".340"
  %".342" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".343" = call i32 (i8*, ...) @"printf"(i8* %".342", double %".341")
  %".344" = mul i32 2, 5
  %".345" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".346" = call i32 (i8*, ...) @"printf"(i8* %".345", i32 %".344")
  %"x.1" = load i32, i32* %"x"
  %".347" = mul i32 %"x.1", 4
  %".348" = add i32 2, %".347"
  %".349" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".350" = call i32 (i8*, ...) @"printf"(i8* %".349", i32 %".348")
  %".351" = add i32 2, 3
  %".352" = mul i32 %".351", 4
  %".353" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".354" = call i32 (i8*, ...) @"printf"(i8* %".353", i32 %".352")
  %".355" = sitofp i32 10 to double
  %".356" = sitofp i32 2 to double
  %".357" = fdiv double %".355", %".356"
  %".358" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".359" = call i32 (i8*, ...) @"printf"(i8* %".358", double %".357")
  %".360" = sitofp i32 2 to double
  %".361" = sitofp i32 3 to double
  %".362" = call double @"llvm.pow.f64"(double %".360", double %".361")
  %".363" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".364" = call i32 (i8*, ...) @"printf"(i8* %".363", double %".362")
  %".365" = sitofp i32 3 to double
  %".366" = sitofp i32 2 to double
  %".367" = call double @"llvm.pow.f64"(double %".365", double %".366")
  %".368" = sitofp i32 2 to double
  %".369" = call double @"llvm.pow.f64"(double %".368", double %".367")
  %".370" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".371" = call i32 (i8*, ...) @"printf"(i8* %".370", double %".369")
  %".372" = mul i32 3, 2
  %".373" = add i32 5, %".372"
  %".374" = sitofp i32 4 to double
  %".375" = sitofp i32 2 to double
  %".376" = fdiv double %".374", %".375"
  %".377" = sitofp i32 %".373" to double
  %".378" = fsub double %".377", %".376"
  %".379" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".380" = call i32 (i8*, ...) @"printf"(i8* %".379", double %".378")
  %".381" = add i32 3, 4
  %".382" = sitofp i32 2 to double
  %".383" = sitofp i32 3 to double
  %".384" = call double @"llvm.pow.f64"(double %".382", double %".383")
  %".385" = sitofp i32 %".381" to double
  %".386" = fmul double %".385", %".384"
  %".387" = sitofp i32 10 to double
  %".388" = sitofp i32 2 to double
  %".389" = fdiv double %".387", %".388"
  %".390" = fsub double %".386", %".389"
  %".391" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".392" = call i32 (i8*, ...) @"printf"(i8* %".391", double %".390")
  %".393" = sitofp i32 5 to double
  %".394" = sitofp i32 2 to double
  %".395" = fdiv double %".393", %".394"
  %".396" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".397" = call i32 (i8*, ...) @"printf"(i8* %".396", double %".395")
  %".398" = sub i32 0, 2
  %".399" = mul i32 4, %".398"
  %".400" = add i32 2, %".399"
  %".401" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".402" = call i32 (i8*, ...) @"printf"(i8* %".401", i32 %".400")
  %"j" = alloca i32
  store i32 0, i32* %"j"
  br label %"for.cond.2"
for.cond.2:
  %"j.1" = load i32, i32* %"j"
  %".405" = icmp slt i32 %"j.1", 10
  br i1 %".405", label %"for.body.2", label %"for.exit.2"
for.body.2:
  %"j.2" = load i32, i32* %"j"
  %".407" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".408" = call i32 (i8*, ...) @"printf"(i8* %".407", i32 %"j.2")
  %"j.3" = load i32, i32* %"j"
  %".409" = sitofp i32 2 to double
  %".410" = sitofp i32 %"j.3" to double
  %".411" = call double @"llvm.pow.f64"(double %".409", double %".410")
  %".412" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".413" = call i32 (i8*, ...) @"printf"(i8* %".412", double %".411")
  br label %"for.inc.2"
for.inc.2:
  %"j.4" = load i32, i32* %"j"
  %"j.5" = load i32, i32* %"j"
  %".415" = add i32 %"j.5", 1
  store i32 %".415", i32* %"j"
  br label %"for.cond.2"
for.exit.2:
  %"juan" = alloca i8*
  %".418" = bitcast [4 x i8]* @"str.8271418719002564090" to i8*
  store i8* %".418", i8** %"juan"
  %"juan.1" = load i8*, i8** %"juan"
  %".420" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".421" = call i32 (i8*, ...) @"printf"(i8* %".420", i8* %"juan.1")
  %".422" = bitcast [11 x i8]* @"str.-3636893698882659382" to i8*
  %".423" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".424" = call i32 (i8*, ...) @"printf"(i8* %".423", i8* %".422")
  %".425" = call i32 @"suma"()
  %".426" = bitcast [73 x i8]* @"str.8051997403959528221" to i8*
  %".427" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".428" = call i32 (i8*, ...) @"printf"(i8* %".427", i8* %".426")
  %"a" = alloca i32
  store i32 10, i32* %"a"
  %"b" = alloca i32
  %"a.1" = load i32, i32* %"a"
  %".430" = call i32 @"doble"(i32 %"a.1")
  store i32 %".430", i32* %"b"
  %"b.1" = load i32, i32* %"b"
  %".432" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".433" = call i32 (i8*, ...) @"printf"(i8* %".432", i32 %"b.1")
  %".434" = bitcast [19 x i8]* @"str.-2942038614238143277" to i8*
  %".435" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".436" = call i32 (i8*, ...) @"printf"(i8* %".435", i8* %".434")
  %".437" = call i32 @"funcionB"(i32 5)
  %".438" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".439" = call i32 (i8*, ...) @"printf"(i8* %".438", i32 %".437")
  %".440" = bitcast [2 x i8]* @"str.1459553535582526388" to i8*
  %".441" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".442" = call i32 (i8*, ...) @"printf"(i8* %".441", i8* %".440")
  %"y" = alloca double
  store double 0x4039000000000000, double* %"y"
  %"x.2" = load i32, i32* %"x"
  %".444" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".445" = call i32 (i8*, ...) @"printf"(i8* %".444", i32 %"x.2")
  %"y.1" = load double, double* %"y"
  %".446" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".447" = call i32 (i8*, ...) @"printf"(i8* %".446", double %"y.1")
  %".448" = bitcast [24 x i8]* @"str.-2024933119051681849" to i8*
  %".449" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".450" = call i32 (i8*, ...) @"printf"(i8* %".449", i8* %".448")
  %".451" = add i32 7, 2
  %".452" = sitofp i32 3 to double
  %".453" = sitofp i32 12 to double
  %".454" = call double @"llvm.pow.f64"(double %".452", double %".453")
  %".455" = sitofp i32 %".451" to double
  %".456" = fadd double %".455", %".454"
  %".457" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".458" = call i32 (i8*, ...) @"printf"(i8* %".457", double %".456")
  %".459" = sitofp i32 2 to double
  %".460" = sitofp i32 5 to double
  %".461" = call double @"llvm.pow.f64"(double %".459", double %".460")
  %".462" = sitofp i32 5 to double
  %".463" = sitofp i32 2 to double
  %".464" = call double @"llvm.pow.f64"(double %".462", double %".463")
  %".465" = fmul double %".461", %".464"
  %".466" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".467" = call i32 (i8*, ...) @"printf"(i8* %".466", double %".465")
  %".468" = sitofp i32 5 to double
  %".469" = sitofp i32 25 to double
  %".470" = call double @"llvm.pow.f64"(double %".468", double %".469")
  %".471" = sitofp i32 5 to double
  %".472" = fmul double %".471", %".470"
  %".473" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".474" = call i32 (i8*, ...) @"printf"(i8* %".473", double %".472")
  %".475" = mul i32 2, 23
  %".476" = sub i32 %".475", 23
  %".477" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".478" = call i32 (i8*, ...) @"printf"(i8* %".477", i32 %".476")
  %"x.3" = load i32, i32* %"x"
  %".479" = sitofp i32 30 to double
  %".480" = sitofp i32 %"x.3" to double
  %".481" = call double @"llvm.pow.f64"(double %".479", double %".480")
  %".482" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".483" = call i32 (i8*, ...) @"printf"(i8* %".482", double %".481")
  %".484" = mul i32 2, 2
  %".485" = mul i32 %".484", 2
  %".486" = sitofp i32 %".485" to double
  %".487" = sitofp i32 2 to double
  %".488" = fdiv double %".486", %".487"
  %".489" = mul i32 2, 2
  %".490" = sitofp i32 %".489" to double
  %".491" = fadd double %".488", %".490"
  %".492" = mul i32 2, 2
  %".493" = sitofp i32 %".492" to double
  %".494" = fadd double %".491", %".493"
  %".495" = mul i32 2, 2
  %".496" = sitofp i32 %".495" to double
  %".497" = fadd double %".494", %".496"
  %".498" = mul i32 2, 2
  %".499" = sitofp i32 %".498" to double
  %".500" = fadd double %".497", %".499"
  %".501" = mul i32 2, 2
  %".502" = sitofp i32 %".501" to double
  %".503" = fadd double %".500", %".502"
  %".504" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".505" = call i32 (i8*, ...) @"printf"(i8* %".504", double %".503")
  %"x.4" = load i32, i32* %"x"
  %"x.5" = load i32, i32* %"x"
  %".506" = sitofp i32 %"x.4" to double
  %".507" = sitofp i32 %"x.5" to double
  %".508" = call double @"llvm.pow.f64"(double %".506", double %".507")
  %".509" = mul i32 2, 5
  %".510" = sitofp i32 %".509" to double
  %".511" = fadd double %".508", %".510"
  %".512" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".513" = call i32 (i8*, ...) @"printf"(i8* %".512", double %".511")
  %"x.6" = load i32, i32* %"x"
  %".514" = icmp sgt i32 %"x.6", 15
  br i1 %".514", label %"then", label %"else"
then:
  %".516" = bitcast [7 x i8]* @"str.-7370349512111764288" to i8*
  %".517" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".518" = call i32 (i8*, ...) @"printf"(i8* %".517", i8* %".516")
  br label %"ifcont"
else:
  %".520" = bitcast [11 x i8]* @"str.-5818741745685491019" to i8*
  %".521" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".522" = call i32 (i8*, ...) @"printf"(i8* %".521", i8* %".520")
  br label %"ifcont"
ifcont:
  %".524" = mul i32 18, 2
  %".525" = mul i32 5, 10
  %".526" = sitofp i32 %".525" to double
  %".527" = sitofp i32 8 to double
  %".528" = fdiv double %".526", %".527"
  %".529" = sitofp i32 %".524" to double
  %".530" = fadd double %".529", %".528"
  %".531" = mul i32 5, 2
  %".532" = sitofp i32 %".531" to double
  %".533" = fadd double %".530", %".532"
  %".534" = sitofp i32 800000 to double
  %".535" = fadd double %".533", %".534"
  %".536" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".537" = call i32 (i8*, ...) @"printf"(i8* %".536", double %".535")
  %".538" = mul i32 88, 88
  %".539" = mul i32 %".538", 88
  %".540" = mul i32 %".539", 88
  %".541" = mul i32 %".540", 88
  %".542" = mul i32 %".541", 5
  %".543" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".544" = call i32 (i8*, ...) @"printf"(i8* %".543", i32 %".542")
  %".545" = sitofp i32 42 to double
  %".546" = sitofp i32 5 to double
  %".547" = call double @"llvm.pow.f64"(double %".545", double %".546")
  %".548" = sitofp i32 2 to double
  %".549" = fdiv double %".547", %".548"
  %".550" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".551" = call i32 (i8*, ...) @"printf"(i8* %".550", double %".549")
  %".552" = sitofp i32 2 to double
  %".553" = sitofp i32 9 to double
  %".554" = call double @"llvm.pow.f64"(double %".552", double %".553")
  %".555" = sitofp i32 78 to double
  %".556" = fdiv double %".555", %".554"
  %".557" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".558" = call i32 (i8*, ...) @"printf"(i8* %".557", double %".556")
  %".559" = sitofp i32 99 to double
  %".560" = sitofp i32 2 to double
  %".561" = call double @"llvm.pow.f64"(double %".559", double %".560")
  %".562" = sitofp i32 28 to double
  %".563" = fdiv double %".562", %".561"
  %".564" = sitofp i32 6 to double
  %".565" = fadd double %".563", %".564"
  %".566" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".567" = call i32 (i8*, ...) @"printf"(i8* %".566", double %".565")
  %".568" = sitofp i32 5 to double
  %".569" = sitofp i32 5 to double
  %".570" = call double @"llvm.pow.f64"(double %".568", double %".569")
  %".571" = sitofp i32 2 to double
  %".572" = fadd double %".570", %".571"
  %".573" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".574" = call i32 (i8*, ...) @"printf"(i8* %".573", double %".572")
  %".575" = sitofp i32 78 to double
  %".576" = sitofp i32 25 to double
  %".577" = call double @"llvm.pow.f64"(double %".575", double %".576")
  %".578" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".579" = call i32 (i8*, ...) @"printf"(i8* %".578", double %".577")
  %".580" = sitofp i32 125 to double
  %".581" = sitofp i32 5 to double
  %".582" = call double @"llvm.pow.f64"(double %".580", double %".581")
  %".583" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".584" = call i32 (i8*, ...) @"printf"(i8* %".583", double %".582")
  %".585" = sitofp i32 83 to double
  %".586" = sitofp i32 555 to double
  %".587" = call double @"llvm.pow.f64"(double %".585", double %".586")
  %".588" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".589" = call i32 (i8*, ...) @"printf"(i8* %".588", double %".587")
  %".590" = sitofp i32 78 to double
  %".591" = sitofp i32 2 to double
  %".592" = call double @"llvm.pow.f64"(double %".590", double %".591")
  %".593" = sitofp i32 5 to double
  %".594" = fadd double %".592", %".593"
  %".595" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".596" = call i32 (i8*, ...) @"printf"(i8* %".595", double %".594")
  br label %"while.cond.1"
while.cond.1:
  %"x.7" = load i32, i32* %"x"
  %".598" = icmp sgt i32 %"x.7", 0
  br i1 %".598", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"x.8" = load i32, i32* %"x"
  %".600" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".601" = call i32 (i8*, ...) @"printf"(i8* %".600", i32 %"x.8")
  %"x.9" = load i32, i32* %"x"
  %".602" = sub i32 %"x.9", 1
  store i32 %".602", i32* %"x"
  br label %"while.cond.1"
while.end.1:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"for.cond.3"
for.cond.3:
  %"i.1" = load i32, i32* %"i"
  %".607" = icmp sle i32 %"i.1", 100
  br i1 %".607", label %"for.body.3", label %"for.exit.3"
for.body.3:
  %"i.2" = load i32, i32* %"i"
  %".609" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".610" = call i32 (i8*, ...) @"printf"(i8* %".609", i32 %"i.2")
  br label %"for.inc.3"
for.inc.3:
  %"i.3" = load i32, i32* %"i"
  %"i.4" = load i32, i32* %"i"
  %".612" = add i32 %"i.4", 1
  store i32 %".612", i32* %"i"
  br label %"for.cond.3"
for.exit.3:
  %".615" = call i32 @"contarHasta"(i32 5)
  %".616" = call i32 @"potencia"(i32 2, i32 3)
  %".617" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".618" = call i32 (i8*, ...) @"printf"(i8* %".617", i32 %".616")
  %".619" = call i32 @"sumar"(i32 5, i32 7)
  %".620" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".621" = call i32 (i8*, ...) @"printf"(i8* %".620", i32 %".619")
  %"resultado" = alloca i32
  %".622" = call i32 @"sumaHasta"(i32 5)
  store i32 %".622", i32* %"resultado"
  %"resultado.1" = load i32, i32* %"resultado"
  %".624" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".625" = call i32 (i8*, ...) @"printf"(i8* %".624", i32 %"resultado.1")
  %".626" = mul i32 18, 2
  %".627" = mul i32 5, 10
  %".628" = sitofp i32 %".627" to double
  %".629" = sitofp i32 8 to double
  %".630" = fdiv double %".628", %".629"
  %".631" = sitofp i32 %".626" to double
  %".632" = fadd double %".631", %".630"
  %".633" = mul i32 5, 2
  %".634" = sitofp i32 %".633" to double
  %".635" = fadd double %".632", %".634"
  %".636" = sitofp i32 800000 to double
  %".637" = fadd double %".635", %".636"
  %".638" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".639" = call i32 (i8*, ...) @"printf"(i8* %".638", double %".637")
  %".640" = mul i32 88, 88
  %".641" = mul i32 %".640", 88
  %".642" = mul i32 %".641", 88
  %".643" = mul i32 %".642", 88
  %".644" = mul i32 %".643", 5
  %".645" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".646" = call i32 (i8*, ...) @"printf"(i8* %".645", i32 %".644")
  %".647" = sitofp i32 42 to double
  %".648" = sitofp i32 5 to double
  %".649" = call double @"llvm.pow.f64"(double %".647", double %".648")
  %".650" = sitofp i32 2 to double
  %".651" = fdiv double %".649", %".650"
  %".652" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".653" = call i32 (i8*, ...) @"printf"(i8* %".652", double %".651")
  %".654" = sitofp i32 2 to double
  %".655" = sitofp i32 9 to double
  %".656" = call double @"llvm.pow.f64"(double %".654", double %".655")
  %".657" = sitofp i32 78 to double
  %".658" = fdiv double %".657", %".656"
  %".659" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".660" = call i32 (i8*, ...) @"printf"(i8* %".659", double %".658")
  %".661" = sitofp i32 99 to double
  %".662" = sitofp i32 2 to double
  %".663" = call double @"llvm.pow.f64"(double %".661", double %".662")
  %".664" = sitofp i32 28 to double
  %".665" = fdiv double %".664", %".663"
  %".666" = sitofp i32 6 to double
  %".667" = fadd double %".665", %".666"
  %".668" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".669" = call i32 (i8*, ...) @"printf"(i8* %".668", double %".667")
  %".670" = sitofp i32 5 to double
  %".671" = sitofp i32 5 to double
  %".672" = call double @"llvm.pow.f64"(double %".670", double %".671")
  %".673" = sitofp i32 2 to double
  %".674" = fadd double %".672", %".673"
  %".675" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".676" = call i32 (i8*, ...) @"printf"(i8* %".675", double %".674")
  %".677" = sitofp i32 78 to double
  %".678" = sitofp i32 25 to double
  %".679" = call double @"llvm.pow.f64"(double %".677", double %".678")
  %".680" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".681" = call i32 (i8*, ...) @"printf"(i8* %".680", double %".679")
  %".682" = sitofp i32 125 to double
  %".683" = sitofp i32 5 to double
  %".684" = call double @"llvm.pow.f64"(double %".682", double %".683")
  %".685" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".686" = call i32 (i8*, ...) @"printf"(i8* %".685", double %".684")
  %".687" = sitofp i32 83 to double
  %".688" = sitofp i32 555 to double
  %".689" = call double @"llvm.pow.f64"(double %".687", double %".688")
  %".690" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".691" = call i32 (i8*, ...) @"printf"(i8* %".690", double %".689")
  %".692" = sitofp i32 78 to double
  %".693" = sitofp i32 2 to double
  %".694" = call double @"llvm.pow.f64"(double %".692", double %".693")
  %".695" = sitofp i32 5 to double
  %".696" = fadd double %".694", %".695"
  %".697" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".698" = call i32 (i8*, ...) @"printf"(i8* %".697", double %".696")
  %".699" = mul i32 2, 5
  %".700" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".701" = call i32 (i8*, ...) @"printf"(i8* %".700", i32 %".699")
  %"x.10" = load i32, i32* %"x"
  %".702" = mul i32 %"x.10", 4
  %".703" = add i32 2, %".702"
  %".704" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".705" = call i32 (i8*, ...) @"printf"(i8* %".704", i32 %".703")
  %".706" = add i32 2, 3
  %".707" = mul i32 %".706", 4
  %".708" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".709" = call i32 (i8*, ...) @"printf"(i8* %".708", i32 %".707")
  %".710" = sitofp i32 10 to double
  %".711" = sitofp i32 2 to double
  %".712" = fdiv double %".710", %".711"
  %".713" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".714" = call i32 (i8*, ...) @"printf"(i8* %".713", double %".712")
  %".715" = sitofp i32 2 to double
  %".716" = sitofp i32 3 to double
  %".717" = call double @"llvm.pow.f64"(double %".715", double %".716")
  %".718" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".719" = call i32 (i8*, ...) @"printf"(i8* %".718", double %".717")
  %".720" = sitofp i32 3 to double
  %".721" = sitofp i32 2 to double
  %".722" = call double @"llvm.pow.f64"(double %".720", double %".721")
  %".723" = sitofp i32 2 to double
  %".724" = call double @"llvm.pow.f64"(double %".723", double %".722")
  %".725" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".726" = call i32 (i8*, ...) @"printf"(i8* %".725", double %".724")
  %".727" = mul i32 3, 2
  %".728" = add i32 5, %".727"
  %".729" = sitofp i32 4 to double
  %".730" = sitofp i32 2 to double
  %".731" = fdiv double %".729", %".730"
  %".732" = sitofp i32 %".728" to double
  %".733" = fsub double %".732", %".731"
  %".734" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".735" = call i32 (i8*, ...) @"printf"(i8* %".734", double %".733")
  %".736" = add i32 3, 4
  %".737" = sitofp i32 2 to double
  %".738" = sitofp i32 3 to double
  %".739" = call double @"llvm.pow.f64"(double %".737", double %".738")
  %".740" = sitofp i32 %".736" to double
  %".741" = fmul double %".740", %".739"
  %".742" = sitofp i32 10 to double
  %".743" = sitofp i32 2 to double
  %".744" = fdiv double %".742", %".743"
  %".745" = fsub double %".741", %".744"
  %".746" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".747" = call i32 (i8*, ...) @"printf"(i8* %".746", double %".745")
  %".748" = sitofp i32 5 to double
  %".749" = sitofp i32 2 to double
  %".750" = fdiv double %".748", %".749"
  %".751" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".752" = call i32 (i8*, ...) @"printf"(i8* %".751", double %".750")
  %".753" = sub i32 0, 2
  %".754" = mul i32 4, %".753"
  %".755" = add i32 2, %".754"
  %".756" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".757" = call i32 (i8*, ...) @"printf"(i8* %".756", i32 %".755")
  %".758" = mul i32 18, 2
  %".759" = mul i32 5, 10
  %".760" = sitofp i32 %".759" to double
  %".761" = sitofp i32 8 to double
  %".762" = fdiv double %".760", %".761"
  %".763" = sitofp i32 %".758" to double
  %".764" = fadd double %".763", %".762"
  %".765" = mul i32 5, 2
  %".766" = sitofp i32 %".765" to double
  %".767" = fadd double %".764", %".766"
  %".768" = sitofp i32 800000 to double
  %".769" = fadd double %".767", %".768"
  %".770" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".771" = call i32 (i8*, ...) @"printf"(i8* %".770", double %".769")
  %".772" = mul i32 88, 88
  %".773" = mul i32 %".772", 88
  %".774" = mul i32 %".773", 88
  %".775" = mul i32 %".774", 88
  %".776" = mul i32 %".775", 5
  %".777" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".778" = call i32 (i8*, ...) @"printf"(i8* %".777", i32 %".776")
  %".779" = sitofp i32 42 to double
  %".780" = sitofp i32 5 to double
  %".781" = call double @"llvm.pow.f64"(double %".779", double %".780")
  %".782" = sitofp i32 2 to double
  %".783" = fdiv double %".781", %".782"
  %".784" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".785" = call i32 (i8*, ...) @"printf"(i8* %".784", double %".783")
  %".786" = sitofp i32 2 to double
  %".787" = sitofp i32 9 to double
  %".788" = call double @"llvm.pow.f64"(double %".786", double %".787")
  %".789" = sitofp i32 78 to double
  %".790" = fdiv double %".789", %".788"
  %".791" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".792" = call i32 (i8*, ...) @"printf"(i8* %".791", double %".790")
  %".793" = sitofp i32 99 to double
  %".794" = sitofp i32 2 to double
  %".795" = call double @"llvm.pow.f64"(double %".793", double %".794")
  %".796" = sitofp i32 28 to double
  %".797" = fdiv double %".796", %".795"
  %".798" = sitofp i32 6 to double
  %".799" = fadd double %".797", %".798"
  %".800" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".801" = call i32 (i8*, ...) @"printf"(i8* %".800", double %".799")
  %".802" = sitofp i32 5 to double
  %".803" = sitofp i32 5 to double
  %".804" = call double @"llvm.pow.f64"(double %".802", double %".803")
  %".805" = sitofp i32 2 to double
  %".806" = fadd double %".804", %".805"
  %".807" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".808" = call i32 (i8*, ...) @"printf"(i8* %".807", double %".806")
  %".809" = sitofp i32 78 to double
  %".810" = sitofp i32 25 to double
  %".811" = call double @"llvm.pow.f64"(double %".809", double %".810")
  %".812" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".813" = call i32 (i8*, ...) @"printf"(i8* %".812", double %".811")
  %".814" = sitofp i32 125 to double
  %".815" = sitofp i32 5 to double
  %".816" = call double @"llvm.pow.f64"(double %".814", double %".815")
  %".817" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".818" = call i32 (i8*, ...) @"printf"(i8* %".817", double %".816")
  %".819" = sitofp i32 83 to double
  %".820" = sitofp i32 555 to double
  %".821" = call double @"llvm.pow.f64"(double %".819", double %".820")
  %".822" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".823" = call i32 (i8*, ...) @"printf"(i8* %".822", double %".821")
  %".824" = sitofp i32 78 to double
  %".825" = sitofp i32 2 to double
  %".826" = call double @"llvm.pow.f64"(double %".824", double %".825")
  %".827" = sitofp i32 5 to double
  %".828" = fadd double %".826", %".827"
  %".829" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".830" = call i32 (i8*, ...) @"printf"(i8* %".829", double %".828")
  ret i32 0
}

@"str.-6927658657090574447" = internal constant [21 x i8] c"aaaaaaaaaaaaaaaaaaaa\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
declare double @"llvm.pow.f64"(double %".1", double %".2")

@"fmt_float" = internal constant [4 x i8] c"%f\0a\00"
@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"
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