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
  %"resultado" = alloca i32
  store i32 1, i32* %"resultado"
  %"exponente.1" = load i32, i32* %"exponente"
  %".7" = icmp eq i32 %"exponente.1", 0
  br i1 %".7", label %"then", label %"else"
then:
  ret i32 1
else:
  br label %"ifcont"
ifcont:
  %"exponente.2" = load i32, i32* %"exponente"
  %".11" = icmp slt i32 %"exponente.2", 0
  br i1 %".11", label %"then.1", label %"else.1"
then.1:
  ret i32 0
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"i_pot" = alloca i32
  store i32 0, i32* %"i_pot"
  store i32 0, i32* %"i_pot"
  br label %"for.cond"
for.cond:
  %"i_pot.1" = load i32, i32* %"i_pot"
  %"exponente.3" = load i32, i32* %"exponente"
  %".18" = icmp slt i32 %"i_pot.1", %"exponente.3"
  br i1 %".18", label %"for.body", label %"for.exit"
for.body:
  %"resultado.1" = load i32, i32* %"resultado"
  %"base.1" = load i32, i32* %"base"
  %".20" = mul i32 %"resultado.1", %"base.1"
  store i32 %".20", i32* %"resultado"
  br label %"for.inc"
for.inc:
  %"i_pot.2" = load i32, i32* %"i_pot"
  %"i_pot.3" = load i32, i32* %"i_pot"
  %".23" = add i32 %"i_pot.3", 1
  store i32 %".23", i32* %"i_pot"
  br label %"for.cond"
for.exit:
  %"resultado.2" = load i32, i32* %"resultado"
  ret i32 %"resultado.2"
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
  %"suma_val" = alloca i32
  store i32 0, i32* %"suma_val"
  %"contador" = alloca i32
  store i32 1, i32* %"contador"
  br label %"while.cond"
while.cond:
  %"contador.1" = load i32, i32* %"contador"
  %"n.1" = load i32, i32* %"n"
  %".7" = icmp sle i32 %"contador.1", %"n.1"
  br i1 %".7", label %"while.body", label %"while.end"
while.body:
  %"suma_val.1" = load i32, i32* %"suma_val"
  %"contador.2" = load i32, i32* %"contador"
  %".9" = add i32 %"suma_val.1", %"contador.2"
  store i32 %".9", i32* %"suma_val"
  %"contador.3" = load i32, i32* %"contador"
  %".11" = add i32 %"contador.3", 1
  store i32 %".11", i32* %"contador"
  br label %"while.cond"
while.end:
  %"suma_val.2" = load i32, i32* %"suma_val"
  ret i32 %"suma_val.2"
}

define i32 @"contarHasta"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  %"i_ch" = alloca i32
  store i32 0, i32* %"i_ch"
  store i32 1, i32* %"i_ch"
  br label %"for.cond"
for.cond:
  %"i_ch.1" = load i32, i32* %"i_ch"
  %"n.1" = load i32, i32* %"n"
  %".7" = icmp sle i32 %"i_ch.1", %"n.1"
  br i1 %".7", label %"for.body", label %"for.exit"
for.body:
  %"i_ch.2" = load i32, i32* %"i_ch"
  %".9" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"i_ch.2")
  %"i_ch.3" = load i32, i32* %"i_ch"
  %".11" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"i_ch.3")
  br label %"for.inc"
for.inc:
  %"i_ch.4" = load i32, i32* %"i_ch"
  %"i_ch.5" = load i32, i32* %"i_ch"
  %".14" = add i32 %"i_ch.5", 1
  store i32 %".14", i32* %"i_ch"
  br label %"for.cond"
for.exit:
  ret i32 0
}

define i32 @"funcionA"(i32 %".1")
{
entry:
  %"n_fa" = alloca i32
  store i32 %".1", i32* %"n_fa"
  %"n_fa.1" = load i32, i32* %"n_fa"
  %".4" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"n_fa.1")
  %"n_fa.2" = load i32, i32* %"n_fa"
  %".6" = mul i32 %"n_fa.2", 2
  ret i32 %".6"
}

define i32 @"funcionB"(i32 %".1")
{
entry:
  %"x_param_fb" = alloca i32
  store i32 %".1", i32* %"x_param_fb"
  %"x_param_fb.1" = load i32, i32* %"x_param_fb"
  %".4" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"x_param_fb.1")
  %"temp_fb" = alloca i32
  %"x_param_fb.2" = load i32, i32* %"x_param_fb"
  %".6" = call i32 @"funcionA"(i32 %"x_param_fb.2")
  store i32 %".6", i32* %"temp_fb"
  %"temp_fb.1" = load i32, i32* %"temp_fb"
  %".8" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"temp_fb.1")
  %"temp_fb.2" = load i32, i32* %"temp_fb"
  %".10" = mul i32 %"temp_fb.2", 3
  ret i32 %".10"
}

define i32 @"doble"(i32 %".1")
{
entry:
  %"a_param_d" = alloca i32
  store i32 %".1", i32* %"a_param_d"
  %"a_param_d.1" = load i32, i32* %"a_param_d"
  %".4" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"a_param_d.1")
  %"a_param_d.2" = load i32, i32* %"a_param_d"
  %".6" = mul i32 %"a_param_d.2", 2
  ret i32 %".6"
}

define i32 @"suma"()
{
entry:
  %"num1_s" = alloca i32
  store i32 10, i32* %"num1_s"
  %"num2_s" = alloca i32
  store i32 20, i32* %"num2_s"
  %"num3_s" = alloca i32
  store i32 30, i32* %"num3_s"
  %"resultado_s" = alloca i32
  %"num1_s.1" = load i32, i32* %"num1_s"
  %"num2_s.1" = load i32, i32* %"num2_s"
  %".5" = add i32 %"num1_s.1", %"num2_s.1"
  %"num3_s.1" = load i32, i32* %"num3_s"
  %".6" = add i32 %".5", %"num3_s.1"
  store i32 %".6", i32* %"resultado_s"
  %"resultado_s.1" = load i32, i32* %"resultado_s"
  %".8" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"resultado_s.1")
  %"resultado_s.2" = load i32, i32* %"resultado_s"
  ret i32 %"resultado_s.2"
}

define i32 @"fibonacci"(i32 %".1")
{
entry:
  %"n_fib" = alloca i32
  store i32 %".1", i32* %"n_fib"
  %"n_fib.1" = load i32, i32* %"n_fib"
  %".4" = icmp eq i32 %"n_fib.1", 0
  br i1 %".4", label %"then", label %"else"
then:
  ret i32 0
else:
  br label %"ifcont"
ifcont:
  %"n_fib.2" = load i32, i32* %"n_fib"
  %".8" = icmp eq i32 %"n_fib.2", 1
  br i1 %".8", label %"then.1", label %"else.1"
then.1:
  ret i32 1
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"n_fib.3" = load i32, i32* %"n_fib"
  %".12" = icmp slt i32 %"n_fib.3", 0
  br i1 %".12", label %"then.2", label %"else.2"
then.2:
  %".14" = sub i32 0, 1
  ret i32 %".14"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"n_fib.4" = load i32, i32* %"n_fib"
  %".17" = icmp sgt i32 %"n_fib.4", 20
  br i1 %".17", label %"then.3", label %"else.3"
then.3:
  %".19" = call i32 @"fibonacci"(i32 20)
  ret i32 %".19"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"n_fib.5" = load i32, i32* %"n_fib"
  %".22" = sub i32 %"n_fib.5", 1
  %".23" = call i32 @"fibonacci"(i32 %".22")
  %"n_fib.6" = load i32, i32* %"n_fib"
  %".24" = sub i32 %"n_fib.6", 2
  %".25" = call i32 @"fibonacci"(i32 %".24")
  %".26" = add i32 %".23", %".25"
  ret i32 %".26"
}

define i32 @"multiplicar"(i32 %".1", i32 %".2")
{
entry:
  %"a_m" = alloca i32
  store i32 %".1", i32* %"a_m"
  %"b_m" = alloca i32
  store i32 %".2", i32* %"b_m"
  %"a_m.1" = load i32, i32* %"a_m"
  %".6" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"a_m.1")
  %"b_m.1" = load i32, i32* %"b_m"
  %".8" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"b_m.1")
  %"a_m.2" = load i32, i32* %"a_m"
  %"b_m.2" = load i32, i32* %"b_m"
  %".10" = mul i32 %"a_m.2", %"b_m.2"
  ret i32 %".10"
}

define double @"dividir"(double %".1", double %".2")
{
entry:
  %"num_d" = alloca double
  store double %".1", double* %"num_d"
  %"den_d" = alloca double
  store double %".2", double* %"den_d"
  %"num_d.1" = load double, double* %"num_d"
  %".6" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", double %"num_d.1")
  %"den_d.1" = load double, double* %"den_d"
  %".8" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", double %"den_d.1")
  %"den_d.2" = load double, double* %"den_d"
  %".10" = fcmp oeq double %"den_d.2",              0x0
  br i1 %".10", label %"then", label %"else"
then:
  ret double              0x0
else:
  br label %"ifcont"
ifcont:
  %"num_d.2" = load double, double* %"num_d"
  %"den_d.3" = load double, double* %"den_d"
  %".14" = fdiv double %"num_d.2", %"den_d.3"
  ret double %".14"
}

define i1 @"esPar"(i32 %".1")
{
entry:
  %"num_ep" = alloca i32
  store i32 %".1", i32* %"num_ep"
  %"num_ep.1" = load i32, i32* %"num_ep"
  %".4" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"num_ep.1")
  %"num_ep.2" = load i32, i32* %"num_ep"
  %".6" = srem i32 %"num_ep.2", 2
  %".7" = icmp eq i32 %".6", 0
  br i1 %".7", label %"then", label %"else"
then:
  ret i1 1
else:
  ret i1 0
ifcont:
  ret i1 0
}

define i32 @"calcularAreaCuadrado"(i32 %".1")
{
entry:
  %"lado_cac" = alloca i32
  store i32 %".1", i32* %"lado_cac"
  %"lado_cac.1" = load i32, i32* %"lado_cac"
  %".4" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"lado_cac.1")
  %"lado_cac.2" = load i32, i32* %"lado_cac"
  %"lado_cac.3" = load i32, i32* %"lado_cac"
  %".6" = mul i32 %"lado_cac.2", %"lado_cac.3"
  ret i32 %".6"
}

define i32 @"calcularAreaRectangulo"(i32 %".1", i32 %".2")
{
entry:
  %"base_car" = alloca i32
  store i32 %".1", i32* %"base_car"
  %"altura_car" = alloca i32
  store i32 %".2", i32* %"altura_car"
  %"base_car.1" = load i32, i32* %"base_car"
  %".6" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"base_car.1")
  %"altura_car.1" = load i32, i32* %"altura_car"
  %".8" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"altura_car.1")
  %"base_car.2" = load i32, i32* %"base_car"
  %"altura_car.2" = load i32, i32* %"altura_car"
  %".10" = mul i32 %"base_car.2", %"altura_car.2"
  ret i32 %".10"
}

define i32 @"procesarNumero"(i32 %".1")
{
entry:
  %"num_pn" = alloca i32
  store i32 %".1", i32* %"num_pn"
  %"num_pn.1" = load i32, i32* %"num_pn"
  %".4" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"num_pn.1")
  %"num_pn.2" = load i32, i32* %"num_pn"
  %".6" = icmp sgt i32 %"num_pn.2", 0
  br i1 %".6", label %"then", label %"else"
then:
  %"num_pn.3" = load i32, i32* %"num_pn"
  %".8" = mul i32 %"num_pn.3", 10
  ret i32 %".8"
else:
  br label %"ifcont"
ifcont:
  %"num_pn.4" = load i32, i32* %"num_pn"
  %".11" = icmp slt i32 %"num_pn.4", 0
  br i1 %".11", label %"then.1", label %"else.1"
then.1:
  %"num_pn.5" = load i32, i32* %"num_pn"
  %".13" = mul i32 %"num_pn.5", 2
  ret i32 %".13"
else.1:
  br label %"ifcont.1"
ifcont.1:
  ret i32 0
}

define i32 @"factorial"(i32 %".1")
{
entry:
  %"n_fact" = alloca i32
  store i32 %".1", i32* %"n_fact"
  %"n_fact.1" = load i32, i32* %"n_fact"
  %".4" = icmp slt i32 %"n_fact.1", 0
  br i1 %".4", label %"then", label %"else"
then:
  %".6" = sub i32 0, 1
  ret i32 %".6"
else:
  br label %"ifcont"
ifcont:
  %"n_fact.2" = load i32, i32* %"n_fact"
  %".9" = icmp eq i32 %"n_fact.2", 0
  br i1 %".9", label %"then.1", label %"else.1"
then.1:
  ret i32 1
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"n_fact.3" = load i32, i32* %"n_fact"
  %".13" = icmp sgt i32 %"n_fact.3", 10
  br i1 %".13", label %"then.2", label %"else.2"
then.2:
  store i32 10, i32* %"n_fact"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"resultado_fact" = alloca i32
  store i32 1, i32* %"resultado_fact"
  %"i_fact" = alloca i32
  store i32 1, i32* %"i_fact"
  store i32 1, i32* %"i_fact"
  br label %"for.cond"
for.cond:
  %"i_fact.1" = load i32, i32* %"i_fact"
  %"n_fact.4" = load i32, i32* %"n_fact"
  %".22" = icmp sle i32 %"i_fact.1", %"n_fact.4"
  br i1 %".22", label %"for.body", label %"for.exit"
for.body:
  %"resultado_fact.1" = load i32, i32* %"resultado_fact"
  %"i_fact.2" = load i32, i32* %"i_fact"
  %".24" = mul i32 %"resultado_fact.1", %"i_fact.2"
  store i32 %".24", i32* %"resultado_fact"
  br label %"for.inc"
for.inc:
  %"i_fact.3" = load i32, i32* %"i_fact"
  %"i_fact.4" = load i32, i32* %"i_fact"
  %".27" = add i32 %"i_fact.4", 1
  store i32 %".27", i32* %"i_fact"
  br label %"for.cond"
for.exit:
  %"n_fact.5" = load i32, i32* %"n_fact"
  %".30" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"n_fact.5")
  %"resultado_fact.2" = load i32, i32* %"resultado_fact"
  %".32" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"resultado_fact.2")
  %"resultado_fact.3" = load i32, i32* %"resultado_fact"
  ret i32 %"resultado_fact.3"
}

define double @"toFloat"(i32 %".1")
{
entry:
  %"val_tf" = alloca i32
  store i32 %".1", i32* %"val_tf"
  %"val_tf.1" = load i32, i32* %"val_tf"
  %".4" = sitofp i32 %"val_tf.1" to double
  %".5" = fdiv double %".4", 0x3ff0000000000000
  ret double %".5"
}

define i32 @"calcularTriple"(i32 %".1")
{
entry:
  %"n_ct" = alloca i32
  store i32 %".1", i32* %"n_ct"
  %"n_ct.1" = load i32, i32* %"n_ct"
  %".4" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"n_ct.1")
  %"n_ct.2" = load i32, i32* %"n_ct"
  %".6" = mul i32 %"n_ct.2", 3
  ret i32 %".6"
}

define double @"calcularPromedio"(double %".1", double %".2", double %".3")
{
entry:
  %"a_cp" = alloca double
  store double %".1", double* %"a_cp"
  %"b_cp" = alloca double
  store double %".2", double* %"b_cp"
  %"c_cp" = alloca double
  store double %".3", double* %"c_cp"
  %"a_cp.1" = load double, double* %"a_cp"
  %".8" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", double %"a_cp.1")
  %"b_cp.1" = load double, double* %"b_cp"
  %".10" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", double %"b_cp.1")
  %"c_cp.1" = load double, double* %"c_cp"
  %".12" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", double %"c_cp.1")
  %"a_cp.2" = load double, double* %"a_cp"
  %"b_cp.2" = load double, double* %"b_cp"
  %".14" = fadd double %"a_cp.2", %"b_cp.2"
  %"c_cp.2" = load double, double* %"c_cp"
  %".15" = fadd double %".14", %"c_cp.2"
  %".16" = fdiv double %".15", 0x4008000000000000
  ret double %".16"
}

define i1 @"esPositivo"(i32 %".1")
{
entry:
  %"n_epos" = alloca i32
  store i32 %".1", i32* %"n_epos"
  %"n_epos.1" = load i32, i32* %"n_epos"
  %".4" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"n_epos.1")
  %"n_epos.2" = load i32, i32* %"n_epos"
  %".6" = icmp sgt i32 %"n_epos.2", 0
  br i1 %".6", label %"then", label %"else"
then:
  ret i1 1
else:
  br label %"ifcont"
ifcont:
  ret i1 0
}

define i32 @"main"()
{
entry:
  %".2" = sitofp i32 55 to double
  %".3" = sitofp i32 5 to double
  %".4" = call double @"llvm.pow.f64"(double %".2", double %".3")
  %".5" = sitofp i32 5 to double
  %".6" = fdiv double %".4", %".5"
  %".7" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", double %".6")
  %".9" = sitofp i32 5 to double
  %".10" = sitofp i32 3 to double
  %".11" = call double @"llvm.pow.f64"(double %".9", double %".10")
  %".12" = sitofp i32 99 to double
  %".13" = fmul double %".12", %".11"
  %".14" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", double %".13")
  %".16" = sitofp i32 3000 to double
  %".17" = sitofp i32 4 to double
  %".18" = fdiv double %".16", %".17"
  %".19" = sitofp i32 9000 to double
  %".20" = fmul double %".18", %".19"
  %".21" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21", double %".20")
  %".23" = sub i32 88, 2
  %".24" = mul i32 85, 18
  %".25" = sitofp i32 100 to double
  %".26" = sitofp i32 4 to double
  %".27" = call double @"llvm.pow.f64"(double %".25", double %".26")
  %".28" = sitofp i32 %".24" to double
  %".29" = fdiv double %".28", %".27"
  %".30" = sitofp i32 %".23" to double
  %".31" = fadd double %".30", %".29"
  %".32" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32", double %".31")
  %".34" = sitofp i32 100 to double
  %".35" = sitofp i32 2 to double
  %".36" = fdiv double %".34", %".35"
  %".37" = sitofp i32 88 to double
  %".38" = fmul double %".36", %".37"
  %".39" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".39", double %".38")
  %".41" = sitofp i32 58 to double
  %".42" = sitofp i32 58 to double
  %".43" = call double @"llvm.pow.f64"(double %".41", double %".42")
  %".44" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".44", double %".43")
  %"zz" = alloca i32
  store i32 33, i32* %"zz"
  %"zz.1" = load i32, i32* %"zz"
  %".47" = sitofp i32 2 to double
  %".48" = sitofp i32 %"zz.1" to double
  %".49" = call double @"llvm.pow.f64"(double %".47", double %".48")
  %".50" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50", double %".49")
  %".52" = sitofp i32 5 to double
  %".53" = sitofp i32 5 to double
  %".54" = call double @"llvm.pow.f64"(double %".52", double %".53")
  %".55" = sitofp i32 200 to double
  %".56" = fadd double %".54", %".55"
  %".57" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".57", double %".56")
  %".59" = sitofp i32 8 to double
  %".60" = sitofp i32 88 to double
  %".61" = call double @"llvm.pow.f64"(double %".59", double %".60")
  %".62" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".62", double %".61")
  %".64" = sitofp i32 200 to double
  %".65" = sitofp i32 50 to double
  %".66" = call double @"llvm.pow.f64"(double %".64", double %".65")
  %".67" = sitofp i32 50 to double
  %".68" = fdiv double %".66", %".67"
  %".69" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".69", double %".68")
  %".71" = sitofp i32 88 to double
  %".72" = sitofp i32 8 to double
  %".73" = call double @"llvm.pow.f64"(double %".71", double %".72")
  %".74" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".74", double %".73")
  %".76" = sitofp i32 70 to double
  %".77" = sitofp i32 5 to double
  %".78" = call double @"llvm.pow.f64"(double %".76", double %".77")
  %".79" = sitofp i32 8 to double
  %".80" = fdiv double %".78", %".79"
  %".81" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".81", double %".80")
  %".83" = sitofp i32 18 to double
  %".84" = sitofp i32 4 to double
  %".85" = call double @"llvm.pow.f64"(double %".83", double %".84")
  %".86" = sitofp i32 2 to double
  %".87" = fmul double %".86", %".85"
  %".88" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".89" = call i32 (i8*, ...) @"printf"(i8* %".88", double %".87")
  %"num4" = alloca i32
  store i32 50, i32* %"num4"
  %"num5" = alloca i32
  store i32 50, i32* %"num5"
  %"num4.1" = load i32, i32* %"num4"
  %"num5.1" = load i32, i32* %"num5"
  %".92" = sitofp i32 %"num4.1" to double
  %".93" = sitofp i32 %"num5.1" to double
  %".94" = call double @"llvm.pow.f64"(double %".92", double %".93")
  %".95" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".96" = call i32 (i8*, ...) @"printf"(i8* %".95", double %".94")
  %".97" = sitofp i32 50 to double
  %".98" = sitofp i32 50 to double
  %".99" = call double @"llvm.pow.f64"(double %".97", double %".98")
  %".100" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".101" = call i32 (i8*, ...) @"printf"(i8* %".100", double %".99")
  %".102" = sitofp i32 88 to double
  %".103" = sitofp i32 75 to double
  %".104" = call double @"llvm.pow.f64"(double %".102", double %".103")
  %".105" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".106" = call i32 (i8*, ...) @"printf"(i8* %".105", double %".104")
  %"d_val" = alloca i32
  store i32 90, i32* %"d_val"
  %"d_val.1" = load i32, i32* %"d_val"
  %".108" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".109" = call i32 (i8*, ...) @"printf"(i8* %".108", i32 %"d_val.1")
  %"num4.2" = load i32, i32* %"num4"
  %"num4.3" = load i32, i32* %"num4"
  %".110" = sitofp i32 %"num4.2" to double
  %".111" = sitofp i32 %"num4.3" to double
  %".112" = call double @"llvm.pow.f64"(double %".110", double %".111")
  %".113" = sitofp i32 2 to double
  %".114" = fdiv double %".112", %".113"
  %".115" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".116" = call i32 (i8*, ...) @"printf"(i8* %".115", double %".114")
  %"num4.4" = load i32, i32* %"num4"
  %".117" = sitofp i32 %"num4.4" to double
  %".118" = sitofp i32 50 to double
  %".119" = call double @"llvm.pow.f64"(double %".117", double %".118")
  %".120" = sitofp i32 2 to double
  %".121" = fdiv double %".119", %".120"
  %".122" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".123" = call i32 (i8*, ...) @"printf"(i8* %".122", double %".121")
  %"num5.2" = load i32, i32* %"num5"
  %".124" = sitofp i32 50 to double
  %".125" = sitofp i32 %"num5.2" to double
  %".126" = call double @"llvm.pow.f64"(double %".124", double %".125")
  %".127" = sitofp i32 20 to double
  %".128" = fdiv double %".126", %".127"
  %".129" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".130" = call i32 (i8*, ...) @"printf"(i8* %".129", double %".128")
  %"w" = alloca i32
  store i32 0, i32* %"w"
  br label %"for.cond"
for.cond:
  %"w.1" = load i32, i32* %"w"
  %".133" = icmp sle i32 %"w.1", 20
  br i1 %".133", label %"for.body", label %"for.exit"
for.body:
  %"num4.5" = load i32, i32* %"num4"
  %"w.2" = load i32, i32* %"w"
  %".135" = sitofp i32 %"num4.5" to double
  %".136" = sitofp i32 %"w.2" to double
  %".137" = call double @"llvm.pow.f64"(double %".135", double %".136")
  %"num5.3" = load i32, i32* %"num5"
  %".138" = sitofp i32 %"num5.3" to double
  %".139" = fdiv double %".137", %".138"
  %".140" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".141" = call i32 (i8*, ...) @"printf"(i8* %".140", double %".139")
  %"w.3" = load i32, i32* %"w"
  %".142" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".143" = call i32 (i8*, ...) @"printf"(i8* %".142", i32 %"w.3")
  br label %"for.inc"
for.inc:
  %"w.4" = load i32, i32* %"w"
  %"w.5" = load i32, i32* %"w"
  %".145" = add i32 %"w.5", 1
  store i32 %".145", i32* %"w"
  br label %"for.cond"
for.exit:
  %".148" = mul i32 18, 2
  %".149" = mul i32 5, 10
  %".150" = sitofp i32 %".149" to double
  %".151" = sitofp i32 8 to double
  %".152" = fdiv double %".150", %".151"
  %".153" = sitofp i32 %".148" to double
  %".154" = fadd double %".153", %".152"
  %".155" = mul i32 5, 2
  %".156" = sitofp i32 %".155" to double
  %".157" = fadd double %".154", %".156"
  %".158" = sitofp i32 800000 to double
  %".159" = fadd double %".157", %".158"
  %".160" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".161" = call i32 (i8*, ...) @"printf"(i8* %".160", double %".159")
  %".162" = mul i32 88, 88
  %".163" = mul i32 %".162", 88
  %".164" = mul i32 %".163", 88
  %".165" = mul i32 %".164", 88
  %".166" = mul i32 %".165", 5
  %".167" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".168" = call i32 (i8*, ...) @"printf"(i8* %".167", i32 %".166")
  %".169" = sitofp i32 42 to double
  %".170" = sitofp i32 5 to double
  %".171" = call double @"llvm.pow.f64"(double %".169", double %".170")
  %".172" = sitofp i32 2 to double
  %".173" = fdiv double %".171", %".172"
  %".174" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".175" = call i32 (i8*, ...) @"printf"(i8* %".174", double %".173")
  %".176" = sitofp i32 2 to double
  %".177" = sitofp i32 9 to double
  %".178" = call double @"llvm.pow.f64"(double %".176", double %".177")
  %".179" = sitofp i32 78 to double
  %".180" = fdiv double %".179", %".178"
  %".181" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".182" = call i32 (i8*, ...) @"printf"(i8* %".181", double %".180")
  %".183" = sitofp i32 99 to double
  %".184" = sitofp i32 2 to double
  %".185" = call double @"llvm.pow.f64"(double %".183", double %".184")
  %".186" = sitofp i32 28 to double
  %".187" = fdiv double %".186", %".185"
  %".188" = sitofp i32 6 to double
  %".189" = fadd double %".187", %".188"
  %".190" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".191" = call i32 (i8*, ...) @"printf"(i8* %".190", double %".189")
  %"i_main" = alloca i32
  store i32 0, i32* %"i_main"
  br label %"for.cond.1"
for.cond.1:
  %"i_main.1" = load i32, i32* %"i_main"
  %".194" = icmp sle i32 %"i_main.1", 25
  br i1 %".194", label %"for.body.1", label %"for.exit.1"
for.body.1:
  %"i_main.2" = load i32, i32* %"i_main"
  %".196" = sitofp i32 2 to double
  %".197" = sitofp i32 %"i_main.2" to double
  %".198" = call double @"llvm.pow.f64"(double %".196", double %".197")
  %".199" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".200" = call i32 (i8*, ...) @"printf"(i8* %".199", double %".198")
  %"i_main.3" = load i32, i32* %"i_main"
  %".201" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".202" = call i32 (i8*, ...) @"printf"(i8* %".201", i32 %"i_main.3")
  %"i_main.4" = load i32, i32* %"i_main"
  %"i_main.5" = load i32, i32* %"i_main"
  %".203" = mul i32 %"i_main.4", %"i_main.5"
  %"i_main.6" = load i32, i32* %"i_main"
  %".204" = sub i32 %".203", %"i_main.6"
  %".205" = add i32 %".204", 100
  %".206" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".207" = call i32 (i8*, ...) @"printf"(i8* %".206", i32 %".205")
  br label %"for.inc.1"
for.inc.1:
  %"i_main.7" = load i32, i32* %"i_main"
  %"i_main.8" = load i32, i32* %"i_main"
  %".209" = add i32 %"i_main.8", 1
  store i32 %".209", i32* %"i_main"
  br label %"for.cond.1"
for.exit.1:
  %".212" = sitofp i32 5 to double
  %".213" = sitofp i32 5 to double
  %".214" = call double @"llvm.pow.f64"(double %".212", double %".213")
  %".215" = sitofp i32 2 to double
  %".216" = fadd double %".214", %".215"
  %".217" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".218" = call i32 (i8*, ...) @"printf"(i8* %".217", double %".216")
  %".219" = sitofp i32 78 to double
  %".220" = sitofp i32 25 to double
  %".221" = call double @"llvm.pow.f64"(double %".219", double %".220")
  %".222" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".223" = call i32 (i8*, ...) @"printf"(i8* %".222", double %".221")
  %".224" = sitofp i32 125 to double
  %".225" = sitofp i32 5 to double
  %".226" = call double @"llvm.pow.f64"(double %".224", double %".225")
  %".227" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".228" = call i32 (i8*, ...) @"printf"(i8* %".227", double %".226")
  %".229" = sitofp i32 83 to double
  %".230" = sitofp i32 55 to double
  %".231" = call double @"llvm.pow.f64"(double %".229", double %".230")
  %".232" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".233" = call i32 (i8*, ...) @"printf"(i8* %".232", double %".231")
  %".234" = sitofp i32 78 to double
  %".235" = sitofp i32 2 to double
  %".236" = call double @"llvm.pow.f64"(double %".234", double %".235")
  %".237" = sitofp i32 5 to double
  %".238" = fadd double %".236", %".237"
  %".239" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".240" = call i32 (i8*, ...) @"printf"(i8* %".239", double %".238")
  %"div_main" = alloca double
  %".241" = sitofp i32 100 to double
  %".242" = sitofp i32 5 to double
  %".243" = fdiv double %".241", %".242"
  store double %".243", double* %"div_main"
  %"div_main.1" = load double, double* %"div_main"
  %".245" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".246" = call i32 (i8*, ...) @"printf"(i8* %".245", double %"div_main.1")
  %".247" = mul i32 3, 5
  %".248" = add i32 %".247", 2
  %".249" = sub i32 %".248", 88
  %".250" = sitofp i32 250 to double
  %".251" = sitofp i32 2 to double
  %".252" = fdiv double %".250", %".251"
  %".253" = sitofp i32 %".249" to double
  %".254" = fadd double %".253", %".252"
  %".255" = mul i32 789, 2
  %".256" = sitofp i32 %".255" to double
  %".257" = fadd double %".254", %".256"
  %".258" = mul i32 56, 2
  %".259" = sitofp i32 %".258" to double
  %".260" = fadd double %".257", %".259"
  %".261" = sitofp i32 300 to double
  %".262" = fadd double %".260", %".261"
  %".263" = sitofp i32 7896 to double
  %".264" = fsub double %".262", %".263"
  %".265" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".266" = call i32 (i8*, ...) @"printf"(i8* %".265", double %".264")
  %".267" = sitofp i32 23 to double
  %".268" = sitofp i32 23 to double
  %".269" = call double @"llvm.pow.f64"(double %".267", double %".268")
  %".270" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".271" = call i32 (i8*, ...) @"printf"(i8* %".270", double %".269")
  %"var_main" = alloca i32
  store i32 5, i32* %"var_main"
  %"t_main" = alloca double
  %".273" = sitofp i32 88 to double
  %".274" = sitofp i32 6 to double
  %".275" = call double @"llvm.pow.f64"(double %".273", double %".274")
  %".276" = mul i32 250, 2
  %".277" = sitofp i32 %".276" to double
  %".278" = fadd double %".275", %".277"
  store double %".278", double* %"t_main"
  %"t_main.1" = load double, double* %"t_main"
  %".280" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".281" = call i32 (i8*, ...) @"printf"(i8* %".280", double %"t_main.1")
  %"t_main.2" = load double, double* %"t_main"
  %".282" = sitofp i32 10 to double
  %".283" = fsub double %"t_main.2", %".282"
  store double %".283", double* %"t_main"
  %"var_main.1" = load i32, i32* %"var_main"
  %".285" = sitofp i32 250 to double
  %".286" = sitofp i32 2 to double
  %".287" = call double @"llvm.pow.f64"(double %".285", double %".286")
  %".288" = sitofp i32 %"var_main.1" to double
  %".289" = fadd double %".288", %".287"
  %".290" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".291" = call i32 (i8*, ...) @"printf"(i8* %".290", double %".289")
  %"var_main.2" = load i32, i32* %"var_main"
  %".292" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".293" = call i32 (i8*, ...) @"printf"(i8* %".292", i32 %"var_main.2")
  store i32 2, i32* %"var_main"
  %"var_main.3" = load i32, i32* %"var_main"
  %".295" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".296" = call i32 (i8*, ...) @"printf"(i8* %".295", i32 %"var_main.3")
  %"p_main" = alloca i32
  store i32 10, i32* %"p_main"
  br label %"while.cond"
while.cond:
  %"p_main.1" = load i32, i32* %"p_main"
  %".299" = icmp sge i32 %"p_main.1", 0
  br i1 %".299", label %"while.body", label %"while.end"
while.body:
  %"p_main.2" = load i32, i32* %"p_main"
  %".301" = mul i32 %"p_main.2", 100
  %".302" = sub i32 %".301", 50
  %".303" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".304" = call i32 (i8*, ...) @"printf"(i8* %".303", i32 %".302")
  %"p_main.3" = load i32, i32* %"p_main"
  %".305" = sub i32 %"p_main.3", 1
  store i32 %".305", i32* %"p_main"
  br label %"while.cond"
while.end:
  %"var_main.4" = load i32, i32* %"var_main"
  %".308" = sitofp i32 2 to double
  %".309" = sitofp i32 %"var_main.4" to double
  %".310" = call double @"llvm.pow.f64"(double %".308", double %".309")
  %".311" = sitofp i32 200 to double
  %".312" = sitofp i32 2 to double
  %".313" = call double @"llvm.pow.f64"(double %".311", double %".312")
  %".314" = sitofp i32 55 to double
  %".315" = fmul double %".314", %".313"
  %".316" = mul i32 58, 2
  %".317" = sitofp i32 %".316" to double
  %".318" = fadd double %".315", %".317"
  %".319" = fadd double %".310", %".318"
  %".320" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".321" = call i32 (i8*, ...) @"printf"(i8* %".320", double %".319")
  %".322" = sitofp i32 6 to double
  %".323" = sitofp i32 6 to double
  %".324" = call double @"llvm.pow.f64"(double %".322", double %".323")
  %".325" = sitofp i32 2 to double
  %".326" = fadd double %".324", %".325"
  %".327" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".328" = call i32 (i8*, ...) @"printf"(i8* %".327", double %".326")
  %"x_orig_main" = alloca i32
  store i32 10, i32* %"x_orig_main"
  %"x_main" = alloca i32
  %"x_orig_main.1" = load i32, i32* %"x_orig_main"
  store i32 %"x_orig_main.1", i32* %"x_main"
  %"variable_main" = alloca i32
  store i32 10, i32* %"variable_main"
  %"variable_main.1" = load i32, i32* %"variable_main"
  %".332" = sitofp i32 100 to double
  %".333" = sitofp i32 %"variable_main.1" to double
  %".334" = call double @"llvm.pow.f64"(double %".332", double %".333")
  %".335" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".336" = call i32 (i8*, ...) @"printf"(i8* %".335", double %".334")
  %"variable_main.2" = load i32, i32* %"variable_main"
  %".337" = sitofp i32 55 to double
  %".338" = sitofp i32 %"variable_main.2" to double
  %".339" = call double @"llvm.pow.f64"(double %".337", double %".338")
  %".340" = sitofp i32 300 to double
  %".341" = fadd double %".339", %".340"
  %".342" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".343" = call i32 (i8*, ...) @"printf"(i8* %".342", double %".341")
  %"variable_main.3" = load i32, i32* %"variable_main"
  %".344" = mul i32 300, 55
  %".345" = add i32 %"variable_main.3", %".344"
  %".346" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".347" = call i32 (i8*, ...) @"printf"(i8* %".346", i32 %".345")
  %".348" = add i32 3, 5
  %".349" = mul i32 25, %".348"
  %".350" = sub i32 5, %".349"
  %".351" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".352" = call i32 (i8*, ...) @"printf"(i8* %".351", i32 %".350")
  %"k_main" = alloca i32
  store i32 0, i32* %"k_main"
  br label %"for.cond.2"
for.cond.2:
  %"k_main.1" = load i32, i32* %"k_main"
  %".355" = icmp sle i32 %"k_main.1", 10
  br i1 %".355", label %"for.body.2", label %"for.exit.2"
for.body.2:
  %".357" = add i32 3, 5
  %".358" = mul i32 25, %".357"
  %".359" = sub i32 5, %".358"
  %"k_main.2" = load i32, i32* %"k_main"
  %".360" = mul i32 %"k_main.2", 2
  %".361" = add i32 %".359", %".360"
  %".362" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".363" = call i32 (i8*, ...) @"printf"(i8* %".362", i32 %".361")
  %"k_main.3" = load i32, i32* %"k_main"
  %".364" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".365" = call i32 (i8*, ...) @"printf"(i8* %".364", i32 %"k_main.3")
  br label %"for.inc.2"
for.inc.2:
  %"k_main.4" = load i32, i32* %"k_main"
  %"k_main.5" = load i32, i32* %"k_main"
  %".367" = add i32 %"k_main.5", 1
  store i32 %".367", i32* %"k_main"
  br label %"for.cond.2"
for.exit.2:
  %"z_float_main" = alloca double
  %".370" = sitofp i32 5 to double
  %".371" = sitofp i32 20 to double
  %".372" = call double @"llvm.pow.f64"(double %".370", double %".371")
  store double %".372", double* %"z_float_main"
  %"z_float_main.1" = load double, double* %"z_float_main"
  %".374" = sitofp i32 1 to double
  %".375" = fsub double %"z_float_main.1", %".374"
  %".376" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".377" = call i32 (i8*, ...) @"printf"(i8* %".376", double %".375")
  %"resultadoF_main" = alloca i32
  %".378" = call i32 @"fibonacci"(i32 50)
  store i32 %".378", i32* %"resultadoF_main"
  %"resultadoF_main.1" = load i32, i32* %"resultadoF_main"
  %".380" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".381" = call i32 (i8*, ...) @"printf"(i8* %".380", i32 %"resultadoF_main.1")
  %".382" = mul i32 18, 2
  %".383" = mul i32 5, 10
  %".384" = sitofp i32 %".383" to double
  %".385" = sitofp i32 8 to double
  %".386" = fdiv double %".384", %".385"
  %".387" = sitofp i32 %".382" to double
  %".388" = fadd double %".387", %".386"
  %".389" = mul i32 5, 2
  %".390" = sitofp i32 %".389" to double
  %".391" = fadd double %".388", %".390"
  %".392" = sitofp i32 800000 to double
  %".393" = fadd double %".391", %".392"
  %".394" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".395" = call i32 (i8*, ...) @"printf"(i8* %".394", double %".393")
  %".396" = mul i32 88, 88
  %".397" = mul i32 %".396", 88
  %".398" = mul i32 %".397", 88
  %".399" = mul i32 %".398", 88
  %".400" = mul i32 %".399", 5
  %".401" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".402" = call i32 (i8*, ...) @"printf"(i8* %".401", i32 %".400")
  %".403" = sitofp i32 42 to double
  %".404" = sitofp i32 5 to double
  %".405" = call double @"llvm.pow.f64"(double %".403", double %".404")
  %".406" = sitofp i32 2 to double
  %".407" = fdiv double %".405", %".406"
  %".408" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".409" = call i32 (i8*, ...) @"printf"(i8* %".408", double %".407")
  %".410" = sitofp i32 2 to double
  %".411" = sitofp i32 9 to double
  %".412" = call double @"llvm.pow.f64"(double %".410", double %".411")
  %".413" = sitofp i32 78 to double
  %".414" = fdiv double %".413", %".412"
  %".415" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".416" = call i32 (i8*, ...) @"printf"(i8* %".415", double %".414")
  %".417" = sitofp i32 99 to double
  %".418" = sitofp i32 2 to double
  %".419" = call double @"llvm.pow.f64"(double %".417", double %".418")
  %".420" = sitofp i32 28 to double
  %".421" = fdiv double %".420", %".419"
  %".422" = sitofp i32 6 to double
  %".423" = fadd double %".421", %".422"
  %".424" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".425" = call i32 (i8*, ...) @"printf"(i8* %".424", double %".423")
  %".426" = sitofp i32 5 to double
  %".427" = sitofp i32 5 to double
  %".428" = call double @"llvm.pow.f64"(double %".426", double %".427")
  %".429" = sitofp i32 2 to double
  %".430" = fadd double %".428", %".429"
  %".431" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".432" = call i32 (i8*, ...) @"printf"(i8* %".431", double %".430")
  %".433" = sitofp i32 78 to double
  %".434" = sitofp i32 25 to double
  %".435" = call double @"llvm.pow.f64"(double %".433", double %".434")
  %".436" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".437" = call i32 (i8*, ...) @"printf"(i8* %".436", double %".435")
  %".438" = sitofp i32 125 to double
  %".439" = sitofp i32 5 to double
  %".440" = call double @"llvm.pow.f64"(double %".438", double %".439")
  %".441" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".442" = call i32 (i8*, ...) @"printf"(i8* %".441", double %".440")
  %".443" = sitofp i32 83 to double
  %".444" = sitofp i32 55 to double
  %".445" = call double @"llvm.pow.f64"(double %".443", double %".444")
  %".446" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".447" = call i32 (i8*, ...) @"printf"(i8* %".446", double %".445")
  %".448" = sitofp i32 78 to double
  %".449" = sitofp i32 2 to double
  %".450" = call double @"llvm.pow.f64"(double %".448", double %".449")
  %".451" = sitofp i32 5 to double
  %".452" = fadd double %".450", %".451"
  %".453" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".454" = call i32 (i8*, ...) @"printf"(i8* %".453", double %".452")
  %"yy_main" = alloca i32
  store i32 2, i32* %"yy_main"
  %"yy_main.1" = load i32, i32* %"yy_main"
  %".456" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".457" = call i32 (i8*, ...) @"printf"(i8* %".456", i32 %"yy_main.1")
  %".458" = sitofp i32 55 to double
  %".459" = sitofp i32 5 to double
  %".460" = call double @"llvm.pow.f64"(double %".458", double %".459")
  %".461" = sitofp i32 5 to double
  %".462" = fdiv double %".460", %".461"
  %".463" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".464" = call i32 (i8*, ...) @"printf"(i8* %".463", double %".462")
  %".465" = sitofp i32 5 to double
  %".466" = sitofp i32 3 to double
  %".467" = call double @"llvm.pow.f64"(double %".465", double %".466")
  %".468" = sitofp i32 99 to double
  %".469" = fmul double %".468", %".467"
  %".470" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".471" = call i32 (i8*, ...) @"printf"(i8* %".470", double %".469")
  %".472" = sitofp i32 3000 to double
  %".473" = sitofp i32 4 to double
  %".474" = fdiv double %".472", %".473"
  %".475" = sitofp i32 9000 to double
  %".476" = fmul double %".474", %".475"
  %".477" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".478" = call i32 (i8*, ...) @"printf"(i8* %".477", double %".476")
  %".479" = sub i32 88, 2
  %".480" = mul i32 85, 18
  %".481" = sitofp i32 100 to double
  %".482" = sitofp i32 4 to double
  %".483" = call double @"llvm.pow.f64"(double %".481", double %".482")
  %".484" = sitofp i32 %".480" to double
  %".485" = fdiv double %".484", %".483"
  %".486" = sitofp i32 %".479" to double
  %".487" = fadd double %".486", %".485"
  %".488" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".489" = call i32 (i8*, ...) @"printf"(i8* %".488", double %".487")
  %".490" = sitofp i32 100 to double
  %".491" = sitofp i32 2 to double
  %".492" = fdiv double %".490", %".491"
  %".493" = sitofp i32 88 to double
  %".494" = fmul double %".492", %".493"
  %".495" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".496" = call i32 (i8*, ...) @"printf"(i8* %".495", double %".494")
  %".497" = sitofp i32 58 to double
  %".498" = sitofp i32 58 to double
  %".499" = call double @"llvm.pow.f64"(double %".497", double %".498")
  %".500" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".501" = call i32 (i8*, ...) @"printf"(i8* %".500", double %".499")
  %"zz.2" = load i32, i32* %"zz"
  %".502" = sitofp i32 2 to double
  %".503" = sitofp i32 %"zz.2" to double
  %".504" = call double @"llvm.pow.f64"(double %".502", double %".503")
  %".505" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".506" = call i32 (i8*, ...) @"printf"(i8* %".505", double %".504")
  %"x_orig_main.2" = load i32, i32* %"x_orig_main"
  store i32 %"x_orig_main.2", i32* %"x_main"
  %".508" = mul i32 2, 5
  %".509" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".510" = call i32 (i8*, ...) @"printf"(i8* %".509", i32 %".508")
  %"x_main.1" = load i32, i32* %"x_main"
  %".511" = mul i32 %"x_main.1", 4
  %".512" = add i32 2, %".511"
  %".513" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".514" = call i32 (i8*, ...) @"printf"(i8* %".513", i32 %".512")
  %".515" = add i32 2, 3
  %".516" = mul i32 %".515", 4
  %".517" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".518" = call i32 (i8*, ...) @"printf"(i8* %".517", i32 %".516")
  %".519" = sitofp i32 10 to double
  %".520" = sitofp i32 2 to double
  %".521" = fdiv double %".519", %".520"
  %".522" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".523" = call i32 (i8*, ...) @"printf"(i8* %".522", double %".521")
  %".524" = sitofp i32 2 to double
  %".525" = sitofp i32 3 to double
  %".526" = call double @"llvm.pow.f64"(double %".524", double %".525")
  %".527" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".528" = call i32 (i8*, ...) @"printf"(i8* %".527", double %".526")
  %".529" = sitofp i32 3 to double
  %".530" = sitofp i32 2 to double
  %".531" = call double @"llvm.pow.f64"(double %".529", double %".530")
  %".532" = sitofp i32 2 to double
  %".533" = call double @"llvm.pow.f64"(double %".532", double %".531")
  %".534" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".535" = call i32 (i8*, ...) @"printf"(i8* %".534", double %".533")
  %".536" = mul i32 3, 2
  %".537" = add i32 5, %".536"
  %".538" = sitofp i32 4 to double
  %".539" = sitofp i32 2 to double
  %".540" = fdiv double %".538", %".539"
  %".541" = sitofp i32 %".537" to double
  %".542" = fsub double %".541", %".540"
  %".543" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".544" = call i32 (i8*, ...) @"printf"(i8* %".543", double %".542")
  %".545" = add i32 3, 4
  %".546" = sitofp i32 2 to double
  %".547" = sitofp i32 3 to double
  %".548" = call double @"llvm.pow.f64"(double %".546", double %".547")
  %".549" = sitofp i32 %".545" to double
  %".550" = fmul double %".549", %".548"
  %".551" = sitofp i32 10 to double
  %".552" = sitofp i32 2 to double
  %".553" = fdiv double %".551", %".552"
  %".554" = fsub double %".550", %".553"
  %".555" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".556" = call i32 (i8*, ...) @"printf"(i8* %".555", double %".554")
  %".557" = sitofp i32 5 to double
  %".558" = sitofp i32 2 to double
  %".559" = fdiv double %".557", %".558"
  %".560" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".561" = call i32 (i8*, ...) @"printf"(i8* %".560", double %".559")
  %".562" = sub i32 0, 2
  %".563" = mul i32 4, %".562"
  %".564" = add i32 2, %".563"
  %".565" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".566" = call i32 (i8*, ...) @"printf"(i8* %".565", i32 %".564")
  %"j_main" = alloca i32
  store i32 0, i32* %"j_main"
  br label %"for.cond.3"
for.cond.3:
  %"j_main.1" = load i32, i32* %"j_main"
  %".569" = icmp slt i32 %"j_main.1", 15
  br i1 %".569", label %"for.body.3", label %"for.exit.3"
for.body.3:
  %"j_main.2" = load i32, i32* %"j_main"
  %".571" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".572" = call i32 (i8*, ...) @"printf"(i8* %".571", i32 %"j_main.2")
  %"j_main.3" = load i32, i32* %"j_main"
  %".573" = sitofp i32 2 to double
  %".574" = sitofp i32 %"j_main.3" to double
  %".575" = call double @"llvm.pow.f64"(double %".573", double %".574")
  %".576" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".577" = call i32 (i8*, ...) @"printf"(i8* %".576", double %".575")
  %"j_main.4" = load i32, i32* %"j_main"
  %"j_main.5" = load i32, i32* %"j_main"
  %".578" = mul i32 %"j_main.4", %"j_main.5"
  %".579" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".580" = call i32 (i8*, ...) @"printf"(i8* %".579", i32 %".578")
  br label %"for.inc.3"
for.inc.3:
  %"j_main.6" = load i32, i32* %"j_main"
  %"j_main.7" = load i32, i32* %"j_main"
  %".582" = add i32 %"j_main.7", 1
  store i32 %".582", i32* %"j_main"
  br label %"for.cond.3"
for.exit.3:
  %".585" = sitofp i32 55 to double
  %".586" = sitofp i32 5 to double
  %".587" = call double @"llvm.pow.f64"(double %".585", double %".586")
  %".588" = sitofp i32 5 to double
  %".589" = fdiv double %".587", %".588"
  %".590" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".591" = call i32 (i8*, ...) @"printf"(i8* %".590", double %".589")
  %".592" = sitofp i32 5 to double
  %".593" = sitofp i32 3 to double
  %".594" = call double @"llvm.pow.f64"(double %".592", double %".593")
  %".595" = sitofp i32 99 to double
  %".596" = fmul double %".595", %".594"
  %".597" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".598" = call i32 (i8*, ...) @"printf"(i8* %".597", double %".596")
  %".599" = sitofp i32 3000 to double
  %".600" = sitofp i32 4 to double
  %".601" = fdiv double %".599", %".600"
  %".602" = sitofp i32 9000 to double
  %".603" = fmul double %".601", %".602"
  %".604" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".605" = call i32 (i8*, ...) @"printf"(i8* %".604", double %".603")
  %".606" = sub i32 88, 2
  %".607" = mul i32 85, 18
  %".608" = sitofp i32 100 to double
  %".609" = sitofp i32 4 to double
  %".610" = call double @"llvm.pow.f64"(double %".608", double %".609")
  %".611" = sitofp i32 %".607" to double
  %".612" = fdiv double %".611", %".610"
  %".613" = sitofp i32 %".606" to double
  %".614" = fadd double %".613", %".612"
  %".615" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".616" = call i32 (i8*, ...) @"printf"(i8* %".615", double %".614")
  %".617" = sitofp i32 100 to double
  %".618" = sitofp i32 2 to double
  %".619" = fdiv double %".617", %".618"
  %".620" = sitofp i32 88 to double
  %".621" = fmul double %".619", %".620"
  %".622" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".623" = call i32 (i8*, ...) @"printf"(i8* %".622", double %".621")
  %".624" = sitofp i32 58 to double
  %".625" = sitofp i32 58 to double
  %".626" = call double @"llvm.pow.f64"(double %".624", double %".625")
  %".627" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".628" = call i32 (i8*, ...) @"printf"(i8* %".627", double %".626")
  %"zz.3" = load i32, i32* %"zz"
  %".629" = sitofp i32 2 to double
  %".630" = sitofp i32 %"zz.3" to double
  %".631" = call double @"llvm.pow.f64"(double %".629", double %".630")
  %".632" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".633" = call i32 (i8*, ...) @"printf"(i8* %".632", double %".631")
  %".634" = call i32 @"suma"()
  %"a_val_main" = alloca i32
  store i32 10, i32* %"a_val_main"
  %"b_val_main" = alloca i32
  %"a_val_main.1" = load i32, i32* %"a_val_main"
  %".636" = call i32 @"doble"(i32 %"a_val_main.1")
  store i32 %".636", i32* %"b_val_main"
  %"b_val_main.1" = load i32, i32* %"b_val_main"
  %".638" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".639" = call i32 (i8*, ...) @"printf"(i8* %".638", i32 %"b_val_main.1")
  %".640" = call i32 @"funcionB"(i32 5)
  %".641" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".642" = call i32 (i8*, ...) @"printf"(i8* %".641", i32 %".640")
  %".643" = sitofp i32 55 to double
  %".644" = sitofp i32 5 to double
  %".645" = call double @"llvm.pow.f64"(double %".643", double %".644")
  %".646" = sitofp i32 5 to double
  %".647" = fdiv double %".645", %".646"
  %".648" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".649" = call i32 (i8*, ...) @"printf"(i8* %".648", double %".647")
  %".650" = sitofp i32 5 to double
  %".651" = sitofp i32 3 to double
  %".652" = call double @"llvm.pow.f64"(double %".650", double %".651")
  %".653" = sitofp i32 99 to double
  %".654" = fmul double %".653", %".652"
  %".655" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".656" = call i32 (i8*, ...) @"printf"(i8* %".655", double %".654")
  %".657" = sitofp i32 3000 to double
  %".658" = sitofp i32 4 to double
  %".659" = fdiv double %".657", %".658"
  %".660" = sitofp i32 9000 to double
  %".661" = fmul double %".659", %".660"
  %".662" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".663" = call i32 (i8*, ...) @"printf"(i8* %".662", double %".661")
  %".664" = sub i32 88, 2
  %".665" = mul i32 85, 18
  %".666" = sitofp i32 100 to double
  %".667" = sitofp i32 4 to double
  %".668" = call double @"llvm.pow.f64"(double %".666", double %".667")
  %".669" = sitofp i32 %".665" to double
  %".670" = fdiv double %".669", %".668"
  %".671" = sitofp i32 %".664" to double
  %".672" = fadd double %".671", %".670"
  %".673" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".674" = call i32 (i8*, ...) @"printf"(i8* %".673", double %".672")
  %".675" = sitofp i32 100 to double
  %".676" = sitofp i32 2 to double
  %".677" = fdiv double %".675", %".676"
  %".678" = sitofp i32 88 to double
  %".679" = fmul double %".677", %".678"
  %".680" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".681" = call i32 (i8*, ...) @"printf"(i8* %".680", double %".679")
  %".682" = sitofp i32 58 to double
  %".683" = sitofp i32 58 to double
  %".684" = call double @"llvm.pow.f64"(double %".682", double %".683")
  %".685" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".686" = call i32 (i8*, ...) @"printf"(i8* %".685", double %".684")
  %"zz.4" = load i32, i32* %"zz"
  %".687" = sitofp i32 2 to double
  %".688" = sitofp i32 %"zz.4" to double
  %".689" = call double @"llvm.pow.f64"(double %".687", double %".688")
  %".690" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".691" = call i32 (i8*, ...) @"printf"(i8* %".690", double %".689")
  %"y_float_main" = alloca double
  store double 0x4039000000000000, double* %"y_float_main"
  %"x_orig_main.3" = load i32, i32* %"x_orig_main"
  store i32 %"x_orig_main.3", i32* %"x_main"
  %"x_main.2" = load i32, i32* %"x_main"
  %".694" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".695" = call i32 (i8*, ...) @"printf"(i8* %".694", i32 %"x_main.2")
  %"y_float_main.1" = load double, double* %"y_float_main"
  %".696" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".697" = call i32 (i8*, ...) @"printf"(i8* %".696", double %"y_float_main.1")
  %".698" = add i32 7, 2
  %".699" = sitofp i32 3 to double
  %".700" = sitofp i32 12 to double
  %".701" = call double @"llvm.pow.f64"(double %".699", double %".700")
  %".702" = sitofp i32 %".698" to double
  %".703" = fadd double %".702", %".701"
  %".704" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".705" = call i32 (i8*, ...) @"printf"(i8* %".704", double %".703")
  %".706" = sitofp i32 2 to double
  %".707" = sitofp i32 5 to double
  %".708" = call double @"llvm.pow.f64"(double %".706", double %".707")
  %".709" = sitofp i32 5 to double
  %".710" = sitofp i32 2 to double
  %".711" = call double @"llvm.pow.f64"(double %".709", double %".710")
  %".712" = fmul double %".708", %".711"
  %".713" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".714" = call i32 (i8*, ...) @"printf"(i8* %".713", double %".712")
  %".715" = sitofp i32 5 to double
  %".716" = sitofp i32 25 to double
  %".717" = call double @"llvm.pow.f64"(double %".715", double %".716")
  %".718" = sitofp i32 5 to double
  %".719" = fmul double %".718", %".717"
  %".720" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".721" = call i32 (i8*, ...) @"printf"(i8* %".720", double %".719")
  %".722" = mul i32 2, 23
  %".723" = sub i32 %".722", 23
  %".724" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".725" = call i32 (i8*, ...) @"printf"(i8* %".724", i32 %".723")
  %"x_main.3" = load i32, i32* %"x_main"
  %".726" = sitofp i32 30 to double
  %".727" = sitofp i32 %"x_main.3" to double
  %".728" = call double @"llvm.pow.f64"(double %".726", double %".727")
  %".729" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".730" = call i32 (i8*, ...) @"printf"(i8* %".729", double %".728")
  %".731" = mul i32 2, 2
  %".732" = mul i32 %".731", 2
  %".733" = sitofp i32 %".732" to double
  %".734" = sitofp i32 2 to double
  %".735" = fdiv double %".733", %".734"
  %".736" = mul i32 2, 2
  %".737" = sitofp i32 %".736" to double
  %".738" = fadd double %".735", %".737"
  %".739" = mul i32 2, 2
  %".740" = sitofp i32 %".739" to double
  %".741" = fadd double %".738", %".740"
  %".742" = mul i32 2, 2
  %".743" = sitofp i32 %".742" to double
  %".744" = fadd double %".741", %".743"
  %".745" = mul i32 2, 2
  %".746" = sitofp i32 %".745" to double
  %".747" = fadd double %".744", %".746"
  %".748" = mul i32 2, 2
  %".749" = sitofp i32 %".748" to double
  %".750" = fadd double %".747", %".749"
  %".751" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".752" = call i32 (i8*, ...) @"printf"(i8* %".751", double %".750")
  %"x_main.4" = load i32, i32* %"x_main"
  %"x_main.5" = load i32, i32* %"x_main"
  %".753" = sitofp i32 %"x_main.4" to double
  %".754" = sitofp i32 %"x_main.5" to double
  %".755" = call double @"llvm.pow.f64"(double %".753", double %".754")
  %".756" = mul i32 2, 5
  %".757" = sitofp i32 %".756" to double
  %".758" = fadd double %".755", %".757"
  %".759" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".760" = call i32 (i8*, ...) @"printf"(i8* %".759", double %".758")
  %"x_main.6" = load i32, i32* %"x_main"
  %".761" = icmp sgt i32 %"x_main.6", 15
  br i1 %".761", label %"then", label %"else"
then:
  %"x_main.7" = load i32, i32* %"x_main"
  %".763" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".764" = call i32 (i8*, ...) @"printf"(i8* %".763", i32 %"x_main.7")
  br label %"ifcont"
else:
  %"x_main.8" = load i32, i32* %"x_main"
  %".766" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".767" = call i32 (i8*, ...) @"printf"(i8* %".766", i32 %"x_main.8")
  br label %"ifcont"
ifcont:
  %".769" = mul i32 18, 2
  %".770" = mul i32 5, 10
  %".771" = sitofp i32 %".770" to double
  %".772" = sitofp i32 8 to double
  %".773" = fdiv double %".771", %".772"
  %".774" = sitofp i32 %".769" to double
  %".775" = fadd double %".774", %".773"
  %".776" = mul i32 5, 2
  %".777" = sitofp i32 %".776" to double
  %".778" = fadd double %".775", %".777"
  %".779" = sitofp i32 800000 to double
  %".780" = fadd double %".778", %".779"
  %".781" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".782" = call i32 (i8*, ...) @"printf"(i8* %".781", double %".780")
  %".783" = mul i32 88, 88
  %".784" = mul i32 %".783", 88
  %".785" = mul i32 %".784", 88
  %".786" = mul i32 %".785", 88
  %".787" = mul i32 %".786", 5
  %".788" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".789" = call i32 (i8*, ...) @"printf"(i8* %".788", i32 %".787")
  %".790" = sitofp i32 42 to double
  %".791" = sitofp i32 5 to double
  %".792" = call double @"llvm.pow.f64"(double %".790", double %".791")
  %".793" = sitofp i32 2 to double
  %".794" = fdiv double %".792", %".793"
  %".795" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".796" = call i32 (i8*, ...) @"printf"(i8* %".795", double %".794")
  %".797" = sitofp i32 2 to double
  %".798" = sitofp i32 9 to double
  %".799" = call double @"llvm.pow.f64"(double %".797", double %".798")
  %".800" = sitofp i32 78 to double
  %".801" = fdiv double %".800", %".799"
  %".802" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".803" = call i32 (i8*, ...) @"printf"(i8* %".802", double %".801")
  %".804" = sitofp i32 99 to double
  %".805" = sitofp i32 2 to double
  %".806" = call double @"llvm.pow.f64"(double %".804", double %".805")
  %".807" = sitofp i32 28 to double
  %".808" = fdiv double %".807", %".806"
  %".809" = sitofp i32 6 to double
  %".810" = fadd double %".808", %".809"
  %".811" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".812" = call i32 (i8*, ...) @"printf"(i8* %".811", double %".810")
  %".813" = sitofp i32 5 to double
  %".814" = sitofp i32 5 to double
  %".815" = call double @"llvm.pow.f64"(double %".813", double %".814")
  %".816" = sitofp i32 2 to double
  %".817" = fadd double %".815", %".816"
  %".818" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".819" = call i32 (i8*, ...) @"printf"(i8* %".818", double %".817")
  %".820" = sitofp i32 78 to double
  %".821" = sitofp i32 25 to double
  %".822" = call double @"llvm.pow.f64"(double %".820", double %".821")
  %".823" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".824" = call i32 (i8*, ...) @"printf"(i8* %".823", double %".822")
  %".825" = sitofp i32 125 to double
  %".826" = sitofp i32 5 to double
  %".827" = call double @"llvm.pow.f64"(double %".825", double %".826")
  %".828" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".829" = call i32 (i8*, ...) @"printf"(i8* %".828", double %".827")
  %".830" = sitofp i32 83 to double
  %".831" = sitofp i32 55 to double
  %".832" = call double @"llvm.pow.f64"(double %".830", double %".831")
  %".833" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".834" = call i32 (i8*, ...) @"printf"(i8* %".833", double %".832")
  %".835" = sitofp i32 78 to double
  %".836" = sitofp i32 2 to double
  %".837" = call double @"llvm.pow.f64"(double %".835", double %".836")
  %".838" = sitofp i32 5 to double
  %".839" = fadd double %".837", %".838"
  %".840" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".841" = call i32 (i8*, ...) @"printf"(i8* %".840", double %".839")
  %"x_orig_main.4" = load i32, i32* %"x_orig_main"
  store i32 %"x_orig_main.4", i32* %"x_main"
  br label %"while.cond.1"
while.cond.1:
  %"x_main.9" = load i32, i32* %"x_main"
  %".844" = icmp sgt i32 %"x_main.9", 0
  br i1 %".844", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"x_main.10" = load i32, i32* %"x_main"
  %".846" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".847" = call i32 (i8*, ...) @"printf"(i8* %".846", i32 %"x_main.10")
  %"x_main.11" = load i32, i32* %"x_main"
  %".848" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".849" = call i32 (i8*, ...) @"printf"(i8* %".848", i32 %"x_main.11")
  %"x_main.12" = load i32, i32* %"x_main"
  %".850" = sub i32 %"x_main.12", 1
  store i32 %".850", i32* %"x_main"
  br label %"while.cond.1"
while.end.1:
  %"i_loop_main" = alloca i32
  store i32 0, i32* %"i_loop_main"
  br label %"for.cond.4"
for.cond.4:
  %"i_loop_main.1" = load i32, i32* %"i_loop_main"
  %".855" = icmp sle i32 %"i_loop_main.1", 30
  br i1 %".855", label %"for.body.4", label %"for.exit.4"
for.body.4:
  %"i_loop_main.2" = load i32, i32* %"i_loop_main"
  %".857" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".858" = call i32 (i8*, ...) @"printf"(i8* %".857", i32 %"i_loop_main.2")
  %"i_loop_main.3" = load i32, i32* %"i_loop_main"
  %".859" = mul i32 %"i_loop_main.3", 2
  %".860" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".861" = call i32 (i8*, ...) @"printf"(i8* %".860", i32 %".859")
  br label %"for.inc.4"
for.inc.4:
  %"i_loop_main.4" = load i32, i32* %"i_loop_main"
  %"i_loop_main.5" = load i32, i32* %"i_loop_main"
  %".863" = add i32 %"i_loop_main.5", 1
  store i32 %".863", i32* %"i_loop_main"
  br label %"for.cond.4"
for.exit.4:
  %".866" = call i32 @"contarHasta"(i32 5)
  %".867" = call i32 @"potencia"(i32 2, i32 3)
  %".868" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".869" = call i32 (i8*, ...) @"printf"(i8* %".868", i32 %".867")
  %".870" = call i32 @"sumar"(i32 5, i32 7)
  %".871" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".872" = call i32 (i8*, ...) @"printf"(i8* %".871", i32 %".870")
  %"resultadoSumaHasta_main" = alloca i32
  %".873" = call i32 @"sumaHasta"(i32 5)
  store i32 %".873", i32* %"resultadoSumaHasta_main"
  %"resultadoSumaHasta_main.1" = load i32, i32* %"resultadoSumaHasta_main"
  %".875" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".876" = call i32 (i8*, ...) @"printf"(i8* %".875", i32 %"resultadoSumaHasta_main.1")
  %".877" = mul i32 18, 2
  %".878" = mul i32 5, 10
  %".879" = sitofp i32 %".878" to double
  %".880" = sitofp i32 8 to double
  %".881" = fdiv double %".879", %".880"
  %".882" = sitofp i32 %".877" to double
  %".883" = fadd double %".882", %".881"
  %".884" = mul i32 5, 2
  %".885" = sitofp i32 %".884" to double
  %".886" = fadd double %".883", %".885"
  %".887" = sitofp i32 800000 to double
  %".888" = fadd double %".886", %".887"
  %".889" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".890" = call i32 (i8*, ...) @"printf"(i8* %".889", double %".888")
  %".891" = mul i32 88, 88
  %".892" = mul i32 %".891", 88
  %".893" = mul i32 %".892", 88
  %".894" = mul i32 %".893", 88
  %".895" = mul i32 %".894", 5
  %".896" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".897" = call i32 (i8*, ...) @"printf"(i8* %".896", i32 %".895")
  %".898" = sitofp i32 42 to double
  %".899" = sitofp i32 5 to double
  %".900" = call double @"llvm.pow.f64"(double %".898", double %".899")
  %".901" = sitofp i32 2 to double
  %".902" = fdiv double %".900", %".901"
  %".903" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".904" = call i32 (i8*, ...) @"printf"(i8* %".903", double %".902")
  %".905" = sitofp i32 2 to double
  %".906" = sitofp i32 9 to double
  %".907" = call double @"llvm.pow.f64"(double %".905", double %".906")
  %".908" = sitofp i32 78 to double
  %".909" = fdiv double %".908", %".907"
  %".910" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".911" = call i32 (i8*, ...) @"printf"(i8* %".910", double %".909")
  %".912" = sitofp i32 99 to double
  %".913" = sitofp i32 2 to double
  %".914" = call double @"llvm.pow.f64"(double %".912", double %".913")
  %".915" = sitofp i32 28 to double
  %".916" = fdiv double %".915", %".914"
  %".917" = sitofp i32 6 to double
  %".918" = fadd double %".916", %".917"
  %".919" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".920" = call i32 (i8*, ...) @"printf"(i8* %".919", double %".918")
  %".921" = sitofp i32 5 to double
  %".922" = sitofp i32 5 to double
  %".923" = call double @"llvm.pow.f64"(double %".921", double %".922")
  %".924" = sitofp i32 2 to double
  %".925" = fadd double %".923", %".924"
  %".926" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".927" = call i32 (i8*, ...) @"printf"(i8* %".926", double %".925")
  %".928" = sitofp i32 78 to double
  %".929" = sitofp i32 25 to double
  %".930" = call double @"llvm.pow.f64"(double %".928", double %".929")
  %".931" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".932" = call i32 (i8*, ...) @"printf"(i8* %".931", double %".930")
  %".933" = sitofp i32 125 to double
  %".934" = sitofp i32 5 to double
  %".935" = call double @"llvm.pow.f64"(double %".933", double %".934")
  %".936" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".937" = call i32 (i8*, ...) @"printf"(i8* %".936", double %".935")
  %".938" = sitofp i32 83 to double
  %".939" = sitofp i32 55 to double
  %".940" = call double @"llvm.pow.f64"(double %".938", double %".939")
  %".941" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".942" = call i32 (i8*, ...) @"printf"(i8* %".941", double %".940")
  %".943" = sitofp i32 78 to double
  %".944" = sitofp i32 2 to double
  %".945" = call double @"llvm.pow.f64"(double %".943", double %".944")
  %".946" = sitofp i32 5 to double
  %".947" = fadd double %".945", %".946"
  %".948" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".949" = call i32 (i8*, ...) @"printf"(i8* %".948", double %".947")
  %"resultadoFFF_main" = alloca i32
  %".950" = call i32 @"fibonacci"(i32 50)
  store i32 %".950", i32* %"resultadoFFF_main"
  %"resultadoFFF_main.1" = load i32, i32* %"resultadoFFF_main"
  %".952" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".953" = call i32 (i8*, ...) @"printf"(i8* %".952", i32 %"resultadoFFF_main.1")
  store i32 0, i32* %"x_main"
  %".955" = mul i32 2, 5
  %".956" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".957" = call i32 (i8*, ...) @"printf"(i8* %".956", i32 %".955")
  %"x_main.13" = load i32, i32* %"x_main"
  %".958" = mul i32 %"x_main.13", 4
  %".959" = add i32 2, %".958"
  %".960" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".961" = call i32 (i8*, ...) @"printf"(i8* %".960", i32 %".959")
  %".962" = add i32 2, 3
  %".963" = mul i32 %".962", 4
  %".964" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".965" = call i32 (i8*, ...) @"printf"(i8* %".964", i32 %".963")
  %".966" = sitofp i32 10 to double
  %".967" = sitofp i32 2 to double
  %".968" = fdiv double %".966", %".967"
  %".969" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".970" = call i32 (i8*, ...) @"printf"(i8* %".969", double %".968")
  %".971" = sitofp i32 2 to double
  %".972" = sitofp i32 3 to double
  %".973" = call double @"llvm.pow.f64"(double %".971", double %".972")
  %".974" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".975" = call i32 (i8*, ...) @"printf"(i8* %".974", double %".973")
  %".976" = sitofp i32 3 to double
  %".977" = sitofp i32 2 to double
  %".978" = call double @"llvm.pow.f64"(double %".976", double %".977")
  %".979" = sitofp i32 2 to double
  %".980" = call double @"llvm.pow.f64"(double %".979", double %".978")
  %".981" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".982" = call i32 (i8*, ...) @"printf"(i8* %".981", double %".980")
  %".983" = mul i32 3, 2
  %".984" = add i32 5, %".983"
  %".985" = sitofp i32 4 to double
  %".986" = sitofp i32 2 to double
  %".987" = fdiv double %".985", %".986"
  %".988" = sitofp i32 %".984" to double
  %".989" = fsub double %".988", %".987"
  %".990" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".991" = call i32 (i8*, ...) @"printf"(i8* %".990", double %".989")
  %".992" = add i32 3, 4
  %".993" = sitofp i32 2 to double
  %".994" = sitofp i32 3 to double
  %".995" = call double @"llvm.pow.f64"(double %".993", double %".994")
  %".996" = sitofp i32 %".992" to double
  %".997" = fmul double %".996", %".995"
  %".998" = sitofp i32 10 to double
  %".999" = sitofp i32 2 to double
  %".1000" = fdiv double %".998", %".999"
  %".1001" = fsub double %".997", %".1000"
  %".1002" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1003" = call i32 (i8*, ...) @"printf"(i8* %".1002", double %".1001")
  %".1004" = sitofp i32 5 to double
  %".1005" = sitofp i32 2 to double
  %".1006" = fdiv double %".1004", %".1005"
  %".1007" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1008" = call i32 (i8*, ...) @"printf"(i8* %".1007", double %".1006")
  %".1009" = sub i32 0, 2
  %".1010" = mul i32 4, %".1009"
  %".1011" = add i32 2, %".1010"
  %".1012" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1013" = call i32 (i8*, ...) @"printf"(i8* %".1012", i32 %".1011")
  %".1014" = mul i32 18, 2
  %".1015" = mul i32 5, 10
  %".1016" = sitofp i32 %".1015" to double
  %".1017" = sitofp i32 8 to double
  %".1018" = fdiv double %".1016", %".1017"
  %".1019" = sitofp i32 %".1014" to double
  %".1020" = fadd double %".1019", %".1018"
  %".1021" = mul i32 5, 2
  %".1022" = sitofp i32 %".1021" to double
  %".1023" = fadd double %".1020", %".1022"
  %".1024" = sitofp i32 800000 to double
  %".1025" = fadd double %".1023", %".1024"
  %".1026" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1027" = call i32 (i8*, ...) @"printf"(i8* %".1026", double %".1025")
  %".1028" = mul i32 88, 88
  %".1029" = mul i32 %".1028", 88
  %".1030" = mul i32 %".1029", 88
  %".1031" = mul i32 %".1030", 88
  %".1032" = mul i32 %".1031", 5
  %".1033" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1034" = call i32 (i8*, ...) @"printf"(i8* %".1033", i32 %".1032")
  %".1035" = sitofp i32 42 to double
  %".1036" = sitofp i32 5 to double
  %".1037" = call double @"llvm.pow.f64"(double %".1035", double %".1036")
  %".1038" = sitofp i32 2 to double
  %".1039" = fdiv double %".1037", %".1038"
  %".1040" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1041" = call i32 (i8*, ...) @"printf"(i8* %".1040", double %".1039")
  %".1042" = sitofp i32 2 to double
  %".1043" = sitofp i32 9 to double
  %".1044" = call double @"llvm.pow.f64"(double %".1042", double %".1043")
  %".1045" = sitofp i32 78 to double
  %".1046" = fdiv double %".1045", %".1044"
  %".1047" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1048" = call i32 (i8*, ...) @"printf"(i8* %".1047", double %".1046")
  %".1049" = sitofp i32 99 to double
  %".1050" = sitofp i32 2 to double
  %".1051" = call double @"llvm.pow.f64"(double %".1049", double %".1050")
  %".1052" = sitofp i32 28 to double
  %".1053" = fdiv double %".1052", %".1051"
  %".1054" = sitofp i32 6 to double
  %".1055" = fadd double %".1053", %".1054"
  %".1056" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1057" = call i32 (i8*, ...) @"printf"(i8* %".1056", double %".1055")
  %"resultadoFFFF_main" = alloca i32
  %".1058" = call i32 @"fibonacci"(i32 50)
  store i32 %".1058", i32* %"resultadoFFFF_main"
  %"resultadoFFFF_main.1" = load i32, i32* %"resultadoFFFF_main"
  %".1060" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1061" = call i32 (i8*, ...) @"printf"(i8* %".1060", i32 %"resultadoFFFF_main.1")
  %".1062" = sitofp i32 5 to double
  %".1063" = sitofp i32 5 to double
  %".1064" = call double @"llvm.pow.f64"(double %".1062", double %".1063")
  %".1065" = sitofp i32 2 to double
  %".1066" = fadd double %".1064", %".1065"
  %".1067" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1068" = call i32 (i8*, ...) @"printf"(i8* %".1067", double %".1066")
  %".1069" = sitofp i32 78 to double
  %".1070" = sitofp i32 25 to double
  %".1071" = call double @"llvm.pow.f64"(double %".1069", double %".1070")
  %".1072" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1073" = call i32 (i8*, ...) @"printf"(i8* %".1072", double %".1071")
  %".1074" = sitofp i32 125 to double
  %".1075" = sitofp i32 5 to double
  %".1076" = call double @"llvm.pow.f64"(double %".1074", double %".1075")
  %".1077" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1078" = call i32 (i8*, ...) @"printf"(i8* %".1077", double %".1076")
  %".1079" = sitofp i32 83 to double
  %".1080" = sitofp i32 55 to double
  %".1081" = call double @"llvm.pow.f64"(double %".1079", double %".1080")
  %".1082" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1083" = call i32 (i8*, ...) @"printf"(i8* %".1082", double %".1081")
  %".1084" = sitofp i32 78 to double
  %".1085" = sitofp i32 2 to double
  %".1086" = call double @"llvm.pow.f64"(double %".1084", double %".1085")
  %".1087" = sitofp i32 5 to double
  %".1088" = fadd double %".1086", %".1087"
  %".1089" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1090" = call i32 (i8*, ...) @"printf"(i8* %".1089", double %".1088")
  %"varA_main" = alloca i32
  store i32 100, i32* %"varA_main"
  %"varB_main" = alloca i32
  store i32 200, i32* %"varB_main"
  %"varC_main" = alloca i32
  store i32 300, i32* %"varC_main"
  %"varA_main.1" = load i32, i32* %"varA_main"
  %"varB_main.1" = load i32, i32* %"varB_main"
  %".1094" = add i32 %"varA_main.1", %"varB_main.1"
  %"varC_main.1" = load i32, i32* %"varC_main"
  %".1095" = add i32 %".1094", %"varC_main.1"
  %".1096" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1097" = call i32 (i8*, ...) @"printf"(i8* %".1096", i32 %".1095")
  %"varA_main.2" = load i32, i32* %"varA_main"
  %"varB_main.2" = load i32, i32* %"varB_main"
  %".1098" = mul i32 %"varA_main.2", %"varB_main.2"
  %"varC_main.2" = load i32, i32* %"varC_main"
  %".1099" = sub i32 %".1098", %"varC_main.2"
  %".1100" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1101" = call i32 (i8*, ...) @"printf"(i8* %".1100", i32 %".1099")
  %"varC_main.3" = load i32, i32* %"varC_main"
  %"varA_main.3" = load i32, i32* %"varA_main"
  %".1102" = sitofp i32 %"varC_main.3" to double
  %".1103" = sitofp i32 %"varA_main.3" to double
  %".1104" = fdiv double %".1102", %".1103"
  %"varB_main.3" = load i32, i32* %"varB_main"
  %".1105" = sitofp i32 %"varB_main.3" to double
  %".1106" = fadd double %".1104", %".1105"
  %".1107" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1108" = call i32 (i8*, ...) @"printf"(i8* %".1107", double %".1106")
  %"varA_main.4" = load i32, i32* %"varA_main"
  %".1109" = sitofp i32 %"varA_main.4" to double
  %".1110" = sitofp i32 2 to double
  %".1111" = call double @"llvm.pow.f64"(double %".1109", double %".1110")
  %"varB_main.4" = load i32, i32* %"varB_main"
  %".1112" = sitofp i32 %"varB_main.4" to double
  %".1113" = sitofp i32 2 to double
  %".1114" = call double @"llvm.pow.f64"(double %".1112", double %".1113")
  %".1115" = fadd double %".1111", %".1114"
  %".1116" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1117" = call i32 (i8*, ...) @"printf"(i8* %".1116", double %".1115")
  %"count1_main" = alloca i32
  store i32 0, i32* %"count1_main"
  br label %"for.cond.5"
for.cond.5:
  %"count1_main.1" = load i32, i32* %"count1_main"
  %".1120" = icmp slt i32 %"count1_main.1", 5
  br i1 %".1120", label %"for.body.5", label %"for.exit.5"
for.body.5:
  %"count1_main.2" = load i32, i32* %"count1_main"
  %".1122" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1123" = call i32 (i8*, ...) @"printf"(i8* %".1122", i32 %"count1_main.2")
  %"varA_main.5" = load i32, i32* %"varA_main"
  %"count1_main.3" = load i32, i32* %"count1_main"
  %".1124" = mul i32 %"varA_main.5", %"count1_main.3"
  %".1125" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1126" = call i32 (i8*, ...) @"printf"(i8* %".1125", i32 %".1124")
  %"count2_main" = alloca i32
  store i32 0, i32* %"count2_main"
  br label %"for.cond.6"
for.inc.5:
  %"count1_main.6" = load i32, i32* %"count1_main"
  %"count1_main.7" = load i32, i32* %"count1_main"
  %".1150" = add i32 %"count1_main.7", 1
  store i32 %".1150", i32* %"count1_main"
  br label %"for.cond.5"
for.exit.5:
  %".1153" = call i32 @"multiplicar"(i32 10, i32 20)
  %".1154" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1155" = call i32 (i8*, ...) @"printf"(i8* %".1154", i32 %".1153")
  %".1156" = call double @"dividir"(double 0x4059000000000000, double 0x4010000000000000)
  %".1157" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1158" = call i32 (i8*, ...) @"printf"(i8* %".1157", double %".1156")
  %".1159" = call i1 @"esPar"(i32 7)
  %".1160" = zext i1 %".1159" to i32
  %".1161" = bitcast [4 x i8]* @"fmt_boolean" to i8*
  %".1162" = call i32 (i8*, ...) @"printf"(i8* %".1161", i32 %".1160")
  %".1163" = call i1 @"esPar"(i32 8)
  %".1164" = zext i1 %".1163" to i32
  %".1165" = bitcast [4 x i8]* @"fmt_boolean" to i8*
  %".1166" = call i32 (i8*, ...) @"printf"(i8* %".1165", i32 %".1164")
  %"val1_main" = alloca i32
  store i32 1, i32* %"val1_main"
  br label %"while.cond.2"
for.cond.6:
  %"count2_main.1" = load i32, i32* %"count2_main"
  %".1129" = icmp slt i32 %"count2_main.1", 3
  br i1 %".1129", label %"for.body.6", label %"for.exit.6"
for.body.6:
  %"count2_main.2" = load i32, i32* %"count2_main"
  %".1131" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1132" = call i32 (i8*, ...) @"printf"(i8* %".1131", i32 %"count2_main.2")
  %"varB_main.5" = load i32, i32* %"varB_main"
  %"count2_main.3" = load i32, i32* %"count2_main"
  %".1133" = mul i32 %"varB_main.5", %"count2_main.3"
  %"count1_main.4" = load i32, i32* %"count1_main"
  %".1134" = sub i32 %".1133", %"count1_main.4"
  %".1135" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1136" = call i32 (i8*, ...) @"printf"(i8* %".1135", i32 %".1134")
  %"count1_main.5" = load i32, i32* %"count1_main"
  %"count2_main.4" = load i32, i32* %"count2_main"
  %".1137" = icmp eq i32 %"count1_main.5", %"count2_main.4"
  br i1 %".1137", label %"then.1", label %"else.1"
for.inc.6:
  %"count2_main.5" = load i32, i32* %"count2_main"
  %"count2_main.6" = load i32, i32* %"count2_main"
  %".1146" = add i32 %"count2_main.6", 1
  store i32 %".1146", i32* %"count2_main"
  br label %"for.cond.6"
for.exit.6:
  br label %"for.inc.5"
then.1:
  %".1139" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1140" = call i32 (i8*, ...) @"printf"(i8* %".1139", i32 1)
  br label %"ifcont.1"
else.1:
  %".1142" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1143" = call i32 (i8*, ...) @"printf"(i8* %".1142", i32 0)
  br label %"ifcont.1"
ifcont.1:
  br label %"for.inc.6"
while.cond.2:
  %"val1_main.1" = load i32, i32* %"val1_main"
  %".1169" = icmp slt i32 %"val1_main.1", 15
  br i1 %".1169", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"val1_main.2" = load i32, i32* %"val1_main"
  %".1171" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1172" = call i32 (i8*, ...) @"printf"(i8* %".1171", i32 %"val1_main.2")
  %"val1_main.3" = load i32, i32* %"val1_main"
  %".1173" = srem i32 %"val1_main.3", 2
  %".1174" = icmp eq i32 %".1173", 0
  br i1 %".1174", label %"then.2", label %"else.2"
while.end.2:
  %".1191" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1192" = call i32 (i8*, ...) @"printf"(i8* %".1191", i32 30)
  %"f1_main" = alloca double
  store double 0x4025000000000000, double* %"f1_main"
  %"f2_main" = alloca double
  store double 0x4004000000000000, double* %"f2_main"
  %"f1_main.1" = load double, double* %"f1_main"
  %"f2_main.1" = load double, double* %"f2_main"
  %".1195" = fadd double %"f1_main.1", %"f2_main.1"
  %".1196" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1197" = call i32 (i8*, ...) @"printf"(i8* %".1196", double %".1195")
  %"f1_main.2" = load double, double* %"f1_main"
  %"f2_main.2" = load double, double* %"f2_main"
  %".1198" = fmul double %"f1_main.2", %"f2_main.2"
  %".1199" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1200" = call i32 (i8*, ...) @"printf"(i8* %".1199", double %".1198")
  %"f1_main.3" = load double, double* %"f1_main"
  %"f2_main.3" = load double, double* %"f2_main"
  %".1201" = fdiv double %"f1_main.3", %"f2_main.3"
  %".1202" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1203" = call i32 (i8*, ...) @"printf"(i8* %".1202", double %".1201")
  %"f1_main.4" = load double, double* %"f1_main"
  %"f2_main.4" = load double, double* %"f2_main"
  %".1204" = fsub double %"f1_main.4", %"f2_main.4"
  %".1205" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1206" = call i32 (i8*, ...) @"printf"(i8* %".1205", double %".1204")
  %"f1_main.5" = load double, double* %"f1_main"
  %".1207" = sitofp i32 2 to double
  %".1208" = call double @"llvm.pow.f64"(double %"f1_main.5", double %".1207")
  %".1209" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1210" = call i32 (i8*, ...) @"printf"(i8* %".1209", double %".1208")
  %"arr_sim_1_main" = alloca i32
  store i32 10, i32* %"arr_sim_1_main"
  %"arr_sim_2_main" = alloca i32
  store i32 20, i32* %"arr_sim_2_main"
  %"arr_sim_3_main" = alloca i32
  store i32 30, i32* %"arr_sim_3_main"
  %"arr_sim_4_main" = alloca i32
  store i32 40, i32* %"arr_sim_4_main"
  %"arr_sim_5_main" = alloca i32
  store i32 50, i32* %"arr_sim_5_main"
  %"arr_sim_1_main.1" = load i32, i32* %"arr_sim_1_main"
  %"arr_sim_2_main.1" = load i32, i32* %"arr_sim_2_main"
  %".1216" = add i32 %"arr_sim_1_main.1", %"arr_sim_2_main.1"
  %".1217" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1218" = call i32 (i8*, ...) @"printf"(i8* %".1217", i32 %".1216")
  %"arr_sim_3_main.1" = load i32, i32* %"arr_sim_3_main"
  %"arr_sim_1_main.2" = load i32, i32* %"arr_sim_1_main"
  %".1219" = sub i32 %"arr_sim_3_main.1", %"arr_sim_1_main.2"
  %".1220" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1221" = call i32 (i8*, ...) @"printf"(i8* %".1220", i32 %".1219")
  %"arr_sim_4_main.1" = load i32, i32* %"arr_sim_4_main"
  %".1222" = mul i32 %"arr_sim_4_main.1", 2
  %".1223" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1224" = call i32 (i8*, ...) @"printf"(i8* %".1223", i32 %".1222")
  %"arr_sim_5_main.1" = load i32, i32* %"arr_sim_5_main"
  %".1225" = sitofp i32 %"arr_sim_5_main.1" to double
  %".1226" = sitofp i32 5 to double
  %".1227" = fdiv double %".1225", %".1226"
  %".1228" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1229" = call i32 (i8*, ...) @"printf"(i8* %".1228", double %".1227")
  %"arr_sim_1_main.3" = load i32, i32* %"arr_sim_1_main"
  %".1230" = sitofp i32 %"arr_sim_1_main.3" to double
  %".1231" = sitofp i32 3 to double
  %".1232" = call double @"llvm.pow.f64"(double %".1230", double %".1231")
  %".1233" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1234" = call i32 (i8*, ...) @"printf"(i8* %".1233", double %".1232")
  %"idx_main" = alloca i32
  store i32 1, i32* %"idx_main"
  br label %"for.cond.7"
then.2:
  %"val1_main.4" = load i32, i32* %"val1_main"
  %".1176" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1177" = call i32 (i8*, ...) @"printf"(i8* %".1176", i32 %"val1_main.4")
  br label %"ifcont.2"
else.2:
  %"val1_main.5" = load i32, i32* %"val1_main"
  %".1179" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1180" = call i32 (i8*, ...) @"printf"(i8* %".1179", i32 %"val1_main.5")
  br label %"ifcont.2"
ifcont.2:
  %"val1_main.6" = load i32, i32* %"val1_main"
  %".1182" = icmp sgt i32 %"val1_main.6", 10
  br i1 %".1182", label %"then.3", label %"else.3"
then.3:
  %"val1_main.7" = load i32, i32* %"val1_main"
  %".1184" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1185" = call i32 (i8*, ...) @"printf"(i8* %".1184", i32 %"val1_main.7")
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"val1_main.8" = load i32, i32* %"val1_main"
  %".1188" = add i32 %"val1_main.8", 3
  store i32 %".1188", i32* %"val1_main"
  br label %"while.cond.2"
for.cond.7:
  %"idx_main.1" = load i32, i32* %"idx_main"
  %".1237" = icmp sle i32 %"idx_main.1", 5
  br i1 %".1237", label %"for.body.7", label %"for.exit.7"
for.body.7:
  %"idx_main.2" = load i32, i32* %"idx_main"
  %".1239" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1240" = call i32 (i8*, ...) @"printf"(i8* %".1239", i32 %"idx_main.2")
  %"idx_main.3" = load i32, i32* %"idx_main"
  %".1241" = icmp eq i32 %"idx_main.3", 1
  br i1 %".1241", label %"then.4", label %"else.4"
for.inc.7:
  %"idx_main.8" = load i32, i32* %"idx_main"
  %"idx_main.9" = load i32, i32* %"idx_main"
  %".1272" = add i32 %"idx_main.9", 1
  store i32 %".1272", i32* %"idx_main"
  br label %"for.cond.7"
for.exit.7:
  %".1275" = call i32 @"potencia"(i32 3, i32 4)
  %".1276" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1277" = call i32 (i8*, ...) @"printf"(i8* %".1276", i32 %".1275")
  %".1278" = call i32 @"sumar"(i32 100, i32 234)
  %".1279" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1280" = call i32 (i8*, ...) @"printf"(i8* %".1279", i32 %".1278")
  %".1281" = call i32 @"doble"(i32 77)
  %".1282" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1283" = call i32 (i8*, ...) @"printf"(i8* %".1282", i32 %".1281")
  %".1284" = call i32 @"funcionA"(i32 25)
  %".1285" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1286" = call i32 (i8*, ...) @"printf"(i8* %".1285", i32 %".1284")
  %".1287" = call i32 @"funcionB"(i32 12)
  %".1288" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1289" = call i32 (i8*, ...) @"printf"(i8* %".1288", i32 %".1287")
  %"counterGlobal_main" = alloca i32
  store i32 0, i32* %"counterGlobal_main"
  br label %"while.cond.3"
then.4:
  %"arr_sim_1_main.4" = load i32, i32* %"arr_sim_1_main"
  %".1243" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1244" = call i32 (i8*, ...) @"printf"(i8* %".1243", i32 %"arr_sim_1_main.4")
  br label %"ifcont.4"
else.4:
  br label %"ifcont.4"
ifcont.4:
  %"idx_main.4" = load i32, i32* %"idx_main"
  %".1247" = icmp eq i32 %"idx_main.4", 2
  br i1 %".1247", label %"then.5", label %"else.5"
then.5:
  %"arr_sim_2_main.2" = load i32, i32* %"arr_sim_2_main"
  %".1249" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1250" = call i32 (i8*, ...) @"printf"(i8* %".1249", i32 %"arr_sim_2_main.2")
  br label %"ifcont.5"
else.5:
  br label %"ifcont.5"
ifcont.5:
  %"idx_main.5" = load i32, i32* %"idx_main"
  %".1253" = icmp eq i32 %"idx_main.5", 3
  br i1 %".1253", label %"then.6", label %"else.6"
then.6:
  %"arr_sim_3_main.2" = load i32, i32* %"arr_sim_3_main"
  %".1255" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1256" = call i32 (i8*, ...) @"printf"(i8* %".1255", i32 %"arr_sim_3_main.2")
  br label %"ifcont.6"
else.6:
  br label %"ifcont.6"
ifcont.6:
  %"idx_main.6" = load i32, i32* %"idx_main"
  %".1259" = icmp eq i32 %"idx_main.6", 4
  br i1 %".1259", label %"then.7", label %"else.7"
then.7:
  %"arr_sim_4_main.2" = load i32, i32* %"arr_sim_4_main"
  %".1261" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1262" = call i32 (i8*, ...) @"printf"(i8* %".1261", i32 %"arr_sim_4_main.2")
  br label %"ifcont.7"
else.7:
  br label %"ifcont.7"
ifcont.7:
  %"idx_main.7" = load i32, i32* %"idx_main"
  %".1265" = icmp eq i32 %"idx_main.7", 5
  br i1 %".1265", label %"then.8", label %"else.8"
then.8:
  %"arr_sim_5_main.2" = load i32, i32* %"arr_sim_5_main"
  %".1267" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1268" = call i32 (i8*, ...) @"printf"(i8* %".1267", i32 %"arr_sim_5_main.2")
  br label %"ifcont.8"
else.8:
  br label %"ifcont.8"
ifcont.8:
  br label %"for.inc.7"
while.cond.3:
  %"counterGlobal_main.1" = load i32, i32* %"counterGlobal_main"
  %".1292" = icmp slt i32 %"counterGlobal_main.1", 10
  br i1 %".1292", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"counterGlobal_main.2" = load i32, i32* %"counterGlobal_main"
  %".1294" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1295" = call i32 (i8*, ...) @"printf"(i8* %".1294", i32 %"counterGlobal_main.2")
  %"innerCounter_main" = alloca i32
  store i32 0, i32* %"innerCounter_main"
  br label %"while.cond.4"
while.end.3:
  %".1316" = mul i32 1000, 2
  %".1317" = sitofp i32 3000 to double
  %".1318" = sitofp i32 10 to double
  %".1319" = fdiv double %".1317", %".1318"
  %".1320" = sitofp i32 %".1316" to double
  %".1321" = fadd double %".1320", %".1319"
  %".1322" = sitofp i32 5 to double
  %".1323" = fsub double %".1321", %".1322"
  %".1324" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1325" = call i32 (i8*, ...) @"printf"(i8* %".1324", double %".1323")
  %".1326" = sitofp i32 7 to double
  %".1327" = sitofp i32 3 to double
  %".1328" = call double @"llvm.pow.f64"(double %".1326", double %".1327")
  %".1329" = sitofp i32 8 to double
  %".1330" = sitofp i32 3 to double
  %".1331" = call double @"llvm.pow.f64"(double %".1329", double %".1330")
  %".1332" = fadd double %".1328", %".1331"
  %".1333" = sitofp i32 9 to double
  %".1334" = sitofp i32 3 to double
  %".1335" = call double @"llvm.pow.f64"(double %".1333", double %".1334")
  %".1336" = fadd double %".1332", %".1335"
  %".1337" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1338" = call i32 (i8*, ...) @"printf"(i8* %".1337", double %".1336")
  %".1339" = add i32 1, 2
  %".1340" = add i32 %".1339", 3
  %".1341" = add i32 %".1340", 4
  %".1342" = add i32 %".1341", 5
  %".1343" = sitofp i32 %".1342" to double
  %".1344" = sitofp i32 2 to double
  %".1345" = call double @"llvm.pow.f64"(double %".1343", double %".1344")
  %".1346" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1347" = call i32 (i8*, ...) @"printf"(i8* %".1346", double %".1345")
  %".1348" = sitofp i32 9999 to double
  %".1349" = sitofp i32 33 to double
  %".1350" = fdiv double %".1348", %".1349"
  %".1351" = sitofp i32 2222 to double
  %".1352" = sitofp i32 11 to double
  %".1353" = fdiv double %".1351", %".1352"
  %".1354" = fadd double %".1350", %".1353"
  %".1355" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1356" = call i32 (i8*, ...) @"printf"(i8* %".1355", double %".1354")
  %"num_a_main" = alloca i32
  store i32 1, i32* %"num_a_main"
  %"num_b_main" = alloca i32
  store i32 1, i32* %"num_b_main"
  %"fib_idx_main" = alloca i32
  store i32 0, i32* %"fib_idx_main"
  br label %"for.cond.8"
while.cond.4:
  %"innerCounter_main.1" = load i32, i32* %"innerCounter_main"
  %".1298" = icmp slt i32 %"innerCounter_main.1", 3
  br i1 %".1298", label %"while.body.4", label %"while.end.4"
while.body.4:
  %"innerCounter_main.2" = load i32, i32* %"innerCounter_main"
  %".1300" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1301" = call i32 (i8*, ...) @"printf"(i8* %".1300", i32 %"innerCounter_main.2")
  %"counterGlobal_main.3" = load i32, i32* %"counterGlobal_main"
  %".1302" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1303" = call i32 (i8*, ...) @"printf"(i8* %".1302", i32 %"counterGlobal_main.3")
  %"counterGlobal_main.4" = load i32, i32* %"counterGlobal_main"
  %".1304" = add i32 %"counterGlobal_main.4", 1
  %"innerCounter_main.3" = load i32, i32* %"innerCounter_main"
  %".1305" = add i32 %"innerCounter_main.3", 1
  %".1306" = mul i32 %".1304", %".1305"
  %".1307" = mul i32 %".1306", 100
  %".1308" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1309" = call i32 (i8*, ...) @"printf"(i8* %".1308", i32 %".1307")
  %"innerCounter_main.4" = load i32, i32* %"innerCounter_main"
  %".1310" = add i32 %"innerCounter_main.4", 1
  store i32 %".1310", i32* %"innerCounter_main"
  br label %"while.cond.4"
while.end.4:
  %"counterGlobal_main.5" = load i32, i32* %"counterGlobal_main"
  %".1313" = add i32 %"counterGlobal_main.5", 1
  store i32 %".1313", i32* %"counterGlobal_main"
  br label %"while.cond.3"
for.cond.8:
  %"fib_idx_main.1" = load i32, i32* %"fib_idx_main"
  %".1361" = icmp slt i32 %"fib_idx_main.1", 10
  br i1 %".1361", label %"for.body.8", label %"for.exit.8"
for.body.8:
  %"num_a_main.1" = load i32, i32* %"num_a_main"
  %".1363" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1364" = call i32 (i8*, ...) @"printf"(i8* %".1363", i32 %"num_a_main.1")
  %"temp_fib_main" = alloca i32
  %"num_a_main.2" = load i32, i32* %"num_a_main"
  %"num_b_main.1" = load i32, i32* %"num_b_main"
  %".1365" = add i32 %"num_a_main.2", %"num_b_main.1"
  store i32 %".1365", i32* %"temp_fib_main"
  %"num_b_main.2" = load i32, i32* %"num_b_main"
  store i32 %"num_b_main.2", i32* %"num_a_main"
  %"temp_fib_main.1" = load i32, i32* %"temp_fib_main"
  store i32 %"temp_fib_main.1", i32* %"num_b_main"
  br label %"for.inc.8"
for.inc.8:
  %"fib_idx_main.2" = load i32, i32* %"fib_idx_main"
  %"fib_idx_main.3" = load i32, i32* %"fib_idx_main"
  %".1370" = add i32 %"fib_idx_main.3", 1
  store i32 %".1370", i32* %"fib_idx_main"
  br label %"for.cond.8"
for.exit.8:
  %"loopVar1_decl_main" = alloca i32
  store i32 0, i32* %"loopVar1_decl_main"
  store i32 0, i32* %"loopVar1_decl_main"
  br label %"for.cond.9"
for.cond.9:
  %"loopVar1_decl_main.1" = load i32, i32* %"loopVar1_decl_main"
  %".1376" = icmp slt i32 %"loopVar1_decl_main.1", 8
  br i1 %".1376", label %"for.body.9", label %"for.exit.9"
for.body.9:
  %"loopVar1_decl_main.2" = load i32, i32* %"loopVar1_decl_main"
  %".1378" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1379" = call i32 (i8*, ...) @"printf"(i8* %".1378", i32 %"loopVar1_decl_main.2")
  %"loopVar2_decl_main" = alloca i32
  store i32 0, i32* %"loopVar2_decl_main"
  store i32 0, i32* %"loopVar2_decl_main"
  br label %"for.cond.10"
for.inc.9:
  %"loopVar1_decl_main.5" = load i32, i32* %"loopVar1_decl_main"
  %"loopVar1_decl_main.6" = load i32, i32* %"loopVar1_decl_main"
  %".1396" = add i32 %"loopVar1_decl_main.6", 1
  store i32 %".1396", i32* %"loopVar1_decl_main"
  br label %"for.cond.9"
for.exit.9:
  %".1399" = call i32 @"calcularAreaCuadrado"(i32 10)
  %".1400" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1401" = call i32 (i8*, ...) @"printf"(i8* %".1400", i32 %".1399")
  %".1402" = call i32 @"calcularAreaCuadrado"(i32 25)
  %".1403" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1404" = call i32 (i8*, ...) @"printf"(i8* %".1403", i32 %".1402")
  %".1405" = call i32 @"calcularAreaRectangulo"(i32 5, i32 8)
  %".1406" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1407" = call i32 (i8*, ...) @"printf"(i8* %".1406", i32 %".1405")
  %".1408" = call i32 @"calcularAreaRectangulo"(i32 10, i32 20)
  %".1409" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1410" = call i32 (i8*, ...) @"printf"(i8* %".1409", i32 %".1408")
  %"checkNum_main" = alloca i32
  store i32 17, i32* %"checkNum_main"
  %"checkNum_main.1" = load i32, i32* %"checkNum_main"
  %".1412" = call i1 @"esPar"(i32 %"checkNum_main.1")
  br i1 %".1412", label %"then.9", label %"else.9"
for.cond.10:
  %"loopVar2_decl_main.1" = load i32, i32* %"loopVar2_decl_main"
  %"loopVar1_decl_main.3" = load i32, i32* %"loopVar1_decl_main"
  %".1383" = icmp slt i32 %"loopVar2_decl_main.1", %"loopVar1_decl_main.3"
  br i1 %".1383", label %"for.body.10", label %"for.exit.10"
for.body.10:
  %"loopVar2_decl_main.2" = load i32, i32* %"loopVar2_decl_main"
  %".1385" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1386" = call i32 (i8*, ...) @"printf"(i8* %".1385", i32 %"loopVar2_decl_main.2")
  %"loopVar1_decl_main.4" = load i32, i32* %"loopVar1_decl_main"
  %".1387" = mul i32 %"loopVar1_decl_main.4", 10
  %"loopVar2_decl_main.3" = load i32, i32* %"loopVar2_decl_main"
  %".1388" = add i32 %".1387", %"loopVar2_decl_main.3"
  %".1389" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1390" = call i32 (i8*, ...) @"printf"(i8* %".1389", i32 %".1388")
  br label %"for.inc.10"
for.inc.10:
  %"loopVar2_decl_main.4" = load i32, i32* %"loopVar2_decl_main"
  %"loopVar2_decl_main.5" = load i32, i32* %"loopVar2_decl_main"
  %".1392" = add i32 %"loopVar2_decl_main.5", 1
  store i32 %".1392", i32* %"loopVar2_decl_main"
  br label %"for.cond.10"
for.exit.10:
  br label %"for.inc.9"
then.9:
  %"checkNum_main.2" = load i32, i32* %"checkNum_main"
  %".1414" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1415" = call i32 (i8*, ...) @"printf"(i8* %".1414", i32 %"checkNum_main.2")
  br label %"ifcont.9"
else.9:
  %"checkNum_main.3" = load i32, i32* %"checkNum_main"
  %".1417" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1418" = call i32 (i8*, ...) @"printf"(i8* %".1417", i32 %"checkNum_main.3")
  %"checkNum_main.4" = load i32, i32* %"checkNum_main"
  %".1419" = icmp sgt i32 %"checkNum_main.4", 10
  br i1 %".1419", label %"then.10", label %"else.10"
ifcont.9:
  store i32 22, i32* %"checkNum_main"
  %"checkNum_main.7" = load i32, i32* %"checkNum_main"
  %".1429" = call i1 @"esPar"(i32 %"checkNum_main.7")
  br i1 %".1429", label %"then.11", label %"else.11"
then.10:
  %"checkNum_main.5" = load i32, i32* %"checkNum_main"
  %".1421" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1422" = call i32 (i8*, ...) @"printf"(i8* %".1421", i32 %"checkNum_main.5")
  br label %"ifcont.10"
else.10:
  %"checkNum_main.6" = load i32, i32* %"checkNum_main"
  %".1424" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1425" = call i32 (i8*, ...) @"printf"(i8* %".1424", i32 %"checkNum_main.6")
  br label %"ifcont.10"
ifcont.10:
  br label %"ifcont.9"
then.11:
  %"checkNum_main.8" = load i32, i32* %"checkNum_main"
  %".1431" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1432" = call i32 (i8*, ...) @"printf"(i8* %".1431", i32 %"checkNum_main.8")
  %"checkNum_main.9" = load i32, i32* %"checkNum_main"
  %".1433" = icmp sgt i32 %"checkNum_main.9", 20
  br i1 %".1433", label %"then.12", label %"else.12"
else.11:
  %"checkNum_main.12" = load i32, i32* %"checkNum_main"
  %".1442" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1443" = call i32 (i8*, ...) @"printf"(i8* %".1442", i32 %"checkNum_main.12")
  br label %"ifcont.11"
ifcont.11:
  %".1445" = sitofp i32 100 to double
  %".1446" = sitofp i32 4 to double
  %".1447" = fdiv double %".1445", %".1446"
  %".1448" = sitofp i32 3 to double
  %".1449" = fmul double %".1447", %".1448"
  %".1450" = sitofp i32 7 to double
  %".1451" = fadd double %".1449", %".1450"
  %".1452" = sitofp i32 1 to double
  %".1453" = fsub double %".1451", %".1452"
  %".1454" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1455" = call i32 (i8*, ...) @"printf"(i8* %".1454", double %".1453")
  %".1456" = sitofp i32 2 to double
  %".1457" = sitofp i32 8 to double
  %".1458" = call double @"llvm.pow.f64"(double %".1456", double %".1457")
  %".1459" = sitofp i32 4 to double
  %".1460" = fdiv double %".1458", %".1459"
  %".1461" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1462" = call i32 (i8*, ...) @"printf"(i8* %".1461", double %".1460")
  %".1463" = add i32 50, 50
  %".1464" = sub i32 3, 1
  %".1465" = mul i32 %".1463", %".1464"
  %".1466" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1467" = call i32 (i8*, ...) @"printf"(i8* %".1466", i32 %".1465")
  %".1468" = add i32 123, 456
  %".1469" = add i32 %".1468", 789
  %".1470" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1471" = call i32 (i8*, ...) @"printf"(i8* %".1470", i32 %".1469")
  %".1472" = sub i32 987, 654
  %".1473" = sub i32 %".1472", 321
  %".1474" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1475" = call i32 (i8*, ...) @"printf"(i8* %".1474", i32 %".1473")
  %".1476" = mul i32 1, 2
  %".1477" = mul i32 %".1476", 3
  %".1478" = mul i32 %".1477", 4
  %".1479" = mul i32 %".1478", 5
  %".1480" = mul i32 %".1479", 6
  %".1481" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1482" = call i32 (i8*, ...) @"printf"(i8* %".1481", i32 %".1480")
  %".1483" = sitofp i32 1000000 to double
  %".1484" = sitofp i32 10 to double
  %".1485" = fdiv double %".1483", %".1484"
  %".1486" = sitofp i32 10 to double
  %".1487" = fdiv double %".1485", %".1486"
  %".1488" = sitofp i32 10 to double
  %".1489" = fdiv double %".1487", %".1488"
  %".1490" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1491" = call i32 (i8*, ...) @"printf"(i8* %".1490", double %".1489")
  %".1492" = mul i32 77, 11
  %".1493" = mul i32 33, 22
  %".1494" = add i32 %".1492", %".1493"
  %".1495" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1496" = call i32 (i8*, ...) @"printf"(i8* %".1495", i32 %".1494")
  %".1497" = sitofp i32 5 to double
  %".1498" = sitofp i32 2 to double
  %".1499" = call double @"llvm.pow.f64"(double %".1497", double %".1498")
  %".1500" = sitofp i32 12 to double
  %".1501" = sitofp i32 2 to double
  %".1502" = call double @"llvm.pow.f64"(double %".1500", double %".1501")
  %".1503" = fadd double %".1499", %".1502"
  %".1504" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1505" = call i32 (i8*, ...) @"printf"(i8* %".1504", double %".1503")
  %".1506" = sub i32 100, 1
  %".1507" = add i32 100, 1
  %".1508" = mul i32 %".1506", %".1507"
  %".1509" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1510" = call i32 (i8*, ...) @"printf"(i8* %".1509", i32 %".1508")
  %"iter1_main" = alloca i32
  store i32 0, i32* %"iter1_main"
  br label %"while.cond.5"
then.12:
  %"checkNum_main.10" = load i32, i32* %"checkNum_main"
  %".1435" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1436" = call i32 (i8*, ...) @"printf"(i8* %".1435", i32 %"checkNum_main.10")
  br label %"ifcont.12"
else.12:
  %"checkNum_main.11" = load i32, i32* %"checkNum_main"
  %".1438" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1439" = call i32 (i8*, ...) @"printf"(i8* %".1438", i32 %"checkNum_main.11")
  br label %"ifcont.12"
ifcont.12:
  br label %"ifcont.11"
while.cond.5:
  %"iter1_main.1" = load i32, i32* %"iter1_main"
  %".1513" = icmp slt i32 %"iter1_main.1", 7
  br i1 %".1513", label %"while.body.5", label %"while.end.5"
while.body.5:
  %"iter1_main.2" = load i32, i32* %"iter1_main"
  %".1515" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1516" = call i32 (i8*, ...) @"printf"(i8* %".1515", i32 %"iter1_main.2")
  %"iter2_main" = alloca i32
  store i32 6, i32* %"iter2_main"
  br label %"while.cond.6"
while.end.5:
  %".1535" = call i32 @"procesarNumero"(i32 10)
  %".1536" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1537" = call i32 (i8*, ...) @"printf"(i8* %".1536", i32 %".1535")
  %".1538" = call i32 @"procesarNumero"(i32 7)
  %".1539" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1540" = call i32 (i8*, ...) @"printf"(i8* %".1539", i32 %".1538")
  %".1541" = call i32 @"procesarNumero"(i32 0)
  %".1542" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1543" = call i32 (i8*, ...) @"printf"(i8* %".1542", i32 %".1541")
  %".1544" = sub i32 0, 5
  %".1545" = call i32 @"procesarNumero"(i32 %".1544")
  %".1546" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1547" = call i32 (i8*, ...) @"printf"(i8* %".1546", i32 %".1545")
  %"str_idx_main" = alloca i32
  store i32 0, i32* %"str_idx_main"
  br label %"for.cond.11"
while.cond.6:
  %"iter2_main.1" = load i32, i32* %"iter2_main"
  %"iter1_main.3" = load i32, i32* %"iter1_main"
  %".1519" = icmp sgt i32 %"iter2_main.1", %"iter1_main.3"
  br i1 %".1519", label %"while.body.6", label %"while.end.6"
while.body.6:
  %"iter2_main.2" = load i32, i32* %"iter2_main"
  %".1521" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1522" = call i32 (i8*, ...) @"printf"(i8* %".1521", i32 %"iter2_main.2")
  %"iter1_main.4" = load i32, i32* %"iter1_main"
  %".1523" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1524" = call i32 (i8*, ...) @"printf"(i8* %".1523", i32 %"iter1_main.4")
  %"iter1_main.5" = load i32, i32* %"iter1_main"
  %".1525" = mul i32 %"iter1_main.5", 100
  %"iter2_main.3" = load i32, i32* %"iter2_main"
  %".1526" = add i32 %".1525", %"iter2_main.3"
  %".1527" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1528" = call i32 (i8*, ...) @"printf"(i8* %".1527", i32 %".1526")
  %"iter2_main.4" = load i32, i32* %"iter2_main"
  %".1529" = sub i32 %"iter2_main.4", 1
  store i32 %".1529", i32* %"iter2_main"
  br label %"while.cond.6"
while.end.6:
  %"iter1_main.6" = load i32, i32* %"iter1_main"
  %".1532" = add i32 %"iter1_main.6", 1
  store i32 %".1532", i32* %"iter1_main"
  br label %"while.cond.5"
for.cond.11:
  %"str_idx_main.1" = load i32, i32* %"str_idx_main"
  %".1550" = icmp slt i32 %"str_idx_main.1", 5
  br i1 %".1550", label %"for.body.11", label %"for.exit.11"
for.body.11:
  %"str_idx_main.2" = load i32, i32* %"str_idx_main"
  %".1552" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1553" = call i32 (i8*, ...) @"printf"(i8* %".1552", i32 %"str_idx_main.2")
  %"str_idx_main.3" = load i32, i32* %"str_idx_main"
  %".1554" = srem i32 %"str_idx_main.3", 2
  %".1555" = icmp eq i32 %".1554", 0
  br i1 %".1555", label %"then.13", label %"else.13"
for.inc.11:
  %"str_idx_main.5" = load i32, i32* %"str_idx_main"
  %"str_idx_main.6" = load i32, i32* %"str_idx_main"
  %".1562" = add i32 %"str_idx_main.6", 1
  store i32 %".1562", i32* %"str_idx_main"
  br label %"for.cond.11"
for.exit.11:
  %".1565" = add i32 1, 2
  %".1566" = mul i32 3, 4
  %".1567" = sitofp i32 5 to double
  %".1568" = sitofp i32 6 to double
  %".1569" = call double @"llvm.pow.f64"(double %".1567", double %".1568")
  %".1570" = sitofp i32 %".1566" to double
  %".1571" = fdiv double %".1570", %".1569"
  %".1572" = sitofp i32 %".1565" to double
  %".1573" = fsub double %".1572", %".1571"
  %".1574" = sitofp i32 7 to double
  %".1575" = fadd double %".1573", %".1574"
  %".1576" = mul i32 8, 9
  %".1577" = sitofp i32 %".1576" to double
  %".1578" = sitofp i32 10 to double
  %".1579" = fdiv double %".1577", %".1578"
  %".1580" = fsub double %".1575", %".1579"
  %".1581" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1582" = call i32 (i8*, ...) @"printf"(i8* %".1581", double %".1580")
  %".1583" = mul i32 5, 4
  %".1584" = mul i32 3, 2
  %".1585" = sub i32 %".1583", %".1584"
  %".1586" = sitofp i32 2 to double
  %".1587" = sitofp i32 3 to double
  %".1588" = call double @"llvm.pow.f64"(double %".1586", double %".1587")
  %".1589" = sitofp i32 2 to double
  %".1590" = fmul double %".1588", %".1589"
  %".1591" = sitofp i32 %".1585" to double
  %".1592" = fadd double %".1591", %".1590"
  %".1593" = sitofp i32 2 to double
  %".1594" = fdiv double %".1592", %".1593"
  %".1595" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1596" = call i32 (i8*, ...) @"printf"(i8* %".1595", double %".1594")
  %".1597" = mul i32 100, 99
  %".1598" = sitofp i32 %".1597" to double
  %".1599" = sitofp i32 98 to double
  %".1600" = fdiv double %".1598", %".1599"
  %".1601" = sitofp i32 97 to double
  %".1602" = fadd double %".1600", %".1601"
  %".1603" = mul i32 96, 95
  %".1604" = sitofp i32 %".1603" to double
  %".1605" = fsub double %".1602", %".1604"
  %".1606" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1607" = call i32 (i8*, ...) @"printf"(i8* %".1606", double %".1605")
  %"valX_main" = alloca i32
  store i32 50, i32* %"valX_main"
  %"valY_main" = alloca i32
  store i32 10, i32* %"valY_main"
  %"valZ_main" = alloca i32
  store i32 5, i32* %"valZ_main"
  %"opLoop_main" = alloca i32
  store i32 0, i32* %"opLoop_main"
  br label %"for.cond.12"
then.13:
  %"str_idx_main.4" = load i32, i32* %"str_idx_main"
  %".1557" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1558" = call i32 (i8*, ...) @"printf"(i8* %".1557", i32 %"str_idx_main.4")
  br label %"ifcont.13"
else.13:
  br label %"ifcont.13"
ifcont.13:
  br label %"for.inc.11"
for.cond.12:
  %"opLoop_main.1" = load i32, i32* %"opLoop_main"
  %".1613" = icmp slt i32 %"opLoop_main.1", 4
  br i1 %".1613", label %"for.body.12", label %"for.exit.12"
for.body.12:
  %"opLoop_main.2" = load i32, i32* %"opLoop_main"
  %".1615" = icmp eq i32 %"opLoop_main.2", 0
  br i1 %".1615", label %"then.14", label %"else.14"
for.inc.12:
  %"opLoop_main.7" = load i32, i32* %"opLoop_main"
  %"opLoop_main.8" = load i32, i32* %"opLoop_main"
  %".1655" = add i32 %"opLoop_main.8", 1
  store i32 %".1655", i32* %"opLoop_main"
  br label %"for.cond.12"
for.exit.12:
  %".1658" = call i32 @"factorial"(i32 5)
  %".1659" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1660" = call i32 (i8*, ...) @"printf"(i8* %".1659", i32 %".1658")
  %".1661" = call i32 @"factorial"(i32 7)
  %".1662" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1663" = call i32 (i8*, ...) @"printf"(i8* %".1662", i32 %".1661")
  %"anotherX_main" = alloca i32
  store i32 10, i32* %"anotherX_main"
  %"anotherX_main.1" = load i32, i32* %"anotherX_main"
  %".1665" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1666" = call i32 (i8*, ...) @"printf"(i8* %".1665", i32 %"anotherX_main.1")
  %"anotherX_main.2" = load i32, i32* %"anotherX_main"
  %".1667" = mul i32 %"anotherX_main.2", 40
  %".1668" = add i32 2, %".1667"
  %".1669" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1670" = call i32 (i8*, ...) @"printf"(i8* %".1669", i32 %".1668")
  %".1671" = add i32 20, 30
  %".1672" = mul i32 %".1671", 4
  %".1673" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1674" = call i32 (i8*, ...) @"printf"(i8* %".1673", i32 %".1672")
  %".1675" = sitofp i32 1000 to double
  %".1676" = sitofp i32 20 to double
  %".1677" = fdiv double %".1675", %".1676"
  %".1678" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1679" = call i32 (i8*, ...) @"printf"(i8* %".1678", double %".1677")
  %".1680" = sitofp i32 20 to double
  %".1681" = sitofp i32 3 to double
  %".1682" = call double @"llvm.pow.f64"(double %".1680", double %".1681")
  %".1683" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1684" = call i32 (i8*, ...) @"printf"(i8* %".1683", double %".1682")
  %".1685" = sitofp i32 3 to double
  %".1686" = sitofp i32 2 to double
  %".1687" = call double @"llvm.pow.f64"(double %".1685", double %".1686")
  %".1688" = sitofp i32 2 to double
  %".1689" = call double @"llvm.pow.f64"(double %".1688", double %".1687")
  %".1690" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1691" = call i32 (i8*, ...) @"printf"(i8* %".1690", double %".1689")
  %".1692" = mul i32 30, 20
  %".1693" = add i32 50, %".1692"
  %".1694" = sitofp i32 40 to double
  %".1695" = sitofp i32 2 to double
  %".1696" = fdiv double %".1694", %".1695"
  %".1697" = sitofp i32 %".1693" to double
  %".1698" = fsub double %".1697", %".1696"
  %".1699" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1700" = call i32 (i8*, ...) @"printf"(i8* %".1699", double %".1698")
  %".1701" = add i32 30, 40
  %".1702" = sitofp i32 2 to double
  %".1703" = sitofp i32 3 to double
  %".1704" = call double @"llvm.pow.f64"(double %".1702", double %".1703")
  %".1705" = sitofp i32 %".1701" to double
  %".1706" = fmul double %".1705", %".1704"
  %".1707" = sitofp i32 100 to double
  %".1708" = sitofp i32 2 to double
  %".1709" = fdiv double %".1707", %".1708"
  %".1710" = fsub double %".1706", %".1709"
  %".1711" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1712" = call i32 (i8*, ...) @"printf"(i8* %".1711", double %".1710")
  %".1713" = sitofp i32 50 to double
  %".1714" = sitofp i32 20 to double
  %".1715" = fdiv double %".1713", %".1714"
  %".1716" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1717" = call i32 (i8*, ...) @"printf"(i8* %".1716", double %".1715")
  %".1718" = sub i32 0, 2
  %".1719" = mul i32 40, %".1718"
  %".1720" = add i32 20, %".1719"
  %".1721" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1722" = call i32 (i8*, ...) @"printf"(i8* %".1721", i32 %".1720")
  %"finalLoop_main" = alloca i32
  store i32 0, i32* %"finalLoop_main"
  br label %"for.cond.13"
then.14:
  %"valX_main.1" = load i32, i32* %"valX_main"
  %"valY_main.1" = load i32, i32* %"valY_main"
  %"valZ_main.1" = load i32, i32* %"valZ_main"
  %".1617" = mul i32 %"valY_main.1", %"valZ_main.1"
  %".1618" = add i32 %"valX_main.1", %".1617"
  %".1619" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1620" = call i32 (i8*, ...) @"printf"(i8* %".1619", i32 %".1618")
  br label %"ifcont.14"
else.14:
  br label %"ifcont.14"
ifcont.14:
  %"opLoop_main.3" = load i32, i32* %"opLoop_main"
  %".1623" = icmp eq i32 %"opLoop_main.3", 1
  br i1 %".1623", label %"then.15", label %"else.15"
then.15:
  %"valX_main.2" = load i32, i32* %"valX_main"
  %"valY_main.2" = load i32, i32* %"valY_main"
  %".1625" = add i32 %"valX_main.2", %"valY_main.2"
  %"valZ_main.2" = load i32, i32* %"valZ_main"
  %".1626" = mul i32 %".1625", %"valZ_main.2"
  %".1627" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1628" = call i32 (i8*, ...) @"printf"(i8* %".1627", i32 %".1626")
  br label %"ifcont.15"
else.15:
  br label %"ifcont.15"
ifcont.15:
  %"opLoop_main.4" = load i32, i32* %"opLoop_main"
  %".1631" = icmp eq i32 %"opLoop_main.4", 2
  br i1 %".1631", label %"then.16", label %"else.16"
then.16:
  %"valX_main.3" = load i32, i32* %"valX_main"
  %"valY_main.3" = load i32, i32* %"valY_main"
  %"valZ_main.3" = load i32, i32* %"valZ_main"
  %".1633" = sitofp i32 %"valY_main.3" to double
  %".1634" = sitofp i32 %"valZ_main.3" to double
  %".1635" = fdiv double %".1633", %".1634"
  %".1636" = sitofp i32 %"valX_main.3" to double
  %".1637" = fsub double %".1636", %".1635"
  %".1638" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1639" = call i32 (i8*, ...) @"printf"(i8* %".1638", double %".1637")
  br label %"ifcont.16"
else.16:
  br label %"ifcont.16"
ifcont.16:
  %"opLoop_main.5" = load i32, i32* %"opLoop_main"
  %".1642" = icmp eq i32 %"opLoop_main.5", 3
  br i1 %".1642", label %"then.17", label %"else.17"
then.17:
  %"valX_main.4" = load i32, i32* %"valX_main"
  %"valY_main.4" = load i32, i32* %"valY_main"
  %".1644" = sub i32 %"valX_main.4", %"valY_main.4"
  %"valZ_main.4" = load i32, i32* %"valZ_main"
  %".1645" = sitofp i32 %".1644" to double
  %".1646" = sitofp i32 %"valZ_main.4" to double
  %".1647" = fdiv double %".1645", %".1646"
  %".1648" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1649" = call i32 (i8*, ...) @"printf"(i8* %".1648", double %".1647")
  br label %"ifcont.17"
else.17:
  br label %"ifcont.17"
ifcont.17:
  %"opLoop_main.6" = load i32, i32* %"opLoop_main"
  %".1652" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1653" = call i32 (i8*, ...) @"printf"(i8* %".1652", i32 %"opLoop_main.6")
  br label %"for.inc.12"
for.cond.13:
  %"finalLoop_main.1" = load i32, i32* %"finalLoop_main"
  %".1725" = icmp slt i32 %"finalLoop_main.1", 20
  br i1 %".1725", label %"for.body.13", label %"for.exit.13"
for.body.13:
  %"finalLoop_main.2" = load i32, i32* %"finalLoop_main"
  %".1727" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1728" = call i32 (i8*, ...) @"printf"(i8* %".1727", i32 %"finalLoop_main.2")
  %"finalLoop_main.3" = load i32, i32* %"finalLoop_main"
  %".1729" = sitofp i32 %"finalLoop_main.3" to double
  %".1730" = sitofp i32 2 to double
  %".1731" = call double @"llvm.pow.f64"(double %".1729", double %".1730")
  %"finalLoop_main.4" = load i32, i32* %"finalLoop_main"
  %".1732" = mul i32 %"finalLoop_main.4", 10
  %".1733" = sitofp i32 %".1732" to double
  %".1734" = fadd double %".1731", %".1733"
  %".1735" = sitofp i32 500 to double
  %".1736" = fadd double %".1734", %".1735"
  %".1737" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1738" = call i32 (i8*, ...) @"printf"(i8* %".1737", double %".1736")
  %"finalLoop_main.5" = load i32, i32* %"finalLoop_main"
  %".1739" = srem i32 %"finalLoop_main.5", 3
  %".1740" = icmp eq i32 %".1739", 0
  br i1 %".1740", label %"then.18", label %"else.18"
for.inc.13:
  %"finalLoop_main.7" = load i32, i32* %"finalLoop_main"
  %"finalLoop_main.8" = load i32, i32* %"finalLoop_main"
  %".1747" = add i32 %"finalLoop_main.8", 1
  store i32 %".1747", i32* %"finalLoop_main"
  br label %"for.cond.13"
for.exit.13:
  %".1750" = call i32 @"fibonacci"(i32 18)
  %".1751" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1752" = call i32 (i8*, ...) @"printf"(i8* %".1751", i32 %".1750")
  %".1753" = call i32 @"potencia"(i32 2, i32 5)
  %".1754" = call i32 @"doble"(i32 %".1753")
  %".1755" = call i32 @"funcionA"(i32 100)
  %".1756" = call i32 @"sumar"(i32 %".1754", i32 %".1755")
  %".1757" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1758" = call i32 (i8*, ...) @"printf"(i8* %".1757", i32 %".1756")
  %".1759" = call i32 @"sumaHasta"(i32 4)
  %".1760" = call i32 @"funcionB"(i32 %".1759")
  %".1761" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1762" = call i32 (i8*, ...) @"printf"(i8* %".1761", i32 %".1760")
  %"iter_exp_1" = alloca i32
  store i32 0, i32* %"iter_exp_1"
  br label %"while.cond.7"
then.18:
  %"finalLoop_main.6" = load i32, i32* %"finalLoop_main"
  %".1742" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1743" = call i32 (i8*, ...) @"printf"(i8* %".1742", i32 %"finalLoop_main.6")
  br label %"ifcont.18"
else.18:
  br label %"ifcont.18"
ifcont.18:
  br label %"for.inc.13"
while.cond.7:
  %"iter_exp_1.1" = load i32, i32* %"iter_exp_1"
  %".1765" = icmp slt i32 %"iter_exp_1.1", 500
  br i1 %".1765", label %"while.body.7", label %"while.end.7"
while.body.7:
  %"iter_exp_1.2" = load i32, i32* %"iter_exp_1"
  %".1767" = mul i32 %"iter_exp_1.2", 2
  %".1768" = add i32 %".1767", 10000
  %".1769" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1770" = call i32 (i8*, ...) @"printf"(i8* %".1769", i32 %".1768")
  %"iter_exp_2" = alloca i32
  store i32 0, i32* %"iter_exp_2"
  store i32 0, i32* %"iter_exp_2"
  br label %"for.cond.14"
while.end.7:
  %"var_g1" = alloca i32
  store i32 100, i32* %"var_g1"
  %"var_g2" = alloca i32
  store i32 200, i32* %"var_g2"
  %"var_g3" = alloca i32
  store i32 300, i32* %"var_g3"
  %"var_g4" = alloca i32
  store i32 400, i32* %"var_g4"
  %"var_g5" = alloca i32
  store i32 500, i32* %"var_g5"
  %"loop_count_A" = alloca i32
  store i32 0, i32* %"loop_count_A"
  store i32 0, i32* %"loop_count_A"
  br label %"for.cond.15"
for.cond.14:
  %"iter_exp_2.1" = load i32, i32* %"iter_exp_2"
  %".1774" = icmp slt i32 %"iter_exp_2.1", 5
  br i1 %".1774", label %"for.body.14", label %"for.exit.14"
for.body.14:
  %"iter_exp_1.3" = load i32, i32* %"iter_exp_1"
  %"iter_exp_2.2" = load i32, i32* %"iter_exp_2"
  %".1776" = add i32 %"iter_exp_1.3", %"iter_exp_2.2"
  %"iter_exp_2.3" = load i32, i32* %"iter_exp_2"
  %".1777" = call i32 @"potencia"(i32 2, i32 %"iter_exp_2.3")
  %".1778" = add i32 %".1776", %".1777"
  %".1779" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1780" = call i32 (i8*, ...) @"printf"(i8* %".1779", i32 %".1778")
  %"iter_exp_1.4" = load i32, i32* %"iter_exp_1"
  %"iter_exp_2.4" = load i32, i32* %"iter_exp_2"
  %".1781" = call i32 @"multiplicar"(i32 %"iter_exp_1.4", i32 %"iter_exp_2.4")
  %".1782" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1783" = call i32 (i8*, ...) @"printf"(i8* %".1782", i32 %".1781")
  %"iter_exp_1.5" = load i32, i32* %"iter_exp_1"
  %"iter_exp_2.5" = load i32, i32* %"iter_exp_2"
  %".1784" = add i32 %"iter_exp_1.5", %"iter_exp_2.5"
  %".1785" = call i1 @"esPar"(i32 %".1784")
  br i1 %".1785", label %"then.19", label %"else.19"
for.inc.14:
  %"iter_exp_2.8" = load i32, i32* %"iter_exp_2"
  %"iter_exp_2.9" = load i32, i32* %"iter_exp_2"
  %".1798" = add i32 %"iter_exp_2.9", 1
  store i32 %".1798", i32* %"iter_exp_2"
  br label %"for.cond.14"
for.exit.14:
  %"iter_exp_1.8" = load i32, i32* %"iter_exp_1"
  %".1801" = add i32 %"iter_exp_1.8", 1
  store i32 %".1801", i32* %"iter_exp_1"
  br label %"while.cond.7"
then.19:
  %"iter_exp_1.6" = load i32, i32* %"iter_exp_1"
  %"iter_exp_2.6" = load i32, i32* %"iter_exp_2"
  %".1787" = sub i32 %"iter_exp_1.6", %"iter_exp_2.6"
  %".1788" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1789" = call i32 (i8*, ...) @"printf"(i8* %".1788", i32 %".1787")
  br label %"ifcont.19"
else.19:
  %"iter_exp_1.7" = load i32, i32* %"iter_exp_1"
  %"iter_exp_2.7" = load i32, i32* %"iter_exp_2"
  %".1791" = sitofp i32 %"iter_exp_1.7" to double
  %".1792" = sitofp i32 %"iter_exp_2.7" to double
  %".1793" = call double @"llvm.pow.f64"(double %".1791", double %".1792")
  %".1794" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1795" = call i32 (i8*, ...) @"printf"(i8* %".1794", double %".1793")
  br label %"ifcont.19"
ifcont.19:
  br label %"for.inc.14"
for.cond.15:
  %"loop_count_A.1" = load i32, i32* %"loop_count_A"
  %".1812" = icmp slt i32 %"loop_count_A.1", 100
  br i1 %".1812", label %"for.body.15", label %"for.exit.15"
for.body.15:
  %"var_g1.1" = load i32, i32* %"var_g1"
  %"loop_count_A.2" = load i32, i32* %"loop_count_A"
  %".1814" = add i32 %"var_g1.1", %"loop_count_A.2"
  %".1815" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1816" = call i32 (i8*, ...) @"printf"(i8* %".1815", i32 %".1814")
  %"var_g2.1" = load i32, i32* %"var_g2"
  %"loop_count_A.3" = load i32, i32* %"loop_count_A"
  %".1817" = sub i32 %"var_g2.1", %"loop_count_A.3"
  %".1818" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1819" = call i32 (i8*, ...) @"printf"(i8* %".1818", i32 %".1817")
  %"var_g3.1" = load i32, i32* %"var_g3"
  %"loop_count_A.4" = load i32, i32* %"loop_count_A"
  %".1820" = mul i32 %"var_g3.1", %"loop_count_A.4"
  %".1821" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1822" = call i32 (i8*, ...) @"printf"(i8* %".1821", i32 %".1820")
  %"loop_count_A.5" = load i32, i32* %"loop_count_A"
  %".1823" = srem i32 %"loop_count_A.5", 10
  %".1824" = icmp eq i32 %".1823", 0
  br i1 %".1824", label %"then.20", label %"else.20"
for.inc.15:
  %"loop_count_A.15" = load i32, i32* %"loop_count_A"
  %"loop_count_A.16" = load i32, i32* %"loop_count_A"
  %".1887" = add i32 %"loop_count_A.16", 1
  store i32 %".1887", i32* %"loop_count_A"
  br label %"for.cond.15"
for.exit.15:
  %"while_var_A" = alloca i32
  store i32 0, i32* %"while_var_A"
  br label %"while.cond.8"
then.20:
  %"var_g4.1" = load i32, i32* %"var_g4"
  %"loop_count_A.6" = load i32, i32* %"loop_count_A"
  %".1826" = sitofp i32 %"loop_count_A.6" to double
  %".1827" = sitofp i32 10 to double
  %".1828" = fdiv double %".1826", %".1827"
  %".1829" = sitofp i32 1 to double
  %".1830" = fadd double %".1828", %".1829"
  %".1831" = sitofp i32 %"var_g4.1" to double
  %".1832" = fdiv double %".1831", %".1830"
  %".1833" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1834" = call i32 (i8*, ...) @"printf"(i8* %".1833", double %".1832")
  br label %"ifcont.20"
else.20:
  br label %"ifcont.20"
ifcont.20:
  %"var_g5.1" = load i32, i32* %"var_g5"
  %"loop_count_A.7" = load i32, i32* %"loop_count_A"
  %".1837" = srem i32 %"loop_count_A.7", 3
  %".1838" = add i32 %".1837", 1
  %".1839" = sitofp i32 %"var_g5.1" to double
  %".1840" = sitofp i32 %".1838" to double
  %".1841" = call double @"llvm.pow.f64"(double %".1839", double %".1840")
  %".1842" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1843" = call i32 (i8*, ...) @"printf"(i8* %".1842", double %".1841")
  %"loop_count_A.8" = load i32, i32* %"loop_count_A"
  %".1844" = srem i32 %"loop_count_A.8", 5
  %".1845" = add i32 %".1844", 2
  %".1846" = call i32 @"potencia"(i32 %".1845", i32 3)
  %".1847" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1848" = call i32 (i8*, ...) @"printf"(i8* %".1847", i32 %".1846")
  %"loop_count_A.9" = load i32, i32* %"loop_count_A"
  %"loop_count_A.10" = load i32, i32* %"loop_count_A"
  %".1849" = mul i32 %"loop_count_A.10", 2
  %".1850" = call i32 @"sumar"(i32 %"loop_count_A.9", i32 %".1849")
  %".1851" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1852" = call i32 (i8*, ...) @"printf"(i8* %".1851", i32 %".1850")
  %"loop_count_A.11" = load i32, i32* %"loop_count_A"
  %".1853" = add i32 %"loop_count_A.11", 10
  %".1854" = call i32 @"doble"(i32 %".1853")
  %".1855" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1856" = call i32 (i8*, ...) @"printf"(i8* %".1855", i32 %".1854")
  %"loop_count_A.12" = load i32, i32* %"loop_count_A"
  %".1857" = srem i32 %"loop_count_A.12", 6
  %".1858" = call i32 @"factorial"(i32 %".1857")
  %".1859" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1860" = call i32 (i8*, ...) @"printf"(i8* %".1859", i32 %".1858")
  %"nested_loop_A" = alloca i32
  store i32 0, i32* %"nested_loop_A"
  store i32 0, i32* %"nested_loop_A"
  br label %"for.cond.16"
for.cond.16:
  %"nested_loop_A.1" = load i32, i32* %"nested_loop_A"
  %".1864" = icmp slt i32 %"nested_loop_A.1", 3
  br i1 %".1864", label %"for.body.16", label %"for.exit.16"
for.body.16:
  %"loop_count_A.13" = load i32, i32* %"loop_count_A"
  %".1866" = mul i32 %"loop_count_A.13", 100
  %"nested_loop_A.2" = load i32, i32* %"nested_loop_A"
  %".1867" = add i32 %".1866", %"nested_loop_A.2"
  %".1868" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1869" = call i32 (i8*, ...) @"printf"(i8* %".1868", i32 %".1867")
  %"var_g1.2" = load i32, i32* %"var_g1"
  %"var_g2.2" = load i32, i32* %"var_g2"
  %".1870" = add i32 %"var_g1.2", %"var_g2.2"
  %"nested_loop_A.3" = load i32, i32* %"nested_loop_A"
  %".1871" = add i32 %".1870", %"nested_loop_A.3"
  %".1872" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1873" = call i32 (i8*, ...) @"printf"(i8* %".1872", i32 %".1871")
  %"loop_count_A.14" = load i32, i32* %"loop_count_A"
  %"nested_loop_A.4" = load i32, i32* %"nested_loop_A"
  %".1874" = add i32 %"loop_count_A.14", %"nested_loop_A.4"
  %".1875" = call i32 @"funcionA"(i32 %".1874")
  %".1876" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1877" = call i32 (i8*, ...) @"printf"(i8* %".1876", i32 %".1875")
  %"nested_loop_A.5" = load i32, i32* %"nested_loop_A"
  %".1878" = add i32 %"nested_loop_A.5", 1
  %".1879" = call i32 @"funcionB"(i32 %".1878")
  %".1880" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1881" = call i32 (i8*, ...) @"printf"(i8* %".1880", i32 %".1879")
  br label %"for.inc.16"
for.inc.16:
  %"nested_loop_A.6" = load i32, i32* %"nested_loop_A"
  %"nested_loop_A.7" = load i32, i32* %"nested_loop_A"
  %".1883" = add i32 %"nested_loop_A.7", 1
  store i32 %".1883", i32* %"nested_loop_A"
  br label %"for.cond.16"
for.exit.16:
  br label %"for.inc.15"
while.cond.8:
  %"while_var_A.1" = load i32, i32* %"while_var_A"
  %".1892" = icmp slt i32 %"while_var_A.1", 150
  br i1 %".1892", label %"while.body.8", label %"while.end.8"
while.body.8:
  %"while_var_A.2" = load i32, i32* %"while_var_A"
  %".1894" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1895" = call i32 (i8*, ...) @"printf"(i8* %".1894", i32 %"while_var_A.2")
  %"while_var_A.3" = load i32, i32* %"while_var_A"
  %".1896" = sub i32 %"while_var_A.3", 75
  %".1897" = call i32 @"procesarNumero"(i32 %".1896")
  %".1898" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1899" = call i32 (i8*, ...) @"printf"(i8* %".1898", i32 %".1897")
  %"while_var_A.4" = load i32, i32* %"while_var_A"
  %".1900" = srem i32 %"while_var_A.4", 10
  %".1901" = add i32 %".1900", 1
  %".1902" = call i32 @"calcularAreaCuadrado"(i32 %".1901")
  %".1903" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1904" = call i32 (i8*, ...) @"printf"(i8* %".1903", i32 %".1902")
  %"while_var_A.5" = load i32, i32* %"while_var_A"
  %".1905" = srem i32 %"while_var_A.5", 5
  %".1906" = add i32 %".1905", 1
  %"while_var_A.6" = load i32, i32* %"while_var_A"
  %".1907" = srem i32 %"while_var_A.6", 7
  %".1908" = add i32 %".1907", 1
  %".1909" = call i32 @"calcularAreaRectangulo"(i32 %".1906", i32 %".1908")
  %".1910" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1911" = call i32 (i8*, ...) @"printf"(i8* %".1910", i32 %".1909")
  %"nested_while_A" = alloca i32
  store i32 0, i32* %"nested_while_A"
  br label %"while.cond.9"
while.end.8:
  %"i_rep" = alloca i32
  store i32 0, i32* %"i_rep"
  store i32 0, i32* %"i_rep"
  br label %"for.cond.17"
while.cond.9:
  %"nested_while_A.1" = load i32, i32* %"nested_while_A"
  %".1914" = icmp slt i32 %"nested_while_A.1", 2
  br i1 %".1914", label %"while.body.9", label %"while.end.9"
while.body.9:
  %"while_var_A.7" = load i32, i32* %"while_var_A"
  %"nested_while_A.2" = load i32, i32* %"nested_while_A"
  %".1916" = mul i32 %"nested_while_A.2", 1000
  %".1917" = add i32 %"while_var_A.7", %".1916"
  %".1918" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1919" = call i32 (i8*, ...) @"printf"(i8* %".1918", i32 %".1917")
  %"while_var_A.8" = load i32, i32* %"while_var_A"
  %"nested_while_A.3" = load i32, i32* %"nested_while_A"
  %".1920" = add i32 %"while_var_A.8", %"nested_while_A.3"
  %".1921" = call i1 @"esPar"(i32 %".1920")
  %".1922" = zext i1 %".1921" to i32
  %".1923" = bitcast [4 x i8]* @"fmt_boolean" to i8*
  %".1924" = call i32 (i8*, ...) @"printf"(i8* %".1923", i32 %".1922")
  %"nested_while_A.4" = load i32, i32* %"nested_while_A"
  %".1925" = add i32 %"nested_while_A.4", 1
  store i32 %".1925", i32* %"nested_while_A"
  br label %"while.cond.9"
while.end.9:
  %"while_var_A.9" = load i32, i32* %"while_var_A"
  %".1928" = srem i32 %"while_var_A.9", 25
  %".1929" = icmp eq i32 %".1928", 0
  br i1 %".1929", label %"then.21", label %"else.21"
then.21:
  %"while_var_A.10" = load i32, i32* %"while_var_A"
  %".1931" = srem i32 %"while_var_A.10", 10
  %".1932" = add i32 %".1931", 5
  %".1933" = call i32 @"fibonacci"(i32 %".1932")
  %".1934" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".1935" = call i32 (i8*, ...) @"printf"(i8* %".1934", i32 %".1933")
  br label %"ifcont.21"
else.21:
  br label %"ifcont.21"
ifcont.21:
  %"while_var_A.11" = load i32, i32* %"while_var_A"
  %".1938" = add i32 %"while_var_A.11", 1
  store i32 %".1938", i32* %"while_var_A"
  br label %"while.cond.8"
for.cond.17:
  %"i_rep.1" = load i32, i32* %"i_rep"
  %".1944" = icmp slt i32 %"i_rep.1", 20
  br i1 %".1944", label %"for.body.17", label %"for.exit.17"
for.body.17:
  %".1946" = sitofp i32 55 to double
  %".1947" = sitofp i32 5 to double
  %".1948" = call double @"llvm.pow.f64"(double %".1946", double %".1947")
  %".1949" = sitofp i32 5 to double
  %".1950" = fdiv double %".1948", %".1949"
  %"i_rep.2" = load i32, i32* %"i_rep"
  %".1951" = sitofp i32 %"i_rep.2" to double
  %".1952" = fadd double %".1950", %".1951"
  %".1953" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1954" = call i32 (i8*, ...) @"printf"(i8* %".1953", double %".1952")
  %".1955" = sitofp i32 5 to double
  %".1956" = sitofp i32 3 to double
  %".1957" = call double @"llvm.pow.f64"(double %".1955", double %".1956")
  %".1958" = sitofp i32 99 to double
  %".1959" = fmul double %".1958", %".1957"
  %"i_rep.3" = load i32, i32* %"i_rep"
  %".1960" = sitofp i32 %"i_rep.3" to double
  %".1961" = fsub double %".1959", %".1960"
  %".1962" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1963" = call i32 (i8*, ...) @"printf"(i8* %".1962", double %".1961")
  %".1964" = sitofp i32 3000 to double
  %".1965" = sitofp i32 4 to double
  %".1966" = fdiv double %".1964", %".1965"
  %".1967" = sitofp i32 9000 to double
  %".1968" = fmul double %".1966", %".1967"
  %"i_rep.4" = load i32, i32* %"i_rep"
  %".1969" = mul i32 %"i_rep.4", 10
  %".1970" = sitofp i32 %".1969" to double
  %".1971" = fadd double %".1968", %".1970"
  %".1972" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1973" = call i32 (i8*, ...) @"printf"(i8* %".1972", double %".1971")
  %".1974" = sub i32 88, 2
  %".1975" = mul i32 85, 18
  %".1976" = sitofp i32 100 to double
  %".1977" = sitofp i32 4 to double
  %".1978" = call double @"llvm.pow.f64"(double %".1976", double %".1977")
  %".1979" = sitofp i32 %".1975" to double
  %".1980" = fdiv double %".1979", %".1978"
  %".1981" = sitofp i32 %".1974" to double
  %".1982" = fadd double %".1981", %".1980"
  %"i_rep.5" = load i32, i32* %"i_rep"
  %".1983" = sitofp i32 %"i_rep.5" to double
  %".1984" = fdiv double %".1983", 0x4024000000000000
  %".1985" = fadd double %".1982", %".1984"
  %".1986" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1987" = call i32 (i8*, ...) @"printf"(i8* %".1986", double %".1985")
  %".1988" = sitofp i32 100 to double
  %".1989" = sitofp i32 2 to double
  %".1990" = fdiv double %".1988", %".1989"
  %".1991" = sitofp i32 88 to double
  %".1992" = fmul double %".1990", %".1991"
  %"i_rep.6" = load i32, i32* %"i_rep"
  %".1993" = mul i32 %"i_rep.6", 2
  %".1994" = sitofp i32 %".1993" to double
  %".1995" = fsub double %".1992", %".1994"
  %".1996" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".1997" = call i32 (i8*, ...) @"printf"(i8* %".1996", double %".1995")
  %".1998" = sitofp i32 58 to double
  %".1999" = sitofp i32 58 to double
  %".2000" = call double @"llvm.pow.f64"(double %".1998", double %".1999")
  %".2001" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2002" = call i32 (i8*, ...) @"printf"(i8* %".2001", double %".2000")
  %"zz.5" = load i32, i32* %"zz"
  %".2003" = sitofp i32 2 to double
  %".2004" = sitofp i32 %"zz.5" to double
  %".2005" = call double @"llvm.pow.f64"(double %".2003", double %".2004")
  %"i_rep.7" = load i32, i32* %"i_rep"
  %".2006" = sitofp i32 %"i_rep.7" to double
  %".2007" = fadd double %".2005", %".2006"
  %".2008" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2009" = call i32 (i8*, ...) @"printf"(i8* %".2008", double %".2007")
  %".2010" = sitofp i32 5 to double
  %".2011" = sitofp i32 5 to double
  %".2012" = call double @"llvm.pow.f64"(double %".2010", double %".2011")
  %".2013" = sitofp i32 200 to double
  %".2014" = fadd double %".2012", %".2013"
  %"i_rep.8" = load i32, i32* %"i_rep"
  %".2015" = mul i32 %"i_rep.8", 3
  %".2016" = sitofp i32 %".2015" to double
  %".2017" = fadd double %".2014", %".2016"
  %".2018" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2019" = call i32 (i8*, ...) @"printf"(i8* %".2018", double %".2017")
  %".2020" = sitofp i32 8 to double
  %".2021" = sitofp i32 88 to double
  %".2022" = call double @"llvm.pow.f64"(double %".2020", double %".2021")
  %".2023" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2024" = call i32 (i8*, ...) @"printf"(i8* %".2023", double %".2022")
  %".2025" = sitofp i32 200 to double
  %".2026" = sitofp i32 50 to double
  %".2027" = call double @"llvm.pow.f64"(double %".2025", double %".2026")
  %".2028" = sitofp i32 50 to double
  %".2029" = fdiv double %".2027", %".2028"
  %".2030" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2031" = call i32 (i8*, ...) @"printf"(i8* %".2030", double %".2029")
  %".2032" = sitofp i32 88 to double
  %".2033" = sitofp i32 8 to double
  %".2034" = call double @"llvm.pow.f64"(double %".2032", double %".2033")
  %".2035" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2036" = call i32 (i8*, ...) @"printf"(i8* %".2035", double %".2034")
  %".2037" = sitofp i32 70 to double
  %".2038" = sitofp i32 5 to double
  %".2039" = call double @"llvm.pow.f64"(double %".2037", double %".2038")
  %".2040" = sitofp i32 8 to double
  %".2041" = fdiv double %".2039", %".2040"
  %"i_rep.9" = load i32, i32* %"i_rep"
  %".2042" = sitofp i32 %"i_rep.9" to double
  %".2043" = fadd double %".2041", %".2042"
  %".2044" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2045" = call i32 (i8*, ...) @"printf"(i8* %".2044", double %".2043")
  %".2046" = sitofp i32 18 to double
  %".2047" = sitofp i32 4 to double
  %".2048" = call double @"llvm.pow.f64"(double %".2046", double %".2047")
  %".2049" = sitofp i32 2 to double
  %".2050" = fmul double %".2049", %".2048"
  %"i_rep.10" = load i32, i32* %"i_rep"
  %".2051" = sitofp i32 %"i_rep.10" to double
  %".2052" = fsub double %".2050", %".2051"
  %".2053" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2054" = call i32 (i8*, ...) @"printf"(i8* %".2053", double %".2052")
  %"num4.6" = load i32, i32* %"num4"
  %"num5.4" = load i32, i32* %"num5"
  %".2055" = sitofp i32 %"num4.6" to double
  %".2056" = sitofp i32 %"num5.4" to double
  %".2057" = call double @"llvm.pow.f64"(double %".2055", double %".2056")
  %".2058" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2059" = call i32 (i8*, ...) @"printf"(i8* %".2058", double %".2057")
  %".2060" = sitofp i32 50 to double
  %".2061" = sitofp i32 50 to double
  %".2062" = call double @"llvm.pow.f64"(double %".2060", double %".2061")
  %".2063" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2064" = call i32 (i8*, ...) @"printf"(i8* %".2063", double %".2062")
  %".2065" = sitofp i32 88 to double
  %".2066" = sitofp i32 75 to double
  %".2067" = call double @"llvm.pow.f64"(double %".2065", double %".2066")
  %".2068" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2069" = call i32 (i8*, ...) @"printf"(i8* %".2068", double %".2067")
  %"d_val.2" = load i32, i32* %"d_val"
  %"i_rep.11" = load i32, i32* %"i_rep"
  %".2070" = add i32 %"d_val.2", %"i_rep.11"
  %".2071" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2072" = call i32 (i8*, ...) @"printf"(i8* %".2071", i32 %".2070")
  %"num4.7" = load i32, i32* %"num4"
  %"num4.8" = load i32, i32* %"num4"
  %".2073" = sitofp i32 %"num4.7" to double
  %".2074" = sitofp i32 %"num4.8" to double
  %".2075" = call double @"llvm.pow.f64"(double %".2073", double %".2074")
  %".2076" = sitofp i32 2 to double
  %".2077" = fdiv double %".2075", %".2076"
  %"i_rep.12" = load i32, i32* %"i_rep"
  %".2078" = sitofp i32 %"i_rep.12" to double
  %".2079" = fadd double %".2077", %".2078"
  %".2080" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2081" = call i32 (i8*, ...) @"printf"(i8* %".2080", double %".2079")
  %"num4.9" = load i32, i32* %"num4"
  %".2082" = sitofp i32 %"num4.9" to double
  %".2083" = sitofp i32 50 to double
  %".2084" = call double @"llvm.pow.f64"(double %".2082", double %".2083")
  %".2085" = sitofp i32 2 to double
  %".2086" = fdiv double %".2084", %".2085"
  %"i_rep.13" = load i32, i32* %"i_rep"
  %".2087" = sitofp i32 %"i_rep.13" to double
  %".2088" = fsub double %".2086", %".2087"
  %".2089" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2090" = call i32 (i8*, ...) @"printf"(i8* %".2089", double %".2088")
  %"num5.5" = load i32, i32* %"num5"
  %".2091" = sitofp i32 50 to double
  %".2092" = sitofp i32 %"num5.5" to double
  %".2093" = call double @"llvm.pow.f64"(double %".2091", double %".2092")
  %".2094" = sitofp i32 20 to double
  %".2095" = fdiv double %".2093", %".2094"
  %"i_rep.14" = load i32, i32* %"i_rep"
  %".2096" = sitofp i32 %"i_rep.14" to double
  %".2097" = fadd double %".2095", %".2096"
  %".2098" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2099" = call i32 (i8*, ...) @"printf"(i8* %".2098", double %".2097")
  %".2100" = mul i32 18, 2
  %".2101" = mul i32 5, 10
  %".2102" = sitofp i32 %".2101" to double
  %".2103" = sitofp i32 8 to double
  %".2104" = fdiv double %".2102", %".2103"
  %".2105" = sitofp i32 %".2100" to double
  %".2106" = fadd double %".2105", %".2104"
  %".2107" = mul i32 5, 2
  %".2108" = sitofp i32 %".2107" to double
  %".2109" = fadd double %".2106", %".2108"
  %".2110" = sitofp i32 800000 to double
  %".2111" = fadd double %".2109", %".2110"
  %"i_rep.15" = load i32, i32* %"i_rep"
  %".2112" = mul i32 %"i_rep.15", 100
  %".2113" = sitofp i32 %".2112" to double
  %".2114" = fadd double %".2111", %".2113"
  %".2115" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2116" = call i32 (i8*, ...) @"printf"(i8* %".2115", double %".2114")
  %".2117" = mul i32 88, 88
  %".2118" = mul i32 %".2117", 88
  %".2119" = mul i32 %".2118", 88
  %".2120" = mul i32 %".2119", 88
  %".2121" = mul i32 %".2120", 5
  %".2122" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2123" = call i32 (i8*, ...) @"printf"(i8* %".2122", i32 %".2121")
  %".2124" = sitofp i32 42 to double
  %".2125" = sitofp i32 5 to double
  %".2126" = call double @"llvm.pow.f64"(double %".2124", double %".2125")
  %".2127" = sitofp i32 2 to double
  %".2128" = fdiv double %".2126", %".2127"
  %"i_rep.16" = load i32, i32* %"i_rep"
  %".2129" = sitofp i32 %"i_rep.16" to double
  %".2130" = fadd double %".2128", %".2129"
  %".2131" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2132" = call i32 (i8*, ...) @"printf"(i8* %".2131", double %".2130")
  %".2133" = sitofp i32 2 to double
  %".2134" = sitofp i32 9 to double
  %".2135" = call double @"llvm.pow.f64"(double %".2133", double %".2134")
  %".2136" = sitofp i32 78 to double
  %".2137" = fdiv double %".2136", %".2135"
  %"i_rep.17" = load i32, i32* %"i_rep"
  %".2138" = sitofp i32 %"i_rep.17" to double
  %".2139" = fsub double %".2137", %".2138"
  %".2140" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2141" = call i32 (i8*, ...) @"printf"(i8* %".2140", double %".2139")
  %".2142" = sitofp i32 99 to double
  %".2143" = sitofp i32 2 to double
  %".2144" = call double @"llvm.pow.f64"(double %".2142", double %".2143")
  %".2145" = sitofp i32 28 to double
  %".2146" = fdiv double %".2145", %".2144"
  %".2147" = sitofp i32 6 to double
  %".2148" = fadd double %".2146", %".2147"
  %"i_rep.18" = load i32, i32* %"i_rep"
  %".2149" = sitofp i32 %"i_rep.18" to double
  %".2150" = fadd double %".2148", %".2149"
  %".2151" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2152" = call i32 (i8*, ...) @"printf"(i8* %".2151", double %".2150")
  %".2153" = sitofp i32 5 to double
  %".2154" = sitofp i32 5 to double
  %".2155" = call double @"llvm.pow.f64"(double %".2153", double %".2154")
  %".2156" = sitofp i32 2 to double
  %".2157" = fadd double %".2155", %".2156"
  %"i_rep.19" = load i32, i32* %"i_rep"
  %".2158" = mul i32 %"i_rep.19", 5
  %".2159" = sitofp i32 %".2158" to double
  %".2160" = fadd double %".2157", %".2159"
  %".2161" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2162" = call i32 (i8*, ...) @"printf"(i8* %".2161", double %".2160")
  %".2163" = sitofp i32 78 to double
  %".2164" = sitofp i32 25 to double
  %".2165" = call double @"llvm.pow.f64"(double %".2163", double %".2164")
  %".2166" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2167" = call i32 (i8*, ...) @"printf"(i8* %".2166", double %".2165")
  %".2168" = sitofp i32 125 to double
  %".2169" = sitofp i32 5 to double
  %".2170" = call double @"llvm.pow.f64"(double %".2168", double %".2169")
  %".2171" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2172" = call i32 (i8*, ...) @"printf"(i8* %".2171", double %".2170")
  %".2173" = sitofp i32 83 to double
  %".2174" = sitofp i32 55 to double
  %".2175" = call double @"llvm.pow.f64"(double %".2173", double %".2174")
  %".2176" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2177" = call i32 (i8*, ...) @"printf"(i8* %".2176", double %".2175")
  %".2178" = sitofp i32 78 to double
  %".2179" = sitofp i32 2 to double
  %".2180" = call double @"llvm.pow.f64"(double %".2178", double %".2179")
  %".2181" = sitofp i32 5 to double
  %".2182" = fadd double %".2180", %".2181"
  %"i_rep.20" = load i32, i32* %"i_rep"
  %".2183" = sitofp i32 %"i_rep.20" to double
  %".2184" = fadd double %".2182", %".2183"
  %".2185" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2186" = call i32 (i8*, ...) @"printf"(i8* %".2185", double %".2184")
  %"div_main.2" = load double, double* %"div_main"
  %"i_rep.21" = load i32, i32* %"i_rep"
  %".2187" = sitofp i32 %"i_rep.21" to double
  %".2188" = fdiv double %".2187", 0x4000000000000000
  %".2189" = fadd double %"div_main.2", %".2188"
  %".2190" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2191" = call i32 (i8*, ...) @"printf"(i8* %".2190", double %".2189")
  %".2192" = mul i32 3, 5
  %".2193" = add i32 %".2192", 2
  %".2194" = sub i32 %".2193", 88
  %".2195" = sitofp i32 250 to double
  %".2196" = sitofp i32 2 to double
  %".2197" = fdiv double %".2195", %".2196"
  %".2198" = sitofp i32 %".2194" to double
  %".2199" = fadd double %".2198", %".2197"
  %".2200" = mul i32 789, 2
  %".2201" = sitofp i32 %".2200" to double
  %".2202" = fadd double %".2199", %".2201"
  %".2203" = mul i32 56, 2
  %".2204" = sitofp i32 %".2203" to double
  %".2205" = fadd double %".2202", %".2204"
  %".2206" = sitofp i32 300 to double
  %".2207" = fadd double %".2205", %".2206"
  %".2208" = sitofp i32 7896 to double
  %".2209" = fsub double %".2207", %".2208"
  %"i_rep.22" = load i32, i32* %"i_rep"
  %".2210" = mul i32 %"i_rep.22", 10
  %".2211" = sitofp i32 %".2210" to double
  %".2212" = fsub double %".2209", %".2211"
  %".2213" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2214" = call i32 (i8*, ...) @"printf"(i8* %".2213", double %".2212")
  %".2215" = sitofp i32 23 to double
  %".2216" = sitofp i32 23 to double
  %".2217" = call double @"llvm.pow.f64"(double %".2215", double %".2216")
  %".2218" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2219" = call i32 (i8*, ...) @"printf"(i8* %".2218", double %".2217")
  %"t_main.3" = load double, double* %"t_main"
  %"i_rep.23" = load i32, i32* %"i_rep"
  %".2220" = sitofp i32 %"i_rep.23" to double
  %".2221" = fadd double %"t_main.3", %".2220"
  %".2222" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2223" = call i32 (i8*, ...) @"printf"(i8* %".2222", double %".2221")
  %"var_main.5" = load i32, i32* %"var_main"
  %".2224" = sitofp i32 250 to double
  %".2225" = sitofp i32 2 to double
  %".2226" = call double @"llvm.pow.f64"(double %".2224", double %".2225")
  %".2227" = sitofp i32 %"var_main.5" to double
  %".2228" = fadd double %".2227", %".2226"
  %"i_rep.24" = load i32, i32* %"i_rep"
  %".2229" = sitofp i32 %"i_rep.24" to double
  %".2230" = fadd double %".2228", %".2229"
  %".2231" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2232" = call i32 (i8*, ...) @"printf"(i8* %".2231", double %".2230")
  %"var_main.6" = load i32, i32* %"var_main"
  %".2233" = sitofp i32 2 to double
  %".2234" = sitofp i32 %"var_main.6" to double
  %".2235" = call double @"llvm.pow.f64"(double %".2233", double %".2234")
  %".2236" = sitofp i32 200 to double
  %".2237" = sitofp i32 2 to double
  %".2238" = call double @"llvm.pow.f64"(double %".2236", double %".2237")
  %".2239" = sitofp i32 55 to double
  %".2240" = fmul double %".2239", %".2238"
  %".2241" = mul i32 58, 2
  %".2242" = sitofp i32 %".2241" to double
  %".2243" = fadd double %".2240", %".2242"
  %".2244" = fadd double %".2235", %".2243"
  %"i_rep.25" = load i32, i32* %"i_rep"
  %".2245" = sitofp i32 %"i_rep.25" to double
  %".2246" = fadd double %".2244", %".2245"
  %".2247" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2248" = call i32 (i8*, ...) @"printf"(i8* %".2247", double %".2246")
  %".2249" = sitofp i32 6 to double
  %".2250" = sitofp i32 6 to double
  %".2251" = call double @"llvm.pow.f64"(double %".2249", double %".2250")
  %".2252" = sitofp i32 2 to double
  %".2253" = fadd double %".2251", %".2252"
  %"i_rep.26" = load i32, i32* %"i_rep"
  %".2254" = sitofp i32 %"i_rep.26" to double
  %".2255" = fsub double %".2253", %".2254"
  %".2256" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2257" = call i32 (i8*, ...) @"printf"(i8* %".2256", double %".2255")
  %"variable_main.4" = load i32, i32* %"variable_main"
  %".2258" = sitofp i32 100 to double
  %".2259" = sitofp i32 %"variable_main.4" to double
  %".2260" = call double @"llvm.pow.f64"(double %".2258", double %".2259")
  %".2261" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2262" = call i32 (i8*, ...) @"printf"(i8* %".2261", double %".2260")
  %"variable_main.5" = load i32, i32* %"variable_main"
  %".2263" = sitofp i32 55 to double
  %".2264" = sitofp i32 %"variable_main.5" to double
  %".2265" = call double @"llvm.pow.f64"(double %".2263", double %".2264")
  %".2266" = sitofp i32 300 to double
  %".2267" = fadd double %".2265", %".2266"
  %".2268" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2269" = call i32 (i8*, ...) @"printf"(i8* %".2268", double %".2267")
  %"variable_main.6" = load i32, i32* %"variable_main"
  %".2270" = mul i32 300, 55
  %".2271" = add i32 %"variable_main.6", %".2270"
  %"i_rep.27" = load i32, i32* %"i_rep"
  %".2272" = add i32 %".2271", %"i_rep.27"
  %".2273" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2274" = call i32 (i8*, ...) @"printf"(i8* %".2273", i32 %".2272")
  %".2275" = add i32 3, 5
  %".2276" = mul i32 25, %".2275"
  %".2277" = sub i32 5, %".2276"
  %"i_rep.28" = load i32, i32* %"i_rep"
  %".2278" = add i32 %".2277", %"i_rep.28"
  %".2279" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2280" = call i32 (i8*, ...) @"printf"(i8* %".2279", i32 %".2278")
  %"z_float_main.2" = load double, double* %"z_float_main"
  %".2281" = sitofp i32 1 to double
  %".2282" = fsub double %"z_float_main.2", %".2281"
  %"i_rep.29" = load i32, i32* %"i_rep"
  %".2283" = sitofp i32 %"i_rep.29" to double
  %".2284" = fadd double %".2282", %".2283"
  %".2285" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2286" = call i32 (i8*, ...) @"printf"(i8* %".2285", double %".2284")
  %"resultadoF_main.2" = load i32, i32* %"resultadoF_main"
  %"i_rep.30" = load i32, i32* %"i_rep"
  %".2287" = add i32 %"resultadoF_main.2", %"i_rep.30"
  %".2288" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2289" = call i32 (i8*, ...) @"printf"(i8* %".2288", i32 %".2287")
  %"yy_main.2" = load i32, i32* %"yy_main"
  %"i_rep.31" = load i32, i32* %"i_rep"
  %".2290" = add i32 %"yy_main.2", %"i_rep.31"
  %".2291" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2292" = call i32 (i8*, ...) @"printf"(i8* %".2291", i32 %".2290")
  %".2293" = mul i32 2, 5
  %"i_rep.32" = load i32, i32* %"i_rep"
  %".2294" = add i32 %".2293", %"i_rep.32"
  %".2295" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2296" = call i32 (i8*, ...) @"printf"(i8* %".2295", i32 %".2294")
  %"x_orig_main.5" = load i32, i32* %"x_orig_main"
  %".2297" = mul i32 %"x_orig_main.5", 4
  %".2298" = add i32 2, %".2297"
  %"i_rep.33" = load i32, i32* %"i_rep"
  %".2299" = sub i32 %".2298", %"i_rep.33"
  %".2300" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2301" = call i32 (i8*, ...) @"printf"(i8* %".2300", i32 %".2299")
  %".2302" = add i32 2, 3
  %".2303" = mul i32 %".2302", 4
  %"i_rep.34" = load i32, i32* %"i_rep"
  %".2304" = add i32 %".2303", %"i_rep.34"
  %".2305" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2306" = call i32 (i8*, ...) @"printf"(i8* %".2305", i32 %".2304")
  %".2307" = sitofp i32 10 to double
  %".2308" = sitofp i32 2 to double
  %".2309" = fdiv double %".2307", %".2308"
  %"i_rep.35" = load i32, i32* %"i_rep"
  %".2310" = sitofp i32 %"i_rep.35" to double
  %".2311" = fsub double %".2309", %".2310"
  %".2312" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2313" = call i32 (i8*, ...) @"printf"(i8* %".2312", double %".2311")
  %".2314" = sitofp i32 2 to double
  %".2315" = sitofp i32 3 to double
  %".2316" = call double @"llvm.pow.f64"(double %".2314", double %".2315")
  %"i_rep.36" = load i32, i32* %"i_rep"
  %".2317" = sitofp i32 %"i_rep.36" to double
  %".2318" = fadd double %".2316", %".2317"
  %".2319" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2320" = call i32 (i8*, ...) @"printf"(i8* %".2319", double %".2318")
  %".2321" = sitofp i32 3 to double
  %".2322" = sitofp i32 2 to double
  %".2323" = call double @"llvm.pow.f64"(double %".2321", double %".2322")
  %".2324" = sitofp i32 2 to double
  %".2325" = call double @"llvm.pow.f64"(double %".2324", double %".2323")
  %".2326" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2327" = call i32 (i8*, ...) @"printf"(i8* %".2326", double %".2325")
  %".2328" = mul i32 3, 2
  %".2329" = add i32 5, %".2328"
  %".2330" = sitofp i32 4 to double
  %".2331" = sitofp i32 2 to double
  %".2332" = fdiv double %".2330", %".2331"
  %".2333" = sitofp i32 %".2329" to double
  %".2334" = fsub double %".2333", %".2332"
  %"i_rep.37" = load i32, i32* %"i_rep"
  %".2335" = sitofp i32 %"i_rep.37" to double
  %".2336" = fadd double %".2334", %".2335"
  %".2337" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2338" = call i32 (i8*, ...) @"printf"(i8* %".2337", double %".2336")
  %".2339" = add i32 3, 4
  %".2340" = sitofp i32 2 to double
  %".2341" = sitofp i32 3 to double
  %".2342" = call double @"llvm.pow.f64"(double %".2340", double %".2341")
  %".2343" = sitofp i32 %".2339" to double
  %".2344" = fmul double %".2343", %".2342"
  %".2345" = sitofp i32 10 to double
  %".2346" = sitofp i32 2 to double
  %".2347" = fdiv double %".2345", %".2346"
  %".2348" = fsub double %".2344", %".2347"
  %"i_rep.38" = load i32, i32* %"i_rep"
  %".2349" = sitofp i32 %"i_rep.38" to double
  %".2350" = fsub double %".2348", %".2349"
  %".2351" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2352" = call i32 (i8*, ...) @"printf"(i8* %".2351", double %".2350")
  %".2353" = sitofp i32 5 to double
  %".2354" = sitofp i32 2 to double
  %".2355" = fdiv double %".2353", %".2354"
  %"i_rep.39" = load i32, i32* %"i_rep"
  %".2356" = sitofp i32 %"i_rep.39" to double
  %".2357" = fdiv double %".2356", 0x4014000000000000
  %".2358" = fadd double %".2355", %".2357"
  %".2359" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2360" = call i32 (i8*, ...) @"printf"(i8* %".2359", double %".2358")
  %".2361" = sub i32 0, 2
  %".2362" = mul i32 4, %".2361"
  %".2363" = add i32 2, %".2362"
  %"i_rep.40" = load i32, i32* %"i_rep"
  %".2364" = sub i32 %".2363", %"i_rep.40"
  %".2365" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2366" = call i32 (i8*, ...) @"printf"(i8* %".2365", i32 %".2364")
  %"b_val_main.2" = load i32, i32* %"b_val_main"
  %"i_rep.41" = load i32, i32* %"i_rep"
  %".2367" = add i32 %"b_val_main.2", %"i_rep.41"
  %".2368" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2369" = call i32 (i8*, ...) @"printf"(i8* %".2368", i32 %".2367")
  %"i_rep.42" = load i32, i32* %"i_rep"
  %".2370" = add i32 5, %"i_rep.42"
  %".2371" = call i32 @"funcionB"(i32 %".2370")
  %".2372" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2373" = call i32 (i8*, ...) @"printf"(i8* %".2372", i32 %".2371")
  %"y_float_main.2" = load double, double* %"y_float_main"
  %"i_rep.43" = load i32, i32* %"i_rep"
  %".2374" = sitofp i32 %"i_rep.43" to double
  %".2375" = fdiv double %".2374", 0x4008000000000000
  %".2376" = fadd double %"y_float_main.2", %".2375"
  %".2377" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2378" = call i32 (i8*, ...) @"printf"(i8* %".2377", double %".2376")
  %".2379" = add i32 7, 2
  %".2380" = sitofp i32 3 to double
  %".2381" = sitofp i32 12 to double
  %".2382" = call double @"llvm.pow.f64"(double %".2380", double %".2381")
  %".2383" = sitofp i32 %".2379" to double
  %".2384" = fadd double %".2383", %".2382"
  %"i_rep.44" = load i32, i32* %"i_rep"
  %".2385" = sitofp i32 %"i_rep.44" to double
  %".2386" = fadd double %".2384", %".2385"
  %".2387" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2388" = call i32 (i8*, ...) @"printf"(i8* %".2387", double %".2386")
  %".2389" = sitofp i32 2 to double
  %".2390" = sitofp i32 5 to double
  %".2391" = call double @"llvm.pow.f64"(double %".2389", double %".2390")
  %".2392" = sitofp i32 5 to double
  %".2393" = sitofp i32 2 to double
  %".2394" = call double @"llvm.pow.f64"(double %".2392", double %".2393")
  %".2395" = fmul double %".2391", %".2394"
  %"i_rep.45" = load i32, i32* %"i_rep"
  %".2396" = sitofp i32 %"i_rep.45" to double
  %".2397" = fsub double %".2395", %".2396"
  %".2398" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2399" = call i32 (i8*, ...) @"printf"(i8* %".2398", double %".2397")
  %".2400" = sitofp i32 5 to double
  %".2401" = sitofp i32 25 to double
  %".2402" = call double @"llvm.pow.f64"(double %".2400", double %".2401")
  %".2403" = sitofp i32 5 to double
  %".2404" = fmul double %".2403", %".2402"
  %".2405" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2406" = call i32 (i8*, ...) @"printf"(i8* %".2405", double %".2404")
  %".2407" = mul i32 2, 23
  %".2408" = sub i32 %".2407", 23
  %"i_rep.46" = load i32, i32* %"i_rep"
  %".2409" = add i32 %".2408", %"i_rep.46"
  %".2410" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2411" = call i32 (i8*, ...) @"printf"(i8* %".2410", i32 %".2409")
  %"x_orig_main.6" = load i32, i32* %"x_orig_main"
  %".2412" = sitofp i32 30 to double
  %".2413" = sitofp i32 %"x_orig_main.6" to double
  %".2414" = call double @"llvm.pow.f64"(double %".2412", double %".2413")
  %".2415" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2416" = call i32 (i8*, ...) @"printf"(i8* %".2415", double %".2414")
  %".2417" = mul i32 2, 2
  %".2418" = mul i32 %".2417", 2
  %".2419" = sitofp i32 %".2418" to double
  %".2420" = sitofp i32 2 to double
  %".2421" = fdiv double %".2419", %".2420"
  %".2422" = mul i32 2, 2
  %".2423" = sitofp i32 %".2422" to double
  %".2424" = fadd double %".2421", %".2423"
  %".2425" = mul i32 2, 2
  %".2426" = sitofp i32 %".2425" to double
  %".2427" = fadd double %".2424", %".2426"
  %".2428" = mul i32 2, 2
  %".2429" = sitofp i32 %".2428" to double
  %".2430" = fadd double %".2427", %".2429"
  %".2431" = mul i32 2, 2
  %".2432" = sitofp i32 %".2431" to double
  %".2433" = fadd double %".2430", %".2432"
  %".2434" = mul i32 2, 2
  %".2435" = sitofp i32 %".2434" to double
  %".2436" = fadd double %".2433", %".2435"
  %"i_rep.47" = load i32, i32* %"i_rep"
  %".2437" = sitofp i32 %"i_rep.47" to double
  %".2438" = fsub double %".2436", %".2437"
  %".2439" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2440" = call i32 (i8*, ...) @"printf"(i8* %".2439", double %".2438")
  %"x_orig_main.7" = load i32, i32* %"x_orig_main"
  %"x_orig_main.8" = load i32, i32* %"x_orig_main"
  %".2441" = sitofp i32 %"x_orig_main.7" to double
  %".2442" = sitofp i32 %"x_orig_main.8" to double
  %".2443" = call double @"llvm.pow.f64"(double %".2441", double %".2442")
  %".2444" = mul i32 2, 5
  %".2445" = sitofp i32 %".2444" to double
  %".2446" = fadd double %".2443", %".2445"
  %"i_rep.48" = load i32, i32* %"i_rep"
  %".2447" = sitofp i32 %"i_rep.48" to double
  %".2448" = fadd double %".2446", %".2447"
  %".2449" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2450" = call i32 (i8*, ...) @"printf"(i8* %".2449", double %".2448")
  %"resultadoSumaHasta_main.2" = load i32, i32* %"resultadoSumaHasta_main"
  %"i_rep.49" = load i32, i32* %"i_rep"
  %".2451" = add i32 %"resultadoSumaHasta_main.2", %"i_rep.49"
  %".2452" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2453" = call i32 (i8*, ...) @"printf"(i8* %".2452", i32 %".2451")
  %"resultadoFFF_main.2" = load i32, i32* %"resultadoFFF_main"
  %"i_rep.50" = load i32, i32* %"i_rep"
  %".2454" = add i32 %"resultadoFFF_main.2", %"i_rep.50"
  %".2455" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2456" = call i32 (i8*, ...) @"printf"(i8* %".2455", i32 %".2454")
  %"resultadoFFFF_main.2" = load i32, i32* %"resultadoFFFF_main"
  %"i_rep.51" = load i32, i32* %"i_rep"
  %".2457" = add i32 %"resultadoFFFF_main.2", %"i_rep.51"
  %".2458" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2459" = call i32 (i8*, ...) @"printf"(i8* %".2458", i32 %".2457")
  %"varA_main.6" = load i32, i32* %"varA_main"
  %"varB_main.6" = load i32, i32* %"varB_main"
  %".2460" = add i32 %"varA_main.6", %"varB_main.6"
  %"varC_main.4" = load i32, i32* %"varC_main"
  %".2461" = add i32 %".2460", %"varC_main.4"
  %"i_rep.52" = load i32, i32* %"i_rep"
  %".2462" = add i32 %".2461", %"i_rep.52"
  %".2463" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2464" = call i32 (i8*, ...) @"printf"(i8* %".2463", i32 %".2462")
  %"varA_main.7" = load i32, i32* %"varA_main"
  %"varB_main.7" = load i32, i32* %"varB_main"
  %".2465" = mul i32 %"varA_main.7", %"varB_main.7"
  %"varC_main.5" = load i32, i32* %"varC_main"
  %".2466" = sub i32 %".2465", %"varC_main.5"
  %"i_rep.53" = load i32, i32* %"i_rep"
  %".2467" = sub i32 %".2466", %"i_rep.53"
  %".2468" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2469" = call i32 (i8*, ...) @"printf"(i8* %".2468", i32 %".2467")
  %"varC_main.6" = load i32, i32* %"varC_main"
  %"varA_main.8" = load i32, i32* %"varA_main"
  %".2470" = sitofp i32 %"varC_main.6" to double
  %".2471" = sitofp i32 %"varA_main.8" to double
  %".2472" = fdiv double %".2470", %".2471"
  %"varB_main.8" = load i32, i32* %"varB_main"
  %".2473" = sitofp i32 %"varB_main.8" to double
  %".2474" = fadd double %".2472", %".2473"
  %"i_rep.54" = load i32, i32* %"i_rep"
  %".2475" = sitofp i32 %"i_rep.54" to double
  %".2476" = fadd double %".2474", %".2475"
  %".2477" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2478" = call i32 (i8*, ...) @"printf"(i8* %".2477", double %".2476")
  %"varA_main.9" = load i32, i32* %"varA_main"
  %".2479" = sitofp i32 %"varA_main.9" to double
  %".2480" = sitofp i32 2 to double
  %".2481" = call double @"llvm.pow.f64"(double %".2479", double %".2480")
  %"varB_main.9" = load i32, i32* %"varB_main"
  %".2482" = sitofp i32 %"varB_main.9" to double
  %".2483" = sitofp i32 2 to double
  %".2484" = call double @"llvm.pow.f64"(double %".2482", double %".2483")
  %".2485" = fadd double %".2481", %".2484"
  %"i_rep.55" = load i32, i32* %"i_rep"
  %".2486" = sitofp i32 %"i_rep.55" to double
  %".2487" = fsub double %".2485", %".2486"
  %".2488" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2489" = call i32 (i8*, ...) @"printf"(i8* %".2488", double %".2487")
  %"i_rep.56" = load i32, i32* %"i_rep"
  %".2490" = add i32 10, %"i_rep.56"
  %"i_rep.57" = load i32, i32* %"i_rep"
  %".2491" = sub i32 20, %"i_rep.57"
  %".2492" = call i32 @"multiplicar"(i32 %".2490", i32 %".2491")
  %".2493" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2494" = call i32 (i8*, ...) @"printf"(i8* %".2493", i32 %".2492")
  %"i_rep.58" = load i32, i32* %"i_rep"
  %".2495" = sitofp i32 %"i_rep.58" to double
  %".2496" = fadd double 0x4059000000000000, %".2495"
  %"i_rep.59" = load i32, i32* %"i_rep"
  %".2497" = srem i32 %"i_rep.59", 2
  %".2498" = sitofp i32 %".2497" to double
  %".2499" = fadd double 0x4010000000000000, %".2498"
  %".2500" = sitofp i32 1 to double
  %".2501" = fadd double %".2499", %".2500"
  %".2502" = call double @"dividir"(double %".2496", double %".2501")
  %".2503" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2504" = call i32 (i8*, ...) @"printf"(i8* %".2503", double %".2502")
  %"i_rep.60" = load i32, i32* %"i_rep"
  %".2505" = add i32 7, %"i_rep.60"
  %".2506" = call i1 @"esPar"(i32 %".2505")
  %".2507" = zext i1 %".2506" to i32
  %".2508" = bitcast [4 x i8]* @"fmt_boolean" to i8*
  %".2509" = call i32 (i8*, ...) @"printf"(i8* %".2508", i32 %".2507")
  %"i_rep.61" = load i32, i32* %"i_rep"
  %".2510" = add i32 8, %"i_rep.61"
  %".2511" = call i1 @"esPar"(i32 %".2510")
  %".2512" = zext i1 %".2511" to i32
  %".2513" = bitcast [4 x i8]* @"fmt_boolean" to i8*
  %".2514" = call i32 (i8*, ...) @"printf"(i8* %".2513", i32 %".2512")
  %"f1_main.6" = load double, double* %"f1_main"
  %"f2_main.5" = load double, double* %"f2_main"
  %".2515" = fadd double %"f1_main.6", %"f2_main.5"
  %"i_rep.62" = load i32, i32* %"i_rep"
  %".2516" = sitofp i32 %"i_rep.62" to double
  %".2517" = fadd double %".2515", %".2516"
  %".2518" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2519" = call i32 (i8*, ...) @"printf"(i8* %".2518", double %".2517")
  %"f1_main.7" = load double, double* %"f1_main"
  %"f2_main.6" = load double, double* %"f2_main"
  %".2520" = fmul double %"f1_main.7", %"f2_main.6"
  %"i_rep.63" = load i32, i32* %"i_rep"
  %".2521" = sitofp i32 %"i_rep.63" to double
  %".2522" = fsub double %".2520", %".2521"
  %".2523" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2524" = call i32 (i8*, ...) @"printf"(i8* %".2523", double %".2522")
  %"f1_main.8" = load double, double* %"f1_main"
  %"f2_main.7" = load double, double* %"f2_main"
  %".2525" = fdiv double %"f1_main.8", %"f2_main.7"
  %"i_rep.64" = load i32, i32* %"i_rep"
  %".2526" = sitofp i32 %"i_rep.64" to double
  %".2527" = fdiv double %".2526", 0x4000000000000000
  %".2528" = fadd double %".2525", %".2527"
  %".2529" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2530" = call i32 (i8*, ...) @"printf"(i8* %".2529", double %".2528")
  %"f1_main.9" = load double, double* %"f1_main"
  %"f2_main.8" = load double, double* %"f2_main"
  %".2531" = fsub double %"f1_main.9", %"f2_main.8"
  %"i_rep.65" = load i32, i32* %"i_rep"
  %".2532" = sitofp i32 %"i_rep.65" to double
  %".2533" = fdiv double %".2532", 0x4000000000000000
  %".2534" = fsub double %".2531", %".2533"
  %".2535" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2536" = call i32 (i8*, ...) @"printf"(i8* %".2535", double %".2534")
  %"f1_main.10" = load double, double* %"f1_main"
  %".2537" = sitofp i32 2 to double
  %".2538" = call double @"llvm.pow.f64"(double %"f1_main.10", double %".2537")
  %"i_rep.66" = load i32, i32* %"i_rep"
  %".2539" = sitofp i32 %"i_rep.66" to double
  %".2540" = fadd double %".2538", %".2539"
  %".2541" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2542" = call i32 (i8*, ...) @"printf"(i8* %".2541", double %".2540")
  %"arr_sim_1_main.5" = load i32, i32* %"arr_sim_1_main"
  %"arr_sim_2_main.3" = load i32, i32* %"arr_sim_2_main"
  %".2543" = add i32 %"arr_sim_1_main.5", %"arr_sim_2_main.3"
  %"i_rep.67" = load i32, i32* %"i_rep"
  %".2544" = add i32 %".2543", %"i_rep.67"
  %".2545" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2546" = call i32 (i8*, ...) @"printf"(i8* %".2545", i32 %".2544")
  %"arr_sim_3_main.3" = load i32, i32* %"arr_sim_3_main"
  %"arr_sim_1_main.6" = load i32, i32* %"arr_sim_1_main"
  %".2547" = sub i32 %"arr_sim_3_main.3", %"arr_sim_1_main.6"
  %"i_rep.68" = load i32, i32* %"i_rep"
  %".2548" = sub i32 %".2547", %"i_rep.68"
  %".2549" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2550" = call i32 (i8*, ...) @"printf"(i8* %".2549", i32 %".2548")
  %"arr_sim_4_main.3" = load i32, i32* %"arr_sim_4_main"
  %".2551" = mul i32 %"arr_sim_4_main.3", 2
  %"i_rep.69" = load i32, i32* %"i_rep"
  %".2552" = add i32 %".2551", %"i_rep.69"
  %".2553" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2554" = call i32 (i8*, ...) @"printf"(i8* %".2553", i32 %".2552")
  %"arr_sim_5_main.3" = load i32, i32* %"arr_sim_5_main"
  %".2555" = sitofp i32 %"arr_sim_5_main.3" to double
  %".2556" = sitofp i32 5 to double
  %".2557" = fdiv double %".2555", %".2556"
  %"i_rep.70" = load i32, i32* %"i_rep"
  %".2558" = sitofp i32 %"i_rep.70" to double
  %".2559" = fsub double %".2557", %".2558"
  %".2560" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2561" = call i32 (i8*, ...) @"printf"(i8* %".2560", double %".2559")
  %"arr_sim_1_main.7" = load i32, i32* %"arr_sim_1_main"
  %".2562" = sitofp i32 %"arr_sim_1_main.7" to double
  %".2563" = sitofp i32 3 to double
  %".2564" = call double @"llvm.pow.f64"(double %".2562", double %".2563")
  %"i_rep.71" = load i32, i32* %"i_rep"
  %".2565" = sitofp i32 %"i_rep.71" to double
  %".2566" = fadd double %".2564", %".2565"
  %".2567" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2568" = call i32 (i8*, ...) @"printf"(i8* %".2567", double %".2566")
  %"i_rep.72" = load i32, i32* %"i_rep"
  %".2569" = srem i32 %"i_rep.72", 3
  %".2570" = add i32 3, %".2569"
  %"i_rep.73" = load i32, i32* %"i_rep"
  %".2571" = srem i32 %"i_rep.73", 2
  %".2572" = sub i32 4, %".2571"
  %".2573" = call i32 @"potencia"(i32 %".2570", i32 %".2572")
  %".2574" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2575" = call i32 (i8*, ...) @"printf"(i8* %".2574", i32 %".2573")
  %"i_rep.74" = load i32, i32* %"i_rep"
  %".2576" = add i32 100, %"i_rep.74"
  %"i_rep.75" = load i32, i32* %"i_rep"
  %".2577" = sub i32 234, %"i_rep.75"
  %".2578" = call i32 @"sumar"(i32 %".2576", i32 %".2577")
  %".2579" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2580" = call i32 (i8*, ...) @"printf"(i8* %".2579", i32 %".2578")
  %"i_rep.76" = load i32, i32* %"i_rep"
  %".2581" = add i32 77, %"i_rep.76"
  %".2582" = call i32 @"doble"(i32 %".2581")
  %".2583" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2584" = call i32 (i8*, ...) @"printf"(i8* %".2583", i32 %".2582")
  %"i_rep.77" = load i32, i32* %"i_rep"
  %".2585" = add i32 25, %"i_rep.77"
  %".2586" = call i32 @"funcionA"(i32 %".2585")
  %".2587" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2588" = call i32 (i8*, ...) @"printf"(i8* %".2587", i32 %".2586")
  %"i_rep.78" = load i32, i32* %"i_rep"
  %".2589" = add i32 12, %"i_rep.78"
  %".2590" = call i32 @"funcionB"(i32 %".2589")
  %".2591" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2592" = call i32 (i8*, ...) @"printf"(i8* %".2591", i32 %".2590")
  %".2593" = mul i32 1000, 2
  %".2594" = sitofp i32 3000 to double
  %".2595" = sitofp i32 10 to double
  %".2596" = fdiv double %".2594", %".2595"
  %".2597" = sitofp i32 %".2593" to double
  %".2598" = fadd double %".2597", %".2596"
  %".2599" = sitofp i32 5 to double
  %".2600" = fsub double %".2598", %".2599"
  %"i_rep.79" = load i32, i32* %"i_rep"
  %".2601" = mul i32 %"i_rep.79", 10
  %".2602" = sitofp i32 %".2601" to double
  %".2603" = fadd double %".2600", %".2602"
  %".2604" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2605" = call i32 (i8*, ...) @"printf"(i8* %".2604", double %".2603")
  %".2606" = sitofp i32 7 to double
  %".2607" = sitofp i32 3 to double
  %".2608" = call double @"llvm.pow.f64"(double %".2606", double %".2607")
  %".2609" = sitofp i32 8 to double
  %".2610" = sitofp i32 3 to double
  %".2611" = call double @"llvm.pow.f64"(double %".2609", double %".2610")
  %".2612" = fadd double %".2608", %".2611"
  %".2613" = sitofp i32 9 to double
  %".2614" = sitofp i32 3 to double
  %".2615" = call double @"llvm.pow.f64"(double %".2613", double %".2614")
  %".2616" = fadd double %".2612", %".2615"
  %"i_rep.80" = load i32, i32* %"i_rep"
  %".2617" = mul i32 %"i_rep.80", 5
  %".2618" = sitofp i32 %".2617" to double
  %".2619" = fsub double %".2616", %".2618"
  %".2620" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2621" = call i32 (i8*, ...) @"printf"(i8* %".2620", double %".2619")
  %".2622" = add i32 1, 2
  %".2623" = add i32 %".2622", 3
  %".2624" = add i32 %".2623", 4
  %".2625" = add i32 %".2624", 5
  %".2626" = sitofp i32 %".2625" to double
  %".2627" = sitofp i32 2 to double
  %".2628" = call double @"llvm.pow.f64"(double %".2626", double %".2627")
  %"i_rep.81" = load i32, i32* %"i_rep"
  %".2629" = sitofp i32 %"i_rep.81" to double
  %".2630" = fadd double %".2628", %".2629"
  %".2631" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2632" = call i32 (i8*, ...) @"printf"(i8* %".2631", double %".2630")
  %".2633" = sitofp i32 9999 to double
  %".2634" = sitofp i32 33 to double
  %".2635" = fdiv double %".2633", %".2634"
  %".2636" = sitofp i32 2222 to double
  %".2637" = sitofp i32 11 to double
  %".2638" = fdiv double %".2636", %".2637"
  %".2639" = fadd double %".2635", %".2638"
  %"i_rep.82" = load i32, i32* %"i_rep"
  %".2640" = sitofp i32 %"i_rep.82" to double
  %".2641" = fsub double %".2639", %".2640"
  %".2642" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2643" = call i32 (i8*, ...) @"printf"(i8* %".2642", double %".2641")
  %"i_rep.83" = load i32, i32* %"i_rep"
  %".2644" = add i32 10, %"i_rep.83"
  %".2645" = call i32 @"calcularAreaCuadrado"(i32 %".2644")
  %".2646" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2647" = call i32 (i8*, ...) @"printf"(i8* %".2646", i32 %".2645")
  %"i_rep.84" = load i32, i32* %"i_rep"
  %".2648" = sub i32 25, %"i_rep.84"
  %".2649" = call i32 @"calcularAreaCuadrado"(i32 %".2648")
  %".2650" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2651" = call i32 (i8*, ...) @"printf"(i8* %".2650", i32 %".2649")
  %"i_rep.85" = load i32, i32* %"i_rep"
  %".2652" = add i32 5, %"i_rep.85"
  %"i_rep.86" = load i32, i32* %"i_rep"
  %".2653" = add i32 8, %"i_rep.86"
  %".2654" = call i32 @"calcularAreaRectangulo"(i32 %".2652", i32 %".2653")
  %".2655" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2656" = call i32 (i8*, ...) @"printf"(i8* %".2655", i32 %".2654")
  %"i_rep.87" = load i32, i32* %"i_rep"
  %".2657" = srem i32 %"i_rep.87", 5
  %".2658" = sub i32 10, %".2657"
  %"i_rep.88" = load i32, i32* %"i_rep"
  %".2659" = srem i32 %"i_rep.88", 5
  %".2660" = sub i32 20, %".2659"
  %".2661" = call i32 @"calcularAreaRectangulo"(i32 %".2658", i32 %".2660")
  %".2662" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2663" = call i32 (i8*, ...) @"printf"(i8* %".2662", i32 %".2661")
  %"i_rep.89" = load i32, i32* %"i_rep"
  %".2664" = add i32 10, %"i_rep.89"
  %".2665" = call i32 @"procesarNumero"(i32 %".2664")
  %".2666" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2667" = call i32 (i8*, ...) @"printf"(i8* %".2666", i32 %".2665")
  %"i_rep.90" = load i32, i32* %"i_rep"
  %".2668" = sub i32 7, %"i_rep.90"
  %".2669" = call i32 @"procesarNumero"(i32 %".2668")
  %".2670" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2671" = call i32 (i8*, ...) @"printf"(i8* %".2670", i32 %".2669")
  %"i_rep.91" = load i32, i32* %"i_rep"
  %".2672" = sub i32 0, %"i_rep.91"
  %".2673" = call i32 @"procesarNumero"(i32 %".2672")
  %".2674" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2675" = call i32 (i8*, ...) @"printf"(i8* %".2674", i32 %".2673")
  %".2676" = sub i32 0, 5
  %"i_rep.92" = load i32, i32* %"i_rep"
  %".2677" = sub i32 %".2676", %"i_rep.92"
  %".2678" = call i32 @"procesarNumero"(i32 %".2677")
  %".2679" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2680" = call i32 (i8*, ...) @"printf"(i8* %".2679", i32 %".2678")
  %".2681" = add i32 1, 2
  %".2682" = mul i32 3, 4
  %".2683" = sitofp i32 5 to double
  %".2684" = sitofp i32 6 to double
  %".2685" = call double @"llvm.pow.f64"(double %".2683", double %".2684")
  %".2686" = sitofp i32 %".2682" to double
  %".2687" = fdiv double %".2686", %".2685"
  %".2688" = sitofp i32 %".2681" to double
  %".2689" = fsub double %".2688", %".2687"
  %".2690" = sitofp i32 7 to double
  %".2691" = fadd double %".2689", %".2690"
  %".2692" = mul i32 8, 9
  %".2693" = sitofp i32 %".2692" to double
  %".2694" = sitofp i32 10 to double
  %".2695" = fdiv double %".2693", %".2694"
  %".2696" = fsub double %".2691", %".2695"
  %"i_rep.93" = load i32, i32* %"i_rep"
  %".2697" = sitofp i32 %"i_rep.93" to double
  %".2698" = fdiv double %".2697", 0x4059000000000000
  %".2699" = fadd double %".2696", %".2698"
  %".2700" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2701" = call i32 (i8*, ...) @"printf"(i8* %".2700", double %".2699")
  %".2702" = mul i32 5, 4
  %".2703" = mul i32 3, 2
  %".2704" = sub i32 %".2702", %".2703"
  %".2705" = sitofp i32 2 to double
  %".2706" = sitofp i32 3 to double
  %".2707" = call double @"llvm.pow.f64"(double %".2705", double %".2706")
  %".2708" = sitofp i32 2 to double
  %".2709" = fmul double %".2707", %".2708"
  %".2710" = sitofp i32 %".2704" to double
  %".2711" = fadd double %".2710", %".2709"
  %".2712" = sitofp i32 2 to double
  %".2713" = fdiv double %".2711", %".2712"
  %"i_rep.94" = load i32, i32* %"i_rep"
  %".2714" = sitofp i32 %"i_rep.94" to double
  %".2715" = fadd double %".2713", %".2714"
  %".2716" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2717" = call i32 (i8*, ...) @"printf"(i8* %".2716", double %".2715")
  %".2718" = mul i32 100, 99
  %".2719" = sitofp i32 %".2718" to double
  %".2720" = sitofp i32 98 to double
  %".2721" = fdiv double %".2719", %".2720"
  %".2722" = sitofp i32 97 to double
  %".2723" = fadd double %".2721", %".2722"
  %".2724" = mul i32 96, 95
  %".2725" = sitofp i32 %".2724" to double
  %".2726" = fsub double %".2723", %".2725"
  %"i_rep.95" = load i32, i32* %"i_rep"
  %".2727" = sitofp i32 %"i_rep.95" to double
  %".2728" = fsub double %".2726", %".2727"
  %".2729" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2730" = call i32 (i8*, ...) @"printf"(i8* %".2729", double %".2728")
  %"i_rep.96" = load i32, i32* %"i_rep"
  %".2731" = srem i32 %"i_rep.96", 3
  %".2732" = add i32 5, %".2731"
  %".2733" = call i32 @"factorial"(i32 %".2732")
  %".2734" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2735" = call i32 (i8*, ...) @"printf"(i8* %".2734", i32 %".2733")
  %"i_rep.97" = load i32, i32* %"i_rep"
  %".2736" = srem i32 %"i_rep.97", 4
  %".2737" = sub i32 7, %".2736"
  %".2738" = call i32 @"factorial"(i32 %".2737")
  %".2739" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2740" = call i32 (i8*, ...) @"printf"(i8* %".2739", i32 %".2738")
  %"anotherX_main.3" = load i32, i32* %"anotherX_main"
  %"i_rep.98" = load i32, i32* %"i_rep"
  %".2741" = add i32 %"anotherX_main.3", %"i_rep.98"
  %".2742" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2743" = call i32 (i8*, ...) @"printf"(i8* %".2742", i32 %".2741")
  %"anotherX_main.4" = load i32, i32* %"anotherX_main"
  %".2744" = mul i32 %"anotherX_main.4", 40
  %".2745" = add i32 2, %".2744"
  %"i_rep.99" = load i32, i32* %"i_rep"
  %".2746" = sub i32 %".2745", %"i_rep.99"
  %".2747" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2748" = call i32 (i8*, ...) @"printf"(i8* %".2747", i32 %".2746")
  %".2749" = add i32 20, 30
  %".2750" = mul i32 %".2749", 4
  %"i_rep.100" = load i32, i32* %"i_rep"
  %".2751" = add i32 %".2750", %"i_rep.100"
  %".2752" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2753" = call i32 (i8*, ...) @"printf"(i8* %".2752", i32 %".2751")
  %".2754" = sitofp i32 1000 to double
  %".2755" = sitofp i32 20 to double
  %".2756" = fdiv double %".2754", %".2755"
  %"i_rep.101" = load i32, i32* %"i_rep"
  %".2757" = sitofp i32 %"i_rep.101" to double
  %".2758" = fsub double %".2756", %".2757"
  %".2759" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2760" = call i32 (i8*, ...) @"printf"(i8* %".2759", double %".2758")
  %".2761" = sitofp i32 20 to double
  %".2762" = sitofp i32 3 to double
  %".2763" = call double @"llvm.pow.f64"(double %".2761", double %".2762")
  %"i_rep.102" = load i32, i32* %"i_rep"
  %".2764" = sitofp i32 %"i_rep.102" to double
  %".2765" = fadd double %".2763", %".2764"
  %".2766" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2767" = call i32 (i8*, ...) @"printf"(i8* %".2766", double %".2765")
  %".2768" = mul i32 30, 20
  %".2769" = add i32 50, %".2768"
  %".2770" = sitofp i32 40 to double
  %".2771" = sitofp i32 2 to double
  %".2772" = fdiv double %".2770", %".2771"
  %".2773" = sitofp i32 %".2769" to double
  %".2774" = fsub double %".2773", %".2772"
  %"i_rep.103" = load i32, i32* %"i_rep"
  %".2775" = sitofp i32 %"i_rep.103" to double
  %".2776" = fsub double %".2774", %".2775"
  %".2777" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2778" = call i32 (i8*, ...) @"printf"(i8* %".2777", double %".2776")
  %".2779" = add i32 30, 40
  %".2780" = sitofp i32 2 to double
  %".2781" = sitofp i32 3 to double
  %".2782" = call double @"llvm.pow.f64"(double %".2780", double %".2781")
  %".2783" = sitofp i32 %".2779" to double
  %".2784" = fmul double %".2783", %".2782"
  %".2785" = sitofp i32 100 to double
  %".2786" = sitofp i32 2 to double
  %".2787" = fdiv double %".2785", %".2786"
  %".2788" = fsub double %".2784", %".2787"
  %"i_rep.104" = load i32, i32* %"i_rep"
  %".2789" = sitofp i32 %"i_rep.104" to double
  %".2790" = fadd double %".2788", %".2789"
  %".2791" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2792" = call i32 (i8*, ...) @"printf"(i8* %".2791", double %".2790")
  %".2793" = sitofp i32 50 to double
  %".2794" = sitofp i32 20 to double
  %".2795" = fdiv double %".2793", %".2794"
  %"i_rep.105" = load i32, i32* %"i_rep"
  %".2796" = sitofp i32 %"i_rep.105" to double
  %".2797" = fdiv double %".2796", 0x4010000000000000
  %".2798" = fadd double %".2795", %".2797"
  %".2799" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2800" = call i32 (i8*, ...) @"printf"(i8* %".2799", double %".2798")
  %".2801" = sub i32 0, 2
  %".2802" = mul i32 40, %".2801"
  %".2803" = add i32 20, %".2802"
  %"i_rep.106" = load i32, i32* %"i_rep"
  %".2804" = sub i32 %".2803", %"i_rep.106"
  %".2805" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2806" = call i32 (i8*, ...) @"printf"(i8* %".2805", i32 %".2804")
  %"i_rep.107" = load i32, i32* %"i_rep"
  %".2807" = srem i32 %"i_rep.107", 5
  %".2808" = sub i32 18, %".2807"
  %".2809" = call i32 @"fibonacci"(i32 %".2808")
  %".2810" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2811" = call i32 (i8*, ...) @"printf"(i8* %".2810", i32 %".2809")
  %"i_rep.108" = load i32, i32* %"i_rep"
  %".2812" = srem i32 %"i_rep.108", 3
  %".2813" = sub i32 5, %".2812"
  %".2814" = call i32 @"potencia"(i32 2, i32 %".2813")
  %".2815" = call i32 @"doble"(i32 %".2814")
  %"i_rep.109" = load i32, i32* %"i_rep"
  %".2816" = mul i32 %"i_rep.109", 2
  %".2817" = sub i32 100, %".2816"
  %".2818" = call i32 @"funcionA"(i32 %".2817")
  %".2819" = call i32 @"sumar"(i32 %".2815", i32 %".2818")
  %".2820" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2821" = call i32 (i8*, ...) @"printf"(i8* %".2820", i32 %".2819")
  %"i_rep.110" = load i32, i32* %"i_rep"
  %".2822" = srem i32 %"i_rep.110", 2
  %".2823" = add i32 4, %".2822"
  %".2824" = call i32 @"sumaHasta"(i32 %".2823")
  %".2825" = call i32 @"funcionB"(i32 %".2824")
  %".2826" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2827" = call i32 (i8*, ...) @"printf"(i8* %".2826", i32 %".2825")
  br label %"for.inc.17"
for.inc.17:
  %"i_rep.111" = load i32, i32* %"i_rep"
  %"i_rep.112" = load i32, i32* %"i_rep"
  %".2829" = add i32 %"i_rep.112", 1
  store i32 %".2829", i32* %"i_rep"
  br label %"for.cond.17"
for.exit.17:
  %"outer_idx" = alloca i32
  store i32 0, i32* %"outer_idx"
  store i32 0, i32* %"outer_idx"
  br label %"for.cond.18"
for.cond.18:
  %"outer_idx.1" = load i32, i32* %"outer_idx"
  %".2835" = icmp slt i32 %"outer_idx.1", 60
  br i1 %".2835", label %"for.body.18", label %"for.exit.18"
for.body.18:
  %"inner_idx" = alloca i32
  store i32 0, i32* %"inner_idx"
  %"acc_float" = alloca double
  store double              0x0, double* %"acc_float"
  %"acc_int" = alloca i32
  store i32 0, i32* %"acc_int"
  store i32 0, i32* %"inner_idx"
  br label %"for.cond.19"
for.inc.18:
  %"outer_idx.6" = load i32, i32* %"outer_idx"
  %"outer_idx.7" = load i32, i32* %"outer_idx"
  %".2888" = add i32 %"outer_idx.7", 1
  store i32 %".2888", i32* %"outer_idx"
  br label %"for.cond.18"
for.exit.18:
  ret i32 0
for.cond.19:
  %"inner_idx.1" = load i32, i32* %"inner_idx"
  %".2842" = icmp slt i32 %"inner_idx.1", 10
  br i1 %".2842", label %"for.body.19", label %"for.exit.19"
for.body.19:
  %"acc_int.1" = load i32, i32* %"acc_int"
  %"outer_idx.2" = load i32, i32* %"outer_idx"
  %"inner_idx.2" = load i32, i32* %"inner_idx"
  %".2844" = mul i32 %"outer_idx.2", %"inner_idx.2"
  %".2845" = add i32 %"acc_int.1", %".2844"
  %"inner_idx.3" = load i32, i32* %"inner_idx"
  %".2846" = call i32 @"potencia"(i32 %"inner_idx.3", i32 2)
  %".2847" = add i32 %".2845", %".2846"
  store i32 %".2847", i32* %"acc_int"
  %"acc_float.1" = load double, double* %"acc_float"
  %"outer_idx.3" = load i32, i32* %"outer_idx"
  %".2849" = add i32 %"outer_idx.3", 1
  %".2850" = call double @"toFloat"(i32 %".2849")
  %"inner_idx.4" = load i32, i32* %"inner_idx"
  %".2851" = add i32 %"inner_idx.4", 1
  %".2852" = call double @"toFloat"(i32 %".2851")
  %".2853" = call double @"dividir"(double %".2850", double %".2852")
  %".2854" = fadd double %"acc_float.1", %".2853"
  %"inner_idx.5" = load i32, i32* %"inner_idx"
  %".2855" = call double @"toFloat"(i32 %"inner_idx.5")
  %".2856" = fadd double %".2854", %".2855"
  store double %".2856", double* %"acc_float"
  %"acc_int.2" = load i32, i32* %"acc_int"
  %".2858" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2859" = call i32 (i8*, ...) @"printf"(i8* %".2858", i32 %"acc_int.2")
  %"acc_float.2" = load double, double* %"acc_float"
  %".2860" = bitcast [4 x i8]* @"fmt_float" to i8*
  %".2861" = call i32 (i8*, ...) @"printf"(i8* %".2860", double %"acc_float.2")
  %"acc_int.3" = load i32, i32* %"acc_int"
  %".2862" = call i1 @"esPar"(i32 %"acc_int.3")
  br i1 %".2862", label %"then.22", label %"else.22"
for.inc.19:
  %"inner_idx.7" = load i32, i32* %"inner_idx"
  %"inner_idx.8" = load i32, i32* %"inner_idx"
  %".2879" = add i32 %"inner_idx.8", 1
  store i32 %".2879", i32* %"inner_idx"
  br label %"for.cond.19"
for.exit.19:
  %"outer_idx.5" = load i32, i32* %"outer_idx"
  %".2882" = srem i32 %"outer_idx.5", 10
  %".2883" = add i32 %".2882", 5
  %".2884" = call i32 @"sumaHasta"(i32 %".2883")
  %".2885" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2886" = call i32 (i8*, ...) @"printf"(i8* %".2885", i32 %".2884")
  br label %"for.inc.18"
then.22:
  %"acc_int.4" = load i32, i32* %"acc_int"
  %".2864" = call i32 @"doble"(i32 %"acc_int.4")
  %".2865" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2866" = call i32 (i8*, ...) @"printf"(i8* %".2865", i32 %".2864")
  br label %"ifcont.22"
else.22:
  br label %"ifcont.22"
ifcont.22:
  %"acc_int.5" = load i32, i32* %"acc_int"
  %".2869" = srem i32 %"acc_int.5", 100
  %"outer_idx.4" = load i32, i32* %"outer_idx"
  %".2870" = add i32 %"outer_idx.4", 1
  %".2871" = call i32 @"multiplicar"(i32 %".2869", i32 %".2870")
  %".2872" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2873" = call i32 (i8*, ...) @"printf"(i8* %".2872", i32 %".2871")
  %"inner_idx.6" = load i32, i32* %"inner_idx"
  %".2874" = srem i32 %"inner_idx.6", 7
  %".2875" = call i32 @"factorial"(i32 %".2874")
  %".2876" = bitcast [4 x i8]* @"fmt_int" to i8*
  %".2877" = call i32 (i8*, ...) @"printf"(i8* %".2876", i32 %".2875")
  br label %"for.inc.19"
}

declare double @"llvm.pow.f64"(double %".1", double %".2")

@"fmt_float" = internal constant [4 x i8] c"%f\0a\00"
@"fmt_int" = internal constant [4 x i8] c"%d\0a\00"
@"fmt_boolean" = internal constant [4 x i8] c"%d\0a\00"