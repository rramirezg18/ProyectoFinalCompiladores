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
  %".2" = bitcast [21 x i8]* @"str.8614526078827892535" to i8*
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

  %"num4.2" = load i32, i32* %"num4"
  %"num4.3" = load i32, i32* %"num4"
  %".26" = sitofp i32 %"num4.2" to double
  %".27" = sitofp i32 %"num4.3" to double
  %".28" = call double @"llvm.pow.f64"(double %".26", double %".27")
  %".29" = sitofp i32 2 to double
  %".30" = fdiv double %".28", %".29"
  %".31" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".31", double %".30")
  %"num4.4" = load i32, i32* %"num4"
  %".33" = sitofp i32 %"num4.4" to double
  %".34" = sitofp i32 50 to double
  %".35" = call double @"llvm.pow.f64"(double %".33", double %".34")
  %".36" = sitofp i32 2 to double
  %".37" = fdiv double %".35", %".36"
  %".38" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38", double %".37")
  %"num5.2" = load i32, i32* %"num5"
  %".40" = sitofp i32 50 to double
  %".41" = sitofp i32 %"num5.2" to double
  %".42" = call double @"llvm.pow.f64"(double %".40", double %".41")
  %".43" = sitofp i32 20 to double
  %".44" = fdiv double %".42", %".43"
  %".45" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".45", double %".44")
  %"w" = alloca i32
  store i32 0, i32* %"w"
  br label %"for.cond"
for.cond:
  %"w.1" = load i32, i32* %"w"
  %".49" = icmp sle i32 %"w.1", 100
  br i1 %".49", label %"for.body", label %"for.exit"
for.body:
  %"num4.5" = load i32, i32* %"num4"
  %"w.2" = load i32, i32* %"w"
  %".51" = sitofp i32 %"num4.5" to double
  %".52" = sitofp i32 %"w.2" to double
  %".53" = call double @"llvm.pow.f64"(double %".51", double %".52")
  %"num5.3" = load i32, i32* %"num5"
  %".54" = sitofp i32 %"num5.3" to double
  %".55" = fdiv double %".53", %".54"
  %".56" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".56", double %".55")
  br label %"for.inc"
for.inc:
  %"w.3" = load i32, i32* %"w"
  %"w.4" = load i32, i32* %"w"
  %".59" = add i32 %"w.4", 1
  store i32 %".59", i32* %"w"
  br label %"for.cond"
