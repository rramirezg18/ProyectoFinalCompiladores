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
  %".2" = bitcast [21 x i8]* @"str.4872056056157938008" to i8*
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
  %".164" = bitcast [12 x i8]* @"str.5192677022118876718" to i8*
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
  %".196" = bitcast [5 x i8]* @"str.430847042101993405" to i8*
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
  %"resultadoFF" = alloca i32
  %".271" = call i32 @"fibonacci"(i32 50)
  store i32 %".271", i32* %"resultadoFF"
  %"resultadoFF.1" = load i32, i32* %"resultadoFF"
  %".273" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".274" = call i32 (i8*, ...) @"printf"(i8* %".273", i32 %"resultadoFF.1")
  %".275" = mul i32 18, 2
  %".276" = mul i32 5, 10
  %".277" = sitofp i32 %".276" to double
  %".278" = sitofp i32 8 to double
  %".279" = fdiv double %".277", %".278"
  %".280" = sitofp i32 %".275" to double
  %".281" = fadd double %".280", %".279"
  %".282" = mul i32 5, 2
  %".283" = sitofp i32 %".282" to double
  %".284" = fadd double %".281", %".283"
  %".285" = sitofp i32 800000 to double
  %".286" = fadd double %".284", %".285"
  %".287" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".288" = call i32 (i8*, ...) @"printf"(i8* %".287", double %".286")
  %".289" = mul i32 88, 88
  %".290" = mul i32 %".289", 88
  %".291" = mul i32 %".290", 88
  %".292" = mul i32 %".291", 88
  %".293" = mul i32 %".292", 5
  %".294" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".295" = call i32 (i8*, ...) @"printf"(i8* %".294", i32 %".293")
  %".296" = sitofp i32 42 to double
  %".297" = sitofp i32 5 to double
  %".298" = call double @"llvm.pow.f64"(double %".296", double %".297")
  %".299" = sitofp i32 2 to double
  %".300" = fdiv double %".298", %".299"
  %".301" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".302" = call i32 (i8*, ...) @"printf"(i8* %".301", double %".300")
  %".303" = sitofp i32 2 to double
  %".304" = sitofp i32 9 to double
  %".305" = call double @"llvm.pow.f64"(double %".303", double %".304")
  %".306" = sitofp i32 78 to double
  %".307" = fdiv double %".306", %".305"
  %".308" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".309" = call i32 (i8*, ...) @"printf"(i8* %".308", double %".307")
  %".310" = sitofp i32 99 to double
  %".311" = sitofp i32 2 to double
  %".312" = call double @"llvm.pow.f64"(double %".310", double %".311")
  %".313" = sitofp i32 28 to double
  %".314" = fdiv double %".313", %".312"
  %".315" = sitofp i32 6 to double
  %".316" = fadd double %".314", %".315"
  %".317" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".318" = call i32 (i8*, ...) @"printf"(i8* %".317", double %".316")
  %".319" = sitofp i32 5 to double
  %".320" = sitofp i32 5 to double
  %".321" = call double @"llvm.pow.f64"(double %".319", double %".320")
  %".322" = sitofp i32 2 to double
  %".323" = fadd double %".321", %".322"
  %".324" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".325" = call i32 (i8*, ...) @"printf"(i8* %".324", double %".323")
  %".326" = sitofp i32 78 to double
  %".327" = sitofp i32 25 to double
  %".328" = call double @"llvm.pow.f64"(double %".326", double %".327")
  %".329" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".330" = call i32 (i8*, ...) @"printf"(i8* %".329", double %".328")
  %".331" = sitofp i32 125 to double
  %".332" = sitofp i32 5 to double
  %".333" = call double @"llvm.pow.f64"(double %".331", double %".332")
  %".334" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".335" = call i32 (i8*, ...) @"printf"(i8* %".334", double %".333")
  %".336" = sitofp i32 83 to double
  %".337" = sitofp i32 555 to double
  %".338" = call double @"llvm.pow.f64"(double %".336", double %".337")
  %".339" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".340" = call i32 (i8*, ...) @"printf"(i8* %".339", double %".338")
  %".341" = sitofp i32 78 to double
  %".342" = sitofp i32 2 to double
  %".343" = call double @"llvm.pow.f64"(double %".341", double %".342")
  %".344" = sitofp i32 5 to double
  %".345" = fadd double %".343", %".344"
  %".346" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".347" = call i32 (i8*, ...) @"printf"(i8* %".346", double %".345")
  %".348" = mul i32 2, 5
  %".349" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".350" = call i32 (i8*, ...) @"printf"(i8* %".349", i32 %".348")
  %"x.1" = load i32, i32* %"x"
  %".351" = mul i32 %"x.1", 4
  %".352" = add i32 2, %".351"
  %".353" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".354" = call i32 (i8*, ...) @"printf"(i8* %".353", i32 %".352")
  %".355" = add i32 2, 3
  %".356" = mul i32 %".355", 4
  %".357" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".358" = call i32 (i8*, ...) @"printf"(i8* %".357", i32 %".356")
  %".359" = sitofp i32 10 to double
  %".360" = sitofp i32 2 to double
  %".361" = fdiv double %".359", %".360"
  %".362" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".363" = call i32 (i8*, ...) @"printf"(i8* %".362", double %".361")
  %".364" = sitofp i32 2 to double
  %".365" = sitofp i32 3 to double
  %".366" = call double @"llvm.pow.f64"(double %".364", double %".365")
  %".367" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".368" = call i32 (i8*, ...) @"printf"(i8* %".367", double %".366")
  %".369" = sitofp i32 3 to double
  %".370" = sitofp i32 2 to double
  %".371" = call double @"llvm.pow.f64"(double %".369", double %".370")
  %".372" = sitofp i32 2 to double
  %".373" = call double @"llvm.pow.f64"(double %".372", double %".371")
  %".374" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374", double %".373")
  %".376" = mul i32 3, 2
  %".377" = add i32 5, %".376"
  %".378" = sitofp i32 4 to double
  %".379" = sitofp i32 2 to double
  %".380" = fdiv double %".378", %".379"
  %".381" = sitofp i32 %".377" to double
  %".382" = fsub double %".381", %".380"
  %".383" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".384" = call i32 (i8*, ...) @"printf"(i8* %".383", double %".382")
  %".385" = add i32 3, 4
  %".386" = sitofp i32 2 to double
  %".387" = sitofp i32 3 to double
  %".388" = call double @"llvm.pow.f64"(double %".386", double %".387")
  %".389" = sitofp i32 %".385" to double
  %".390" = fmul double %".389", %".388"
  %".391" = sitofp i32 10 to double
  %".392" = sitofp i32 2 to double
  %".393" = fdiv double %".391", %".392"
  %".394" = fsub double %".390", %".393"
  %".395" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".396" = call i32 (i8*, ...) @"printf"(i8* %".395", double %".394")
  %".397" = sitofp i32 5 to double
  %".398" = sitofp i32 2 to double
  %".399" = fdiv double %".397", %".398"
  %".400" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".401" = call i32 (i8*, ...) @"printf"(i8* %".400", double %".399")
  %".402" = sub i32 0, 2
  %".403" = mul i32 4, %".402"
  %".404" = add i32 2, %".403"
  %".405" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".406" = call i32 (i8*, ...) @"printf"(i8* %".405", i32 %".404")
  %"j" = alloca i32
  store i32 0, i32* %"j"
  br label %"for.cond.2"
for.cond.2:
  %"j.1" = load i32, i32* %"j"
  %".409" = icmp slt i32 %"j.1", 10
  br i1 %".409", label %"for.body.2", label %"for.exit.2"
for.body.2:
  %"j.2" = load i32, i32* %"j"
  %".411" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".412" = call i32 (i8*, ...) @"printf"(i8* %".411", i32 %"j.2")
  %"j.3" = load i32, i32* %"j"
  %".413" = sitofp i32 2 to double
  %".414" = sitofp i32 %"j.3" to double
  %".415" = call double @"llvm.pow.f64"(double %".413", double %".414")
  %".416" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".417" = call i32 (i8*, ...) @"printf"(i8* %".416", double %".415")
  br label %"for.inc.2"
for.inc.2:
  %"j.4" = load i32, i32* %"j"
  %"j.5" = load i32, i32* %"j"
  %".419" = add i32 %"j.5", 1
  store i32 %".419", i32* %"j"
  br label %"for.cond.2"
for.exit.2:
  %"juan" = alloca i8*
  %".422" = bitcast [4 x i8]* @"str.-4278983444431560600" to i8*
  store i8* %".422", i8** %"juan"
  %"juan.1" = load i8*, i8** %"juan"
  %".424" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".425" = call i32 (i8*, ...) @"printf"(i8* %".424", i8* %"juan.1")
  %".426" = bitcast [11 x i8]* @"str.-8002891238796560256" to i8*
  %".427" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".428" = call i32 (i8*, ...) @"printf"(i8* %".427", i8* %".426")
  %".429" = call i32 @"suma"()
  %".430" = bitcast [73 x i8]* @"str.-5829457613633069353" to i8*
  %".431" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".432" = call i32 (i8*, ...) @"printf"(i8* %".431", i8* %".430")
  %"a" = alloca i32
  store i32 10, i32* %"a"
  %"b" = alloca i32
  %"a.1" = load i32, i32* %"a"
  %".434" = call i32 @"doble"(i32 %"a.1")
  store i32 %".434", i32* %"b"
  %"b.1" = load i32, i32* %"b"
  %".436" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".437" = call i32 (i8*, ...) @"printf"(i8* %".436", i32 %"b.1")
  %".438" = bitcast [19 x i8]* @"str.909977619926745658" to i8*
  %".439" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".440" = call i32 (i8*, ...) @"printf"(i8* %".439", i8* %".438")
  %".441" = call i32 @"funcionB"(i32 5)
  %".442" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".443" = call i32 (i8*, ...) @"printf"(i8* %".442", i32 %".441")
  %".444" = bitcast [2 x i8]* @"str.-8375339648621677614" to i8*
  %".445" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".446" = call i32 (i8*, ...) @"printf"(i8* %".445", i8* %".444")
  %"y" = alloca double
  store double 0x4039000000000000, double* %"y"
  %"x.2" = load i32, i32* %"x"
  %".448" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".449" = call i32 (i8*, ...) @"printf"(i8* %".448", i32 %"x.2")
  %"y.1" = load double, double* %"y"
  %".450" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".451" = call i32 (i8*, ...) @"printf"(i8* %".450", double %"y.1")
  %".452" = bitcast [24 x i8]* @"str.-4497683347654341026" to i8*
  %".453" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".454" = call i32 (i8*, ...) @"printf"(i8* %".453", i8* %".452")
  %".455" = add i32 7, 2
  %".456" = sitofp i32 3 to double
  %".457" = sitofp i32 12 to double
  %".458" = call double @"llvm.pow.f64"(double %".456", double %".457")
  %".459" = sitofp i32 %".455" to double
  %".460" = fadd double %".459", %".458"
  %".461" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".462" = call i32 (i8*, ...) @"printf"(i8* %".461", double %".460")
  %".463" = sitofp i32 2 to double
  %".464" = sitofp i32 5 to double
  %".465" = call double @"llvm.pow.f64"(double %".463", double %".464")
  %".466" = sitofp i32 5 to double
  %".467" = sitofp i32 2 to double
  %".468" = call double @"llvm.pow.f64"(double %".466", double %".467")
  %".469" = fmul double %".465", %".468"
  %".470" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".471" = call i32 (i8*, ...) @"printf"(i8* %".470", double %".469")
  %".472" = sitofp i32 5 to double
  %".473" = sitofp i32 25 to double
  %".474" = call double @"llvm.pow.f64"(double %".472", double %".473")
  %".475" = sitofp i32 5 to double
  %".476" = fmul double %".475", %".474"
  %".477" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".478" = call i32 (i8*, ...) @"printf"(i8* %".477", double %".476")
  %".479" = mul i32 2, 23
  %".480" = sub i32 %".479", 23
  %".481" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".482" = call i32 (i8*, ...) @"printf"(i8* %".481", i32 %".480")
  %"x.3" = load i32, i32* %"x"
  %".483" = sitofp i32 30 to double
  %".484" = sitofp i32 %"x.3" to double
  %".485" = call double @"llvm.pow.f64"(double %".483", double %".484")
  %".486" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".487" = call i32 (i8*, ...) @"printf"(i8* %".486", double %".485")
  %".488" = mul i32 2, 2
  %".489" = mul i32 %".488", 2
  %".490" = sitofp i32 %".489" to double
  %".491" = sitofp i32 2 to double
  %".492" = fdiv double %".490", %".491"
  %".493" = mul i32 2, 2
  %".494" = sitofp i32 %".493" to double
  %".495" = fadd double %".492", %".494"
  %".496" = mul i32 2, 2
  %".497" = sitofp i32 %".496" to double
  %".498" = fadd double %".495", %".497"
  %".499" = mul i32 2, 2
  %".500" = sitofp i32 %".499" to double
  %".501" = fadd double %".498", %".500"
  %".502" = mul i32 2, 2
  %".503" = sitofp i32 %".502" to double
  %".504" = fadd double %".501", %".503"
  %".505" = mul i32 2, 2
  %".506" = sitofp i32 %".505" to double
  %".507" = fadd double %".504", %".506"
  %".508" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".509" = call i32 (i8*, ...) @"printf"(i8* %".508", double %".507")
  %"x.4" = load i32, i32* %"x"
  %"x.5" = load i32, i32* %"x"
  %".510" = sitofp i32 %"x.4" to double
  %".511" = sitofp i32 %"x.5" to double
  %".512" = call double @"llvm.pow.f64"(double %".510", double %".511")
  %".513" = mul i32 2, 5
  %".514" = sitofp i32 %".513" to double
  %".515" = fadd double %".512", %".514"
  %".516" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".517" = call i32 (i8*, ...) @"printf"(i8* %".516", double %".515")
  %"x.6" = load i32, i32* %"x"
  %".518" = icmp sgt i32 %"x.6", 15
  br i1 %".518", label %"then", label %"else"
then:
  %".520" = bitcast [7 x i8]* @"str.-2135924937038431123" to i8*
  %".521" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".522" = call i32 (i8*, ...) @"printf"(i8* %".521", i8* %".520")
  br label %"ifcont"
else:
  %".524" = bitcast [11 x i8]* @"str.-2842184187731815894" to i8*
  %".525" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".526" = call i32 (i8*, ...) @"printf"(i8* %".525", i8* %".524")
  br label %"ifcont"
ifcont:
  %".528" = mul i32 18, 2
  %".529" = mul i32 5, 10
  %".530" = sitofp i32 %".529" to double
  %".531" = sitofp i32 8 to double
  %".532" = fdiv double %".530", %".531"
  %".533" = sitofp i32 %".528" to double
  %".534" = fadd double %".533", %".532"
  %".535" = mul i32 5, 2
  %".536" = sitofp i32 %".535" to double
  %".537" = fadd double %".534", %".536"
  %".538" = sitofp i32 800000 to double
  %".539" = fadd double %".537", %".538"
  %".540" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".541" = call i32 (i8*, ...) @"printf"(i8* %".540", double %".539")
  %".542" = mul i32 88, 88
  %".543" = mul i32 %".542", 88
  %".544" = mul i32 %".543", 88
  %".545" = mul i32 %".544", 88
  %".546" = mul i32 %".545", 5
  %".547" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".548" = call i32 (i8*, ...) @"printf"(i8* %".547", i32 %".546")
  %".549" = sitofp i32 42 to double
  %".550" = sitofp i32 5 to double
  %".551" = call double @"llvm.pow.f64"(double %".549", double %".550")
  %".552" = sitofp i32 2 to double
  %".553" = fdiv double %".551", %".552"
  %".554" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".555" = call i32 (i8*, ...) @"printf"(i8* %".554", double %".553")
  %".556" = sitofp i32 2 to double
  %".557" = sitofp i32 9 to double
  %".558" = call double @"llvm.pow.f64"(double %".556", double %".557")
  %".559" = sitofp i32 78 to double
  %".560" = fdiv double %".559", %".558"
  %".561" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".562" = call i32 (i8*, ...) @"printf"(i8* %".561", double %".560")
  %".563" = sitofp i32 99 to double
  %".564" = sitofp i32 2 to double
  %".565" = call double @"llvm.pow.f64"(double %".563", double %".564")
  %".566" = sitofp i32 28 to double
  %".567" = fdiv double %".566", %".565"
  %".568" = sitofp i32 6 to double
  %".569" = fadd double %".567", %".568"
  %".570" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".571" = call i32 (i8*, ...) @"printf"(i8* %".570", double %".569")
  %".572" = sitofp i32 5 to double
  %".573" = sitofp i32 5 to double
  %".574" = call double @"llvm.pow.f64"(double %".572", double %".573")
  %".575" = sitofp i32 2 to double
  %".576" = fadd double %".574", %".575"
  %".577" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".578" = call i32 (i8*, ...) @"printf"(i8* %".577", double %".576")
  %".579" = sitofp i32 78 to double
  %".580" = sitofp i32 25 to double
  %".581" = call double @"llvm.pow.f64"(double %".579", double %".580")
  %".582" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".583" = call i32 (i8*, ...) @"printf"(i8* %".582", double %".581")
  %".584" = sitofp i32 125 to double
  %".585" = sitofp i32 5 to double
  %".586" = call double @"llvm.pow.f64"(double %".584", double %".585")
  %".587" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".588" = call i32 (i8*, ...) @"printf"(i8* %".587", double %".586")
  %".589" = sitofp i32 83 to double
  %".590" = sitofp i32 555 to double
  %".591" = call double @"llvm.pow.f64"(double %".589", double %".590")
  %".592" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".593" = call i32 (i8*, ...) @"printf"(i8* %".592", double %".591")
  %".594" = sitofp i32 78 to double
  %".595" = sitofp i32 2 to double
  %".596" = call double @"llvm.pow.f64"(double %".594", double %".595")
  %".597" = sitofp i32 5 to double
  %".598" = fadd double %".596", %".597"
  %".599" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".600" = call i32 (i8*, ...) @"printf"(i8* %".599", double %".598")
  br label %"while.cond.1"
while.cond.1:
  %"x.7" = load i32, i32* %"x"
  %".602" = icmp sgt i32 %"x.7", 0
  br i1 %".602", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"x.8" = load i32, i32* %"x"
  %".604" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".605" = call i32 (i8*, ...) @"printf"(i8* %".604", i32 %"x.8")
  %"x.9" = load i32, i32* %"x"
  %".606" = sub i32 %"x.9", 1
  store i32 %".606", i32* %"x"
  br label %"while.cond.1"
while.end.1:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"for.cond.3"
for.cond.3:
  %"i.1" = load i32, i32* %"i"
  %".611" = icmp sle i32 %"i.1", 100
  br i1 %".611", label %"for.body.3", label %"for.exit.3"
for.body.3:
  %"i.2" = load i32, i32* %"i"
  %".613" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".614" = call i32 (i8*, ...) @"printf"(i8* %".613", i32 %"i.2")
  br label %"for.inc.3"
for.inc.3:
  %"i.3" = load i32, i32* %"i"
  %"i.4" = load i32, i32* %"i"
  %".616" = add i32 %"i.4", 1
  store i32 %".616", i32* %"i"
  br label %"for.cond.3"
for.exit.3:
  %".619" = call i32 @"contarHasta"(i32 5)
  %".620" = call i32 @"potencia"(i32 2, i32 3)
  %".621" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".622" = call i32 (i8*, ...) @"printf"(i8* %".621", i32 %".620")
  %".623" = call i32 @"sumar"(i32 5, i32 7)
  %".624" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".625" = call i32 (i8*, ...) @"printf"(i8* %".624", i32 %".623")
  %"resultado" = alloca i32
  %".626" = call i32 @"sumaHasta"(i32 5)
  store i32 %".626", i32* %"resultado"
  %"resultado.1" = load i32, i32* %"resultado"
  %".628" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".629" = call i32 (i8*, ...) @"printf"(i8* %".628", i32 %"resultado.1")
  %".630" = mul i32 18, 2
  %".631" = mul i32 5, 10
  %".632" = sitofp i32 %".631" to double
  %".633" = sitofp i32 8 to double
  %".634" = fdiv double %".632", %".633"
  %".635" = sitofp i32 %".630" to double
  %".636" = fadd double %".635", %".634"
  %".637" = mul i32 5, 2
  %".638" = sitofp i32 %".637" to double
  %".639" = fadd double %".636", %".638"
  %".640" = sitofp i32 800000 to double
  %".641" = fadd double %".639", %".640"
  %".642" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".643" = call i32 (i8*, ...) @"printf"(i8* %".642", double %".641")
  %".644" = mul i32 88, 88
  %".645" = mul i32 %".644", 88
  %".646" = mul i32 %".645", 88
  %".647" = mul i32 %".646", 88
  %".648" = mul i32 %".647", 5
  %".649" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".650" = call i32 (i8*, ...) @"printf"(i8* %".649", i32 %".648")
  %".651" = sitofp i32 42 to double
  %".652" = sitofp i32 5 to double
  %".653" = call double @"llvm.pow.f64"(double %".651", double %".652")
  %".654" = sitofp i32 2 to double
  %".655" = fdiv double %".653", %".654"
  %".656" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".657" = call i32 (i8*, ...) @"printf"(i8* %".656", double %".655")
  %".658" = sitofp i32 2 to double
  %".659" = sitofp i32 9 to double
  %".660" = call double @"llvm.pow.f64"(double %".658", double %".659")
  %".661" = sitofp i32 78 to double
  %".662" = fdiv double %".661", %".660"
  %".663" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".664" = call i32 (i8*, ...) @"printf"(i8* %".663", double %".662")
  %".665" = sitofp i32 99 to double
  %".666" = sitofp i32 2 to double
  %".667" = call double @"llvm.pow.f64"(double %".665", double %".666")
  %".668" = sitofp i32 28 to double
  %".669" = fdiv double %".668", %".667"
  %".670" = sitofp i32 6 to double
  %".671" = fadd double %".669", %".670"
  %".672" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".673" = call i32 (i8*, ...) @"printf"(i8* %".672", double %".671")
  %".674" = sitofp i32 5 to double
  %".675" = sitofp i32 5 to double
  %".676" = call double @"llvm.pow.f64"(double %".674", double %".675")
  %".677" = sitofp i32 2 to double
  %".678" = fadd double %".676", %".677"
  %".679" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".680" = call i32 (i8*, ...) @"printf"(i8* %".679", double %".678")
  %".681" = sitofp i32 78 to double
  %".682" = sitofp i32 25 to double
  %".683" = call double @"llvm.pow.f64"(double %".681", double %".682")
  %".684" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".685" = call i32 (i8*, ...) @"printf"(i8* %".684", double %".683")
  %".686" = sitofp i32 125 to double
  %".687" = sitofp i32 5 to double
  %".688" = call double @"llvm.pow.f64"(double %".686", double %".687")
  %".689" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".690" = call i32 (i8*, ...) @"printf"(i8* %".689", double %".688")
  %".691" = sitofp i32 83 to double
  %".692" = sitofp i32 555 to double
  %".693" = call double @"llvm.pow.f64"(double %".691", double %".692")
  %".694" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".695" = call i32 (i8*, ...) @"printf"(i8* %".694", double %".693")
  %".696" = sitofp i32 78 to double
  %".697" = sitofp i32 2 to double
  %".698" = call double @"llvm.pow.f64"(double %".696", double %".697")
  %".699" = sitofp i32 5 to double
  %".700" = fadd double %".698", %".699"
  %".701" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".702" = call i32 (i8*, ...) @"printf"(i8* %".701", double %".700")
  %".703" = mul i32 2, 5
  %".704" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".705" = call i32 (i8*, ...) @"printf"(i8* %".704", i32 %".703")
  %"x.10" = load i32, i32* %"x"
  %".706" = mul i32 %"x.10", 4
  %".707" = add i32 2, %".706"
  %".708" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".709" = call i32 (i8*, ...) @"printf"(i8* %".708", i32 %".707")
  %".710" = add i32 2, 3
  %".711" = mul i32 %".710", 4
  %".712" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".713" = call i32 (i8*, ...) @"printf"(i8* %".712", i32 %".711")
  %".714" = sitofp i32 10 to double
  %".715" = sitofp i32 2 to double
  %".716" = fdiv double %".714", %".715"
  %".717" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".718" = call i32 (i8*, ...) @"printf"(i8* %".717", double %".716")
  %".719" = sitofp i32 2 to double
  %".720" = sitofp i32 3 to double
  %".721" = call double @"llvm.pow.f64"(double %".719", double %".720")
  %".722" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".723" = call i32 (i8*, ...) @"printf"(i8* %".722", double %".721")
  %".724" = sitofp i32 3 to double
  %".725" = sitofp i32 2 to double
  %".726" = call double @"llvm.pow.f64"(double %".724", double %".725")
  %".727" = sitofp i32 2 to double
  %".728" = call double @"llvm.pow.f64"(double %".727", double %".726")
  %".729" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".730" = call i32 (i8*, ...) @"printf"(i8* %".729", double %".728")
  %".731" = mul i32 3, 2
  %".732" = add i32 5, %".731"
  %".733" = sitofp i32 4 to double
  %".734" = sitofp i32 2 to double
  %".735" = fdiv double %".733", %".734"
  %".736" = sitofp i32 %".732" to double
  %".737" = fsub double %".736", %".735"
  %".738" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".739" = call i32 (i8*, ...) @"printf"(i8* %".738", double %".737")
  %".740" = add i32 3, 4
  %".741" = sitofp i32 2 to double
  %".742" = sitofp i32 3 to double
  %".743" = call double @"llvm.pow.f64"(double %".741", double %".742")
  %".744" = sitofp i32 %".740" to double
  %".745" = fmul double %".744", %".743"
  %".746" = sitofp i32 10 to double
  %".747" = sitofp i32 2 to double
  %".748" = fdiv double %".746", %".747"
  %".749" = fsub double %".745", %".748"
  %".750" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".751" = call i32 (i8*, ...) @"printf"(i8* %".750", double %".749")
  %".752" = sitofp i32 5 to double
  %".753" = sitofp i32 2 to double
  %".754" = fdiv double %".752", %".753"
  %".755" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".756" = call i32 (i8*, ...) @"printf"(i8* %".755", double %".754")
  %".757" = sub i32 0, 2
  %".758" = mul i32 4, %".757"
  %".759" = add i32 2, %".758"
  %".760" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".761" = call i32 (i8*, ...) @"printf"(i8* %".760", i32 %".759")
  %".762" = mul i32 18, 2
  %".763" = mul i32 5, 10
  %".764" = sitofp i32 %".763" to double
  %".765" = sitofp i32 8 to double
  %".766" = fdiv double %".764", %".765"
  %".767" = sitofp i32 %".762" to double
  %".768" = fadd double %".767", %".766"
  %".769" = mul i32 5, 2
  %".770" = sitofp i32 %".769" to double
  %".771" = fadd double %".768", %".770"
  %".772" = sitofp i32 800000 to double
  %".773" = fadd double %".771", %".772"
  %".774" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".775" = call i32 (i8*, ...) @"printf"(i8* %".774", double %".773")
  %".776" = mul i32 88, 88
  %".777" = mul i32 %".776", 88
  %".778" = mul i32 %".777", 88
  %".779" = mul i32 %".778", 88
  %".780" = mul i32 %".779", 5
  %".781" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".782" = call i32 (i8*, ...) @"printf"(i8* %".781", i32 %".780")
  %".783" = sitofp i32 42 to double
  %".784" = sitofp i32 5 to double
  %".785" = call double @"llvm.pow.f64"(double %".783", double %".784")
  %".786" = sitofp i32 2 to double
  %".787" = fdiv double %".785", %".786"
  %".788" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".789" = call i32 (i8*, ...) @"printf"(i8* %".788", double %".787")
  %".790" = sitofp i32 2 to double
  %".791" = sitofp i32 9 to double
  %".792" = call double @"llvm.pow.f64"(double %".790", double %".791")
  %".793" = sitofp i32 78 to double
  %".794" = fdiv double %".793", %".792"
  %".795" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".796" = call i32 (i8*, ...) @"printf"(i8* %".795", double %".794")
  %".797" = sitofp i32 99 to double
  %".798" = sitofp i32 2 to double
  %".799" = call double @"llvm.pow.f64"(double %".797", double %".798")
  %".800" = sitofp i32 28 to double
  %".801" = fdiv double %".800", %".799"
  %".802" = sitofp i32 6 to double
  %".803" = fadd double %".801", %".802"
  %".804" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".805" = call i32 (i8*, ...) @"printf"(i8* %".804", double %".803")
  %".806" = sitofp i32 5 to double
  %".807" = sitofp i32 5 to double
  %".808" = call double @"llvm.pow.f64"(double %".806", double %".807")
  %".809" = sitofp i32 2 to double
  %".810" = fadd double %".808", %".809"
  %".811" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".812" = call i32 (i8*, ...) @"printf"(i8* %".811", double %".810")
  %".813" = sitofp i32 78 to double
  %".814" = sitofp i32 25 to double
  %".815" = call double @"llvm.pow.f64"(double %".813", double %".814")
  %".816" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".817" = call i32 (i8*, ...) @"printf"(i8* %".816", double %".815")
  %".818" = sitofp i32 125 to double
  %".819" = sitofp i32 5 to double
  %".820" = call double @"llvm.pow.f64"(double %".818", double %".819")
  %".821" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".822" = call i32 (i8*, ...) @"printf"(i8* %".821", double %".820")
  %".823" = sitofp i32 83 to double
  %".824" = sitofp i32 555 to double
  %".825" = call double @"llvm.pow.f64"(double %".823", double %".824")
  %".826" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".827" = call i32 (i8*, ...) @"printf"(i8* %".826", double %".825")
  %".828" = sitofp i32 78 to double
  %".829" = sitofp i32 2 to double
  %".830" = call double @"llvm.pow.f64"(double %".828", double %".829")
  %".831" = sitofp i32 5 to double
  %".832" = fadd double %".830", %".831"
  %".833" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".834" = call i32 (i8*, ...) @"printf"(i8* %".833", double %".832")
  ret i32 0
}

@"str.4872056056157938008" = internal constant [21 x i8] c"aaaaaaaaaaaaaaaaaaaa\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
declare double @"llvm.pow.f64"(double %".1", double %".2")

@"fmt_float" = internal constant [4 x i8] c"%f\0a\00"
@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"
@"str.5192677022118876718" = internal constant [12 x i8] c"Hola muando\00"
@"str.430847042101993405" = internal constant [5 x i8] c"HOLA\00"
@"str.-4278983444431560600" = internal constant [4 x i8] c"Bry\00"
@"str.-8002891238796560256" = internal constant [11 x i8] c"La suma es\00"
@"str.-5829457613633069353" = internal constant [73 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH\00"
@"str.909977619926745658" = internal constant [19 x i8] c"pruebaaaaaaaaaaaas\00"
@"str.-8375339648621677614" = internal constant [2 x i8] c" \00"
@"str.-4497683347654341026" = internal constant [24 x i8] c"operaciones matematicas\00"
@"str.-2135924937038431123" = internal constant [7 x i8] c"x > 15\00"
@"str.-2842184187731815894" = internal constant [11 x i8] c"x es <= 15\00"