for.exit:
  %".62" = mul i32 18, 2
  %".63" = mul i32 5, 10
  %".64" = sitofp i32 %".63" to double
  %".65" = sitofp i32 8 to double
  %".66" = fdiv double %".64", %".65"
  %".67" = sitofp i32 %".62" to double
  %".68" = fadd double %".67", %".66"
  %".69" = mul i32 5, 2
  %".70" = sitofp i32 %".69" to double
  %".71" = fadd double %".68", %".70"
  %".72" = sitofp i32 800000 to double
  %".73" = fadd double %".71", %".72"
  %".74" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".74", double %".73")
  %".76" = mul i32 88, 88
  %".77" = mul i32 %".76", 88
  %".78" = mul i32 %".77", 88
  %".79" = mul i32 %".78", 88
  %".80" = mul i32 %".79", 5
  %".81" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".81", i32 %".80")
  %".83" = sitofp i32 42 to double
  %".84" = sitofp i32 5 to double
  %".85" = call double @"llvm.pow.f64"(double %".83", double %".84")
  %".86" = sitofp i32 2 to double
  %".87" = fdiv double %".85", %".86"
  %".88" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".89" = call i32 (i8*, ...) @"printf"(i8* %".88", double %".87")
  %".90" = sitofp i32 2 to double
  %".91" = sitofp i32 9 to double
  %".92" = call double @"llvm.pow.f64"(double %".90", double %".91")
  %".93" = sitofp i32 78 to double
  %".94" = fdiv double %".93", %".92"
  %".95" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".96" = call i32 (i8*, ...) @"printf"(i8* %".95", double %".94")
  %".97" = sitofp i32 99 to double
  %".98" = sitofp i32 2 to double
  %".99" = call double @"llvm.pow.f64"(double %".97", double %".98")
  %".100" = sitofp i32 28 to double
  %".101" = fdiv double %".100", %".99"
  %".102" = sitofp i32 6 to double
  %".103" = fadd double %".101", %".102"
  %".104" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".104", double %".103")
  %".106" = sitofp i32 5 to double
  %".107" = sitofp i32 5 to double
  %".108" = call double @"llvm.pow.f64"(double %".106", double %".107")
  %".109" = sitofp i32 2 to double
  %".110" = fadd double %".108", %".109"
  %".111" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".112" = call i32 (i8*, ...) @"printf"(i8* %".111", double %".110")
  %".113" = sitofp i32 78 to double
  %".114" = sitofp i32 25 to double
  %".115" = call double @"llvm.pow.f64"(double %".113", double %".114")
  %".116" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".117" = call i32 (i8*, ...) @"printf"(i8* %".116", double %".115")
  %".118" = sitofp i32 125 to double
  %".119" = sitofp i32 5 to double
  %".120" = call double @"llvm.pow.f64"(double %".118", double %".119")
  %".121" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".122" = call i32 (i8*, ...) @"printf"(i8* %".121", double %".120")
  %".123" = sitofp i32 83 to double
  %".124" = sitofp i32 555 to double
  %".125" = call double @"llvm.pow.f64"(double %".123", double %".124")
  %".126" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".127" = call i32 (i8*, ...) @"printf"(i8* %".126", double %".125")
  %".128" = sitofp i32 78 to double
  %".129" = sitofp i32 2 to double
  %".130" = call double @"llvm.pow.f64"(double %".128", double %".129")
  %".131" = sitofp i32 5 to double
  %".132" = fadd double %".130", %".131"
  %".133" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".134" = call i32 (i8*, ...) @"printf"(i8* %".133", double %".132")
  %"div" = alloca double
  %".135" = sitofp i32 100 to double
  %".136" = sitofp i32 5 to double
  %".137" = fdiv double %".135", %".136"
  store double %".137", double* %"div"
  %"div.1" = load double, double* %"div"
  %".139" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".140" = call i32 (i8*, ...) @"printf"(i8* %".139", double %"div.1")
  %".141" = mul i32 3, 5
  %".142" = add i32 %".141", 2
  %".143" = sub i32 %".142", 88
  %".144" = sitofp i32 250 to double
  %".145" = sitofp i32 2 to double
  %".146" = fdiv double %".144", %".145"
  %".147" = sitofp i32 %".143" to double
  %".148" = fadd double %".147", %".146"
  %".149" = mul i32 789, 2
  %".150" = sitofp i32 %".149" to double
  %".151" = fadd double %".148", %".150"
  %".152" = mul i32 56, 2
  %".153" = sitofp i32 %".152" to double
  %".154" = fadd double %".151", %".153"
  %".155" = sitofp i32 300 to double
  %".156" = fadd double %".154", %".155"
  %".157" = sitofp i32 7896 to double
  %".158" = fsub double %".156", %".157"
  %".159" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".160" = call i32 (i8*, ...) @"printf"(i8* %".159", double %".158")
  %".161" = sitofp i32 23 to double
  %".162" = sitofp i32 23 to double
  %".163" = call double @"llvm.pow.f64"(double %".161", double %".162")
  %".164" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".165" = call i32 (i8*, ...) @"printf"(i8* %".164", double %".163")
  %"var" = alloca i32
  store i32 5, i32* %"var"
  %"saludo" = alloca i8*
  %".167" = bitcast [12 x i8]* @"str.-4147706418640457278" to i8*
  store i8* %".167", i8** %"saludo"
  %"saludo.1" = load i8*, i8** %"saludo"
  %".169" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".170" = call i32 (i8*, ...) @"printf"(i8* %".169", i8* %"saludo.1")
  %"t" = alloca double
  %".171" = sitofp i32 88 to double
  %".172" = sitofp i32 6 to double
  %".173" = call double @"llvm.pow.f64"(double %".171", double %".172")
  %".174" = mul i32 250, 2
  %".175" = sitofp i32 %".174" to double
  %".176" = fadd double %".173", %".175"
  store double %".176", double* %"t"
  %"t.1" = load double, double* %"t"
  %".178" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".179" = call i32 (i8*, ...) @"printf"(i8* %".178", double %"t.1")
  %"t.2" = load double, double* %"t"
  %".180" = sitofp i32 10 to double
  %".181" = fsub double %"t.2", %".180"
  store double %".181", double* %"t"
  %"var.1" = load i32, i32* %"var"
  %".183" = sitofp i32 250 to double
  %".184" = sitofp i32 2 to double
  %".185" = call double @"llvm.pow.f64"(double %".183", double %".184")
  %".186" = sitofp i32 %"var.1" to double
  %".187" = fadd double %".186", %".185"
  %".188" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".189" = call i32 (i8*, ...) @"printf"(i8* %".188", double %".187")
  %"var.2" = load i32, i32* %"var"
  %".190" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".191" = call i32 (i8*, ...) @"printf"(i8* %".190", i32 %"var.2")
  store i32 2, i32* %"var"
  %"var.3" = load i32, i32* %"var"
  %".193" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".194" = call i32 (i8*, ...) @"printf"(i8* %".193", i32 %"var.3")
  %"p" = alloca i32
  store i32 10, i32* %"p"
  br label %"while.cond"
while.cond:
  %"p.1" = load i32, i32* %"p"
  %".197" = icmp sge i32 %"p.1", 0
  br i1 %".197", label %"while.body", label %"while.end"
while.body:
  %".199" = bitcast [5 x i8]* @"str.-243526121489466537" to i8*
  %".200" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".201" = call i32 (i8*, ...) @"printf"(i8* %".200", i8* %".199")
  %"p.2" = load i32, i32* %"p"
  %".202" = sub i32 %"p.2", 1
  store i32 %".202", i32* %"p"
  br label %"while.cond"
while.end:
  %"var.4" = load i32, i32* %"var"
  %".205" = sitofp i32 2 to double
  %".206" = sitofp i32 %"var.4" to double
  %".207" = call double @"llvm.pow.f64"(double %".205", double %".206")
  %".208" = sitofp i32 200 to double
  %".209" = sitofp i32 2 to double
  %".210" = call double @"llvm.pow.f64"(double %".208", double %".209")
  %".211" = sitofp i32 55 to double
  %".212" = fmul double %".211", %".210"
  %".213" = mul i32 58, 2
  %".214" = sitofp i32 %".213" to double
  %".215" = fadd double %".212", %".214"
  %".216" = fadd double %".207", %".215"
  %".217" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".218" = call i32 (i8*, ...) @"printf"(i8* %".217", double %".216")
  %".219" = sitofp i32 6 to double
  %".220" = sitofp i32 6 to double
  %".221" = call double @"llvm.pow.f64"(double %".219", double %".220")
  %".222" = sitofp i32 2 to double
  %".223" = fadd double %".221", %".222"
  %".224" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".225" = call i32 (i8*, ...) @"printf"(i8* %".224", double %".223")
  %"x" = alloca i32
  store i32 10, i32* %"x"
  %"variable" = alloca i32
  store i32 10, i32* %"variable"
  %"variable.1" = load i32, i32* %"variable"
  %".228" = sitofp i32 100 to double
  %".229" = sitofp i32 %"variable.1" to double
  %".230" = call double @"llvm.pow.f64"(double %".228", double %".229")
  %".231" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".232" = call i32 (i8*, ...) @"printf"(i8* %".231", double %".230")
  %"variable.2" = load i32, i32* %"variable"
  %".233" = sitofp i32 55 to double
  %".234" = sitofp i32 %"variable.2" to double
  %".235" = call double @"llvm.pow.f64"(double %".233", double %".234")
  %".236" = sitofp i32 300 to double
  %".237" = fadd double %".235", %".236"
  %".238" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".239" = call i32 (i8*, ...) @"printf"(i8* %".238", double %".237")
  %"variable.3" = load i32, i32* %"variable"
  %".240" = mul i32 300, 55
  %".241" = add i32 %"variable.3", %".240"
  %".242" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242", i32 %".241")
  %".244" = add i32 3, 5
  %".245" = mul i32 25, %".244"
  %".246" = sub i32 5, %".245"
  %".247" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".248" = call i32 (i8*, ...) @"printf"(i8* %".247", i32 %".246")
  %"k" = alloca i32
  store i32 0, i32* %"k"
  br label %"for.cond.1"
for.cond.1:
  %"k.1" = load i32, i32* %"k"
  %".251" = icmp sle i32 %"k.1", 10
  br i1 %".251", label %"for.body.1", label %"for.exit.1"
for.body.1:
  %".253" = add i32 3, 5
  %".254" = mul i32 25, %".253"
  %".255" = sub i32 5, %".254"
  %".256" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".257" = call i32 (i8*, ...) @"printf"(i8* %".256", i32 %".255")
  br label %"for.inc.1"
for.inc.1:
  %"k.2" = load i32, i32* %"k"
  %"k.3" = load i32, i32* %"k"
  %".259" = add i32 %"k.3", 1
  store i32 %".259", i32* %"k"
  br label %"for.cond.1"
for.exit.1:
  %"z" = alloca double
  %".262" = sitofp i32 5 to double
  %".263" = sitofp i32 100 to double
  %".264" = call double @"llvm.pow.f64"(double %".262", double %".263")
  store double %".264", double* %"z"
  %"z.1" = load double, double* %"z"
  %".266" = sitofp i32 1 to double
  %".267" = fsub double %"z.1", %".266"
  %".268" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".269" = call i32 (i8*, ...) @"printf"(i8* %".268", double %".267")
  %"resultadoF" = alloca i32
  %".270" = call i32 @"fibonacci"(i32 50)
  store i32 %".270", i32* %"resultadoF"
  %"resultadoF.1" = load i32, i32* %"resultadoF"
  %".272" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".273" = call i32 (i8*, ...) @"printf"(i8* %".272", i32 %"resultadoF.1")
  %".274" = mul i32 18, 2
  %".275" = mul i32 5, 10
  %".276" = sitofp i32 %".275" to double
  %".277" = sitofp i32 8 to double
  %".278" = fdiv double %".276", %".277"
  %".279" = sitofp i32 %".274" to double
  %".280" = fadd double %".279", %".278"
  %".281" = mul i32 5, 2
  %".282" = sitofp i32 %".281" to double
  %".283" = fadd double %".280", %".282"
  %".284" = sitofp i32 800000 to double
  %".285" = fadd double %".283", %".284"
  %".286" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".287" = call i32 (i8*, ...) @"printf"(i8* %".286", double %".285")
  %".288" = mul i32 88, 88
  %".289" = mul i32 %".288", 88
  %".290" = mul i32 %".289", 88
  %".291" = mul i32 %".290", 88
  %".292" = mul i32 %".291", 5
  %".293" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".294" = call i32 (i8*, ...) @"printf"(i8* %".293", i32 %".292")
  %".295" = sitofp i32 42 to double
  %".296" = sitofp i32 5 to double
  %".297" = call double @"llvm.pow.f64"(double %".295", double %".296")
  %".298" = sitofp i32 2 to double
  %".299" = fdiv double %".297", %".298"
  %".300" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".301" = call i32 (i8*, ...) @"printf"(i8* %".300", double %".299")
  %".302" = sitofp i32 2 to double
  %".303" = sitofp i32 9 to double
  %".304" = call double @"llvm.pow.f64"(double %".302", double %".303")
  %".305" = sitofp i32 78 to double
  %".306" = fdiv double %".305", %".304"
  %".307" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".308" = call i32 (i8*, ...) @"printf"(i8* %".307", double %".306")
  %".309" = sitofp i32 99 to double
  %".310" = sitofp i32 2 to double
  %".311" = call double @"llvm.pow.f64"(double %".309", double %".310")
  %".312" = sitofp i32 28 to double
  %".313" = fdiv double %".312", %".311"
  %".314" = sitofp i32 6 to double
  %".315" = fadd double %".313", %".314"
  %".316" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".317" = call i32 (i8*, ...) @"printf"(i8* %".316", double %".315")
  %".318" = sitofp i32 5 to double
  %".319" = sitofp i32 5 to double
  %".320" = call double @"llvm.pow.f64"(double %".318", double %".319")
  %".321" = sitofp i32 2 to double
  %".322" = fadd double %".320", %".321"
  %".323" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".324" = call i32 (i8*, ...) @"printf"(i8* %".323", double %".322")
  %".325" = sitofp i32 78 to double
  %".326" = sitofp i32 25 to double
  %".327" = call double @"llvm.pow.f64"(double %".325", double %".326")
  %".328" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".329" = call i32 (i8*, ...) @"printf"(i8* %".328", double %".327")
  %".330" = sitofp i32 125 to double
  %".331" = sitofp i32 5 to double
  %".332" = call double @"llvm.pow.f64"(double %".330", double %".331")
  %".333" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".334" = call i32 (i8*, ...) @"printf"(i8* %".333", double %".332")
  %".335" = sitofp i32 83 to double
  %".336" = sitofp i32 555 to double
  %".337" = call double @"llvm.pow.f64"(double %".335", double %".336")
  %".338" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".339" = call i32 (i8*, ...) @"printf"(i8* %".338", double %".337")
  %".340" = sitofp i32 78 to double
  %".341" = sitofp i32 2 to double
  %".342" = call double @"llvm.pow.f64"(double %".340", double %".341")
  %".343" = sitofp i32 5 to double
  %".344" = fadd double %".342", %".343"
  %".345" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".346" = call i32 (i8*, ...) @"printf"(i8* %".345", double %".344")
  %".347" = mul i32 2, 5
  %".348" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".349" = call i32 (i8*, ...) @"printf"(i8* %".348", i32 %".347")
  %"x.1" = load i32, i32* %"x"
  %".350" = mul i32 %"x.1", 4
  %".351" = add i32 2, %".350"
  %".352" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352", i32 %".351")
  %".354" = add i32 2, 3
  %".355" = mul i32 %".354", 4
  %".356" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".357" = call i32 (i8*, ...) @"printf"(i8* %".356", i32 %".355")
  %".358" = sitofp i32 10 to double
  %".359" = sitofp i32 2 to double
  %".360" = fdiv double %".358", %".359"
  %".361" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".362" = call i32 (i8*, ...) @"printf"(i8* %".361", double %".360")
  %".363" = sitofp i32 2 to double
  %".364" = sitofp i32 3 to double
  %".365" = call double @"llvm.pow.f64"(double %".363", double %".364")
  %".366" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".367" = call i32 (i8*, ...) @"printf"(i8* %".366", double %".365")
  %".368" = sitofp i32 3 to double
  %".369" = sitofp i32 2 to double
  %".370" = call double @"llvm.pow.f64"(double %".368", double %".369")
  %".371" = sitofp i32 2 to double
  %".372" = call double @"llvm.pow.f64"(double %".371", double %".370")
  %".373" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".374" = call i32 (i8*, ...) @"printf"(i8* %".373", double %".372")
  %".375" = mul i32 3, 2
  %".376" = add i32 5, %".375"
  %".377" = sitofp i32 4 to double
  %".378" = sitofp i32 2 to double
  %".379" = fdiv double %".377", %".378"
  %".380" = sitofp i32 %".376" to double
  %".381" = fsub double %".380", %".379"
  %".382" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".383" = call i32 (i8*, ...) @"printf"(i8* %".382", double %".381")
  %".384" = add i32 3, 4
  %".385" = sitofp i32 2 to double
  %".386" = sitofp i32 3 to double
  %".387" = call double @"llvm.pow.f64"(double %".385", double %".386")
  %".388" = sitofp i32 %".384" to double
  %".389" = fmul double %".388", %".387"
  %".390" = sitofp i32 10 to double
  %".391" = sitofp i32 2 to double
  %".392" = fdiv double %".390", %".391"
  %".393" = fsub double %".389", %".392"
  %".394" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".395" = call i32 (i8*, ...) @"printf"(i8* %".394", double %".393")
  %".396" = sitofp i32 5 to double
  %".397" = sitofp i32 2 to double
  %".398" = fdiv double %".396", %".397"
  %".399" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".400" = call i32 (i8*, ...) @"printf"(i8* %".399", double %".398")
  %".401" = sub i32 0, 2
  %".402" = mul i32 4, %".401"
  %".403" = add i32 2, %".402"
  %".404" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".405" = call i32 (i8*, ...) @"printf"(i8* %".404", i32 %".403")
  %"j" = alloca i32
  store i32 0, i32* %"j"
  br label %"for.cond.2"
for.cond.2:
  %"j.1" = load i32, i32* %"j"
  %".408" = icmp slt i32 %"j.1", 10
  br i1 %".408", label %"for.body.2", label %"for.exit.2"
for.body.2:
  %"j.2" = load i32, i32* %"j"
  %".410" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".411" = call i32 (i8*, ...) @"printf"(i8* %".410", i32 %"j.2")
  %"j.3" = load i32, i32* %"j"
  %".412" = sitofp i32 2 to double
  %".413" = sitofp i32 %"j.3" to double
  %".414" = call double @"llvm.pow.f64"(double %".412", double %".413")
  %".415" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".416" = call i32 (i8*, ...) @"printf"(i8* %".415", double %".414")
  br label %"for.inc.2"
for.inc.2:
  %"j.4" = load i32, i32* %"j"
  %"j.5" = load i32, i32* %"j"
  %".418" = add i32 %"j.5", 1
  store i32 %".418", i32* %"j"
  br label %"for.cond.2"
for.exit.2:
  %"juan" = alloca i8*
  %".421" = bitcast [4 x i8]* @"str.-9030441063410903703" to i8*
  store i8* %".421", i8** %"juan"
  %"juan.1" = load i8*, i8** %"juan"
  %".423" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".424" = call i32 (i8*, ...) @"printf"(i8* %".423", i8* %"juan.1")
  %".425" = bitcast [11 x i8]* @"str.3727467149672926427" to i8*
  %".426" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".427" = call i32 (i8*, ...) @"printf"(i8* %".426", i8* %".425")
  %".428" = call i32 @"suma"()
  %".429" = bitcast [73 x i8]* @"str.-8235756114048028134" to i8*
  %".430" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".431" = call i32 (i8*, ...) @"printf"(i8* %".430", i8* %".429")
  %"a" = alloca i32
  store i32 10, i32* %"a"
  %"b" = alloca i32
  %"a.1" = load i32, i32* %"a"
  %".433" = call i32 @"doble"(i32 %"a.1")
  store i32 %".433", i32* %"b"
  %"b.1" = load i32, i32* %"b"
  %".435" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".436" = call i32 (i8*, ...) @"printf"(i8* %".435", i32 %"b.1")
  %".437" = bitcast [19 x i8]* @"str.6942253003426234221" to i8*
  %".438" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".439" = call i32 (i8*, ...) @"printf"(i8* %".438", i8* %".437")
  %".440" = call i32 @"funcionB"(i32 5)
  %".441" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".442" = call i32 (i8*, ...) @"printf"(i8* %".441", i32 %".440")
  %".443" = bitcast [2 x i8]* @"str.-2517158501142655426" to i8*
  %".444" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".445" = call i32 (i8*, ...) @"printf"(i8* %".444", i8* %".443")
  %"y" = alloca double
  store double 0x4039000000000000, double* %"y"
  %"x.2" = load i32, i32* %"x"
  %".447" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".448" = call i32 (i8*, ...) @"printf"(i8* %".447", i32 %"x.2")
  %"y.1" = load double, double* %"y"
  %".449" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".450" = call i32 (i8*, ...) @"printf"(i8* %".449", double %"y.1")
  %".451" = bitcast [24 x i8]* @"str.3367655142947562995" to i8*
  %".452" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".453" = call i32 (i8*, ...) @"printf"(i8* %".452", i8* %".451")
  %".454" = add i32 7, 2
  %".455" = sitofp i32 3 to double
  %".456" = sitofp i32 12 to double
  %".457" = call double @"llvm.pow.f64"(double %".455", double %".456")
  %".458" = sitofp i32 %".454" to double
  %".459" = fadd double %".458", %".457"
  %".460" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".461" = call i32 (i8*, ...) @"printf"(i8* %".460", double %".459")
  %".462" = sitofp i32 2 to double
  %".463" = sitofp i32 5 to double
  %".464" = call double @"llvm.pow.f64"(double %".462", double %".463")
  %".465" = sitofp i32 5 to double
  %".466" = sitofp i32 2 to double
  %".467" = call double @"llvm.pow.f64"(double %".465", double %".466")
  %".468" = fmul double %".464", %".467"
  %".469" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".470" = call i32 (i8*, ...) @"printf"(i8* %".469", double %".468")
  %".471" = sitofp i32 5 to double
  %".472" = sitofp i32 25 to double
  %".473" = call double @"llvm.pow.f64"(double %".471", double %".472")
  %".474" = sitofp i32 5 to double
  %".475" = fmul double %".474", %".473"
  %".476" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".477" = call i32 (i8*, ...) @"printf"(i8* %".476", double %".475")
  %".478" = mul i32 2, 23
  %".479" = sub i32 %".478", 23
  %".480" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".481" = call i32 (i8*, ...) @"printf"(i8* %".480", i32 %".479")
  %"x.3" = load i32, i32* %"x"
  %".482" = sitofp i32 30 to double
  %".483" = sitofp i32 %"x.3" to double
  %".484" = call double @"llvm.pow.f64"(double %".482", double %".483")
  %".485" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".486" = call i32 (i8*, ...) @"printf"(i8* %".485", double %".484")
  %".487" = mul i32 2, 2
  %".488" = mul i32 %".487", 2
  %".489" = sitofp i32 %".488" to double
  %".490" = sitofp i32 2 to double
  %".491" = fdiv double %".489", %".490"
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
  %".504" = mul i32 2, 2
  %".505" = sitofp i32 %".504" to double
  %".506" = fadd double %".503", %".505"
  %".507" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".508" = call i32 (i8*, ...) @"printf"(i8* %".507", double %".506")
  %"x.4" = load i32, i32* %"x"
  %"x.5" = load i32, i32* %"x"
  %".509" = sitofp i32 %"x.4" to double
  %".510" = sitofp i32 %"x.5" to double
  %".511" = call double @"llvm.pow.f64"(double %".509", double %".510")
  %".512" = mul i32 2, 5
  %".513" = sitofp i32 %".512" to double
  %".514" = fadd double %".511", %".513"
  %".515" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".516" = call i32 (i8*, ...) @"printf"(i8* %".515", double %".514")
  %"x.6" = load i32, i32* %"x"
  %".517" = icmp sgt i32 %"x.6", 15
  br i1 %".517", label %"then", label %"else"
then:
  %".519" = bitcast [7 x i8]* @"str.-4916251825178103908" to i8*
  %".520" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".521" = call i32 (i8*, ...) @"printf"(i8* %".520", i8* %".519")
  br label %"ifcont"
else:
  %".523" = bitcast [11 x i8]* @"str.8675918905311110973" to i8*
  %".524" = bitcast [4 x i8]* @"fmt_string" to i8*
  %".525" = call i32 (i8*, ...) @"printf"(i8* %".524", i8* %".523")
  br label %"ifcont"
ifcont:
  %".527" = mul i32 18, 2
  %".528" = mul i32 5, 10
  %".529" = sitofp i32 %".528" to double
  %".530" = sitofp i32 8 to double
  %".531" = fdiv double %".529", %".530"
  %".532" = sitofp i32 %".527" to double
  %".533" = fadd double %".532", %".531"
  %".534" = mul i32 5, 2
  %".535" = sitofp i32 %".534" to double
  %".536" = fadd double %".533", %".535"
  %".537" = sitofp i32 800000 to double
  %".538" = fadd double %".536", %".537"
  %".539" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".540" = call i32 (i8*, ...) @"printf"(i8* %".539", double %".538")
  %".541" = mul i32 88, 88
  %".542" = mul i32 %".541", 88
  %".543" = mul i32 %".542", 88
  %".544" = mul i32 %".543", 88
  %".545" = mul i32 %".544", 5
  %".546" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".547" = call i32 (i8*, ...) @"printf"(i8* %".546", i32 %".545")
  %".548" = sitofp i32 42 to double
  %".549" = sitofp i32 5 to double
  %".550" = call double @"llvm.pow.f64"(double %".548", double %".549")
  %".551" = sitofp i32 2 to double
  %".552" = fdiv double %".550", %".551"
  %".553" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".554" = call i32 (i8*, ...) @"printf"(i8* %".553", double %".552")
  %".555" = sitofp i32 2 to double
  %".556" = sitofp i32 9 to double
  %".557" = call double @"llvm.pow.f64"(double %".555", double %".556")
  %".558" = sitofp i32 78 to double
  %".559" = fdiv double %".558", %".557"
  %".560" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".561" = call i32 (i8*, ...) @"printf"(i8* %".560", double %".559")
  %".562" = sitofp i32 99 to double
  %".563" = sitofp i32 2 to double
  %".564" = call double @"llvm.pow.f64"(double %".562", double %".563")
  %".565" = sitofp i32 28 to double
  %".566" = fdiv double %".565", %".564"
  %".567" = sitofp i32 6 to double
  %".568" = fadd double %".566", %".567"
  %".569" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".570" = call i32 (i8*, ...) @"printf"(i8* %".569", double %".568")
  %".571" = sitofp i32 5 to double
  %".572" = sitofp i32 5 to double
  %".573" = call double @"llvm.pow.f64"(double %".571", double %".572")
  %".574" = sitofp i32 2 to double
  %".575" = fadd double %".573", %".574"
  %".576" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".577" = call i32 (i8*, ...) @"printf"(i8* %".576", double %".575")
  %".578" = sitofp i32 78 to double
  %".579" = sitofp i32 25 to double
  %".580" = call double @"llvm.pow.f64"(double %".578", double %".579")
  %".581" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".582" = call i32 (i8*, ...) @"printf"(i8* %".581", double %".580")
  %".583" = sitofp i32 125 to double
  %".584" = sitofp i32 5 to double
  %".585" = call double @"llvm.pow.f64"(double %".583", double %".584")
  %".586" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".587" = call i32 (i8*, ...) @"printf"(i8* %".586", double %".585")
  %".588" = sitofp i32 83 to double
  %".589" = sitofp i32 555 to double
  %".590" = call double @"llvm.pow.f64"(double %".588", double %".589")
  %".591" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".592" = call i32 (i8*, ...) @"printf"(i8* %".591", double %".590")
  %".593" = sitofp i32 78 to double
  %".594" = sitofp i32 2 to double
  %".595" = call double @"llvm.pow.f64"(double %".593", double %".594")
  %".596" = sitofp i32 5 to double
  %".597" = fadd double %".595", %".596"
  %".598" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".599" = call i32 (i8*, ...) @"printf"(i8* %".598", double %".597")
  br label %"while.cond.1"
while.cond.1:
  %"x.7" = load i32, i32* %"x"
  %".601" = icmp sgt i32 %"x.7", 0
  br i1 %".601", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"x.8" = load i32, i32* %"x"
  %".603" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".604" = call i32 (i8*, ...) @"printf"(i8* %".603", i32 %"x.8")
  %"x.9" = load i32, i32* %"x"
  %".605" = sub i32 %"x.9", 1
  store i32 %".605", i32* %"x"
  br label %"while.cond.1"
while.end.1:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"for.cond.3"
for.cond.3:
  %"i.1" = load i32, i32* %"i"
  %".610" = icmp sle i32 %"i.1", 100
  br i1 %".610", label %"for.body.3", label %"for.exit.3"
for.body.3:
  %"i.2" = load i32, i32* %"i"
  %".612" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".613" = call i32 (i8*, ...) @"printf"(i8* %".612", i32 %"i.2")
  br label %"for.inc.3"
for.inc.3:
  %"i.3" = load i32, i32* %"i"
  %"i.4" = load i32, i32* %"i"
  %".615" = add i32 %"i.4", 1
  store i32 %".615", i32* %"i"
  br label %"for.cond.3"
for.exit.3:
  %".618" = call i32 @"contarHasta"(i32 5)
  %".619" = call i32 @"potencia"(i32 2, i32 3)
  %".620" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".621" = call i32 (i8*, ...) @"printf"(i8* %".620", i32 %".619")
  %".622" = call i32 @"sumar"(i32 5, i32 7)
  %".623" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".624" = call i32 (i8*, ...) @"printf"(i8* %".623", i32 %".622")
  %"resultado" = alloca i32
  %".625" = call i32 @"sumaHasta"(i32 5)
  store i32 %".625", i32* %"resultado"
  %"resultado.1" = load i32, i32* %"resultado"
  %".627" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".628" = call i32 (i8*, ...) @"printf"(i8* %".627", i32 %"resultado.1")
  %".629" = mul i32 18, 2
  %".630" = mul i32 5, 10
  %".631" = sitofp i32 %".630" to double
  %".632" = sitofp i32 8 to double
  %".633" = fdiv double %".631", %".632"
  %".634" = sitofp i32 %".629" to double
  %".635" = fadd double %".634", %".633"
  %".636" = mul i32 5, 2
  %".637" = sitofp i32 %".636" to double
  %".638" = fadd double %".635", %".637"
  %".639" = sitofp i32 800000 to double
  %".640" = fadd double %".638", %".639"
  %".641" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".642" = call i32 (i8*, ...) @"printf"(i8* %".641", double %".640")
  %".643" = mul i32 88, 88
  %".644" = mul i32 %".643", 88
  %".645" = mul i32 %".644", 88
  %".646" = mul i32 %".645", 88
  %".647" = mul i32 %".646", 5
  %".648" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".649" = call i32 (i8*, ...) @"printf"(i8* %".648", i32 %".647")
  %".650" = sitofp i32 42 to double
  %".651" = sitofp i32 5 to double
  %".652" = call double @"llvm.pow.f64"(double %".650", double %".651")
  %".653" = sitofp i32 2 to double
  %".654" = fdiv double %".652", %".653"
  %".655" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".656" = call i32 (i8*, ...) @"printf"(i8* %".655", double %".654")
  %".657" = sitofp i32 2 to double
  %".658" = sitofp i32 9 to double
  %".659" = call double @"llvm.pow.f64"(double %".657", double %".658")
  %".660" = sitofp i32 78 to double
  %".661" = fdiv double %".660", %".659"
  %".662" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".663" = call i32 (i8*, ...) @"printf"(i8* %".662", double %".661")
  %".664" = sitofp i32 99 to double
  %".665" = sitofp i32 2 to double
  %".666" = call double @"llvm.pow.f64"(double %".664", double %".665")
  %".667" = sitofp i32 28 to double
  %".668" = fdiv double %".667", %".666"
  %".669" = sitofp i32 6 to double
  %".670" = fadd double %".668", %".669"
  %".671" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".672" = call i32 (i8*, ...) @"printf"(i8* %".671", double %".670")
  %".673" = sitofp i32 5 to double
  %".674" = sitofp i32 5 to double
  %".675" = call double @"llvm.pow.f64"(double %".673", double %".674")
  %".676" = sitofp i32 2 to double
  %".677" = fadd double %".675", %".676"
  %".678" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".679" = call i32 (i8*, ...) @"printf"(i8* %".678", double %".677")
  %".680" = sitofp i32 78 to double
  %".681" = sitofp i32 25 to double
  %".682" = call double @"llvm.pow.f64"(double %".680", double %".681")
  %".683" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".684" = call i32 (i8*, ...) @"printf"(i8* %".683", double %".682")
  %".685" = sitofp i32 125 to double
  %".686" = sitofp i32 5 to double
  %".687" = call double @"llvm.pow.f64"(double %".685", double %".686")
  %".688" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".689" = call i32 (i8*, ...) @"printf"(i8* %".688", double %".687")
  %".690" = sitofp i32 83 to double
  %".691" = sitofp i32 555 to double
  %".692" = call double @"llvm.pow.f64"(double %".690", double %".691")
  %".693" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".694" = call i32 (i8*, ...) @"printf"(i8* %".693", double %".692")
  %".695" = sitofp i32 78 to double
  %".696" = sitofp i32 2 to double
  %".697" = call double @"llvm.pow.f64"(double %".695", double %".696")
  %".698" = sitofp i32 5 to double
  %".699" = fadd double %".697", %".698"
  %".700" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".701" = call i32 (i8*, ...) @"printf"(i8* %".700", double %".699")
  %".702" = mul i32 2, 5
  %".703" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".704" = call i32 (i8*, ...) @"printf"(i8* %".703", i32 %".702")
  %"x.10" = load i32, i32* %"x"
  %".705" = mul i32 %"x.10", 4
  %".706" = add i32 2, %".705"
  %".707" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".708" = call i32 (i8*, ...) @"printf"(i8* %".707", i32 %".706")
  %".709" = add i32 2, 3
  %".710" = mul i32 %".709", 4
  %".711" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".712" = call i32 (i8*, ...) @"printf"(i8* %".711", i32 %".710")
  %".713" = sitofp i32 10 to double
  %".714" = sitofp i32 2 to double
  %".715" = fdiv double %".713", %".714"
  %".716" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".717" = call i32 (i8*, ...) @"printf"(i8* %".716", double %".715")
  %".718" = sitofp i32 2 to double
  %".719" = sitofp i32 3 to double
  %".720" = call double @"llvm.pow.f64"(double %".718", double %".719")
  %".721" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".722" = call i32 (i8*, ...) @"printf"(i8* %".721", double %".720")
  %".723" = sitofp i32 3 to double
  %".724" = sitofp i32 2 to double
  %".725" = call double @"llvm.pow.f64"(double %".723", double %".724")
  %".726" = sitofp i32 2 to double
  %".727" = call double @"llvm.pow.f64"(double %".726", double %".725")
  %".728" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".729" = call i32 (i8*, ...) @"printf"(i8* %".728", double %".727")
  %".730" = mul i32 3, 2
  %".731" = add i32 5, %".730"
  %".732" = sitofp i32 4 to double
  %".733" = sitofp i32 2 to double
  %".734" = fdiv double %".732", %".733"
  %".735" = sitofp i32 %".731" to double
  %".736" = fsub double %".735", %".734"
  %".737" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".738" = call i32 (i8*, ...) @"printf"(i8* %".737", double %".736")
  %".739" = add i32 3, 4
  %".740" = sitofp i32 2 to double
  %".741" = sitofp i32 3 to double
  %".742" = call double @"llvm.pow.f64"(double %".740", double %".741")
  %".743" = sitofp i32 %".739" to double
  %".744" = fmul double %".743", %".742"
  %".745" = sitofp i32 10 to double
  %".746" = sitofp i32 2 to double
  %".747" = fdiv double %".745", %".746"
  %".748" = fsub double %".744", %".747"
  %".749" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".750" = call i32 (i8*, ...) @"printf"(i8* %".749", double %".748")
  %".751" = sitofp i32 5 to double
  %".752" = sitofp i32 2 to double
  %".753" = fdiv double %".751", %".752"
  %".754" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".755" = call i32 (i8*, ...) @"printf"(i8* %".754", double %".753")
  %".756" = sub i32 0, 2
  %".757" = mul i32 4, %".756"
  %".758" = add i32 2, %".757"
  %".759" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".760" = call i32 (i8*, ...) @"printf"(i8* %".759", i32 %".758")
  %".761" = mul i32 18, 2
  %".762" = mul i32 5, 10
  %".763" = sitofp i32 %".762" to double
  %".764" = sitofp i32 8 to double
  %".765" = fdiv double %".763", %".764"
  %".766" = sitofp i32 %".761" to double
  %".767" = fadd double %".766", %".765"
  %".768" = mul i32 5, 2
  %".769" = sitofp i32 %".768" to double
  %".770" = fadd double %".767", %".769"
  %".771" = sitofp i32 800000 to double
  %".772" = fadd double %".770", %".771"
  %".773" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".774" = call i32 (i8*, ...) @"printf"(i8* %".773", double %".772")
  %".775" = mul i32 88, 88
  %".776" = mul i32 %".775", 88
  %".777" = mul i32 %".776", 88
  %".778" = mul i32 %".777", 88
  %".779" = mul i32 %".778", 5
  %".780" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".781" = call i32 (i8*, ...) @"printf"(i8* %".780", i32 %".779")
  %".782" = sitofp i32 42 to double
  %".783" = sitofp i32 5 to double
  %".784" = call double @"llvm.pow.f64"(double %".782", double %".783")
  %".785" = sitofp i32 2 to double
  %".786" = fdiv double %".784", %".785"
  %".787" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".788" = call i32 (i8*, ...) @"printf"(i8* %".787", double %".786")
  %".789" = sitofp i32 2 to double
  %".790" = sitofp i32 9 to double
  %".791" = call double @"llvm.pow.f64"(double %".789", double %".790")
  %".792" = sitofp i32 78 to double
  %".793" = fdiv double %".792", %".791"
  %".794" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".795" = call i32 (i8*, ...) @"printf"(i8* %".794", double %".793")
  %".796" = sitofp i32 99 to double
  %".797" = sitofp i32 2 to double
  %".798" = call double @"llvm.pow.f64"(double %".796", double %".797")
  %".799" = sitofp i32 28 to double
  %".800" = fdiv double %".799", %".798"
  %".801" = sitofp i32 6 to double
  %".802" = fadd double %".800", %".801"
  %".803" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".804" = call i32 (i8*, ...) @"printf"(i8* %".803", double %".802")
  %".805" = sitofp i32 5 to double
  %".806" = sitofp i32 5 to double
  %".807" = call double @"llvm.pow.f64"(double %".805", double %".806")
  %".808" = sitofp i32 2 to double
  %".809" = fadd double %".807", %".808"
  %".810" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".811" = call i32 (i8*, ...) @"printf"(i8* %".810", double %".809")
  %".812" = sitofp i32 78 to double
  %".813" = sitofp i32 25 to double
  %".814" = call double @"llvm.pow.f64"(double %".812", double %".813")
  %".815" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".816" = call i32 (i8*, ...) @"printf"(i8* %".815", double %".814")
  %".817" = sitofp i32 125 to double
  %".818" = sitofp i32 5 to double
  %".819" = call double @"llvm.pow.f64"(double %".817", double %".818")
  %".820" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".821" = call i32 (i8*, ...) @"printf"(i8* %".820", double %".819")
  %".822" = sitofp i32 83 to double
  %".823" = sitofp i32 555 to double
  %".824" = call double @"llvm.pow.f64"(double %".822", double %".823")
  %".825" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".826" = call i32 (i8*, ...) @"printf"(i8* %".825", double %".824")
  %".827" = sitofp i32 78 to double
  %".828" = sitofp i32 2 to double
  %".829" = call double @"llvm.pow.f64"(double %".827", double %".828")
  %".830" = sitofp i32 5 to double
  %".831" = fadd double %".829", %".830"
  %".832" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".833" = call i32 (i8*, ...) @"printf"(i8* %".832", double %".831")
  ret i32 0
}

@"str.8614526078827892535" = internal constant [21 x i8] c"aaaaaaaaaaaaaaaaaaaa\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
declare double @"llvm.pow.f64"(double %".1", double %".2")

@"fmt_float" = internal constant [4 x i8] c"%f\0a\00"
@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"
@"str.-4147706418640457278" = internal constant [12 x i8] c"Hola muando\00"
@"str.-243526121489466537" = internal constant [5 x i8] c"HOLA\00"
@"str.-9030441063410903703" = internal constant [4 x i8] c"Bry\00"
@"str.3727467149672926427" = internal constant [11 x i8] c"La suma es\00"
@"str.-8235756114048028134" = internal constant [73 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH\00"
@"str.6942253003426234221" = internal constant [19 x i8] c"pruebaaaaaaaaaaaas\00"
@"str.-2517158501142655426" = internal constant [2 x i8] c" \00"
@"str.3367655142947562995" = internal constant [24 x i8] c"operaciones matematicas\00"
@"str.-4916251825178103908" = internal constant [7 x i8] c"x > 15\00"
@"str.8675918905311110973" = internal constant [11 x i8] c"x es <= 15\00"