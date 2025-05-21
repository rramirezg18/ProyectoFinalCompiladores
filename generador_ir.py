from llvmlite import ir
from constructor_ast import Program, Main, Function, Declaration, Print, If, While, For, Return, FuncCall, Block, BinaryOp, UnaryOp, Literal, Variable

class IRgenerador:
    def __init__(self, ast, tabla_simbolos):
        self.ast = ast
        self.tabla_simbolos = tabla_simbolos
        self.module = ir.Module(name="main")
        self.module.triple = "x86_64-pc-linux-gnu"
        self.builder = None
        self.funciones = {}
        self.locals = {}
        self.type_map = {
            'int': ir.IntType(32),
            'float': ir.DoubleType(),
            'boolean': ir.IntType(1),
            'string': ir.IntType(8).as_pointer(),
        }
        self.declarar_funciones()

    def declarar_funciones(self):
        voidptr_ty = ir.IntType(8).as_pointer()
        printf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
        ir.Function(self.module, printf_ty, name="printf")

        strcpy_ty = ir.FunctionType(ir.IntType(8).as_pointer(), 
                              [ir.IntType(8).as_pointer(), 
                               ir.IntType(8).as_pointer()])
        ir.Function(self.module, strcpy_ty, name="strcpy")
        
        strcat_ty = ir.FunctionType(ir.IntType(8).as_pointer(), 
                                [ir.IntType(8).as_pointer(), 
                                ir.IntType(8).as_pointer()])
        ir.Function(self.module, strcat_ty, name="strcat")

        sprintf_ty = ir.FunctionType(
            ir.IntType(32),  # Tipo de retorno (int)
            [ir.IntType(8).as_pointer(),  # buffer
            ir.IntType(8).as_pointer()], # formato
            var_arg=True
        )
        ir.Function(self.module, sprintf_ty, name="sprintf")

    def generar(self):
        for func in self.ast.functions:
            self.registrar_prototipo_funcion(func)
        self.main(self.ast.main)
        for func in self.ast.functions:
            self.funcion(func)
        return self.module

    def registrar_prototipo_funcion(self, func: Function):
        ret_type = self.type_map[func.ret_type]
        param_types = [self.type_map[t] for t, _ in func.params]
        func_type = ir.FunctionType(ret_type, param_types)
        function = ir.Function(self.module, func_type, name=func.name)
        self.funciones[func.name] = function

    def main(self, main: Main):
        main_type = ir.FunctionType(ir.IntType(32), [])
        main_func = ir.Function(self.module, main_type, name="main")
        self.funciones['main'] = main_func
        block = main_func.append_basic_block(name="entry")
        self.builder = ir.IRBuilder(block)
        self.locals = {}
        for instr in main.instructions:
            self.instruccion(instr)
        if not self.builder.block.is_terminated:
            self.builder.ret(ir.Constant(ir.IntType(32), 0))

    def instruccion(self, instr):
        if isinstance(instr, Declaration):
            return self.declaracion(instr)
        elif isinstance(instr, Print):
            return self.print(instr)
        elif isinstance(instr, If):
            return self.sentencia_if(instr)
        elif isinstance(instr, While):
            return self.sentecia_while(instr)
        elif isinstance(instr, For):
            return self.sentecia_for(instr)
        elif isinstance(instr, Return):
            return self.sentencia_return(instr)
        elif isinstance(instr, FuncCall):
            return self.llamar_funcion(instr)
        elif isinstance(instr, Block):
            return self.bloque(instr)
        elif isinstance(instr, (BinaryOp, UnaryOp, Literal, Variable)):
            return self.expr(instr)
        else:
            raise Exception("Instrucción no soportada en IRGenerator")

    def bloque(self, block: Block):
        for instr in block.instructions:
            self.instruccion(instr)

    def declaracion(self, decl: Declaration):
        var_name = decl.var_name
        if decl.var_type:
            var_type = decl.var_type
            llvm_type = self.type_map[var_type]
            alloc = self.builder.alloca(llvm_type, name=var_name)
            self.locals[var_name] = (alloc, var_type)
        else:
            if var_name in self.locals:
                alloc, var_type = self.locals[var_name]
            else:
                var_type = self.tabla_simbolos.consultar_variable(var_name)
                llvm_type = self.type_map[var_type]
                alloc = self.builder.alloca(llvm_type, name=var_name)
                self.locals[var_name] = (alloc, var_type)
        val, val_type = self.expr(decl.expr)
        if var_type == 'float' and val_type == 'int':
            val = self.builder.sitofp(val, ir.DoubleType())
        self.builder.store(val, alloc)

    def print(self, print_node: Print):
        # Genera el valor y su tipo
        value, value_type = self.expr(print_node.expr)

        # Elige el formato según el tipo
        if value_type == 'int':
            fmt = "%d\n\0"
        elif value_type == 'float':
            fmt = "%f\n\0"
        elif value_type == 'string':
            fmt = "%s\n\0"
        elif value_type == 'boolean':
            # --- aquí extendemos el i1 a i32 para printf ---
            value = self.builder.zext(value, ir.IntType(32))
            fmt = "%d\n\0"
        else:
            raise Exception(f"Tipo no soportado en print: {value_type}")

        # Crea o reutiliza la cadena de formato global
        fmt_name = "fmt_" + value_type
        if fmt_name in self.module.globals:
            fmt_global = self.module.globals[fmt_name]
        else:
            fmt_global = ir.GlobalVariable(
                self.module,
                ir.ArrayType(ir.IntType(8), len(fmt)),
                name=fmt_name
            )
            fmt_global.linkage = "internal"
            fmt_global.global_constant = True
            fmt_global.initializer = ir.Constant(
                ir.ArrayType(ir.IntType(8), len(fmt)),
                bytearray(fmt.encode("utf8"))
            )

        # Obtiene un i8* al literal de formato
        fmt_ptr = self.builder.bitcast(fmt_global, ir.IntType(8).as_pointer())

        # Llama a printf(fmt_ptr, value)
        self.builder.call(self.module.globals["printf"], [fmt_ptr, value])


    def sentencia_if(self, if_node: If):
        # Procesar condición principal
        cond_val, cond_type = self.expr(if_node.cond)
        if cond_type == 'int':
            cond_val = self.builder.icmp_signed('!=', cond_val, ir.Constant(ir.IntType(32), 0))
        
        func = self.builder.function
        then_bb = func.append_basic_block(name="then")
        current_else_bb = func.append_basic_block(name="else")
        merge_bb = func.append_basic_block(name="ifcont")
        
        # Manejar elifs
        elif_blocks = []
        for elif_cond, elif_block in if_node.elif_blocks:
            elif_bb = func.append_basic_block(name="elif")
            elif_blocks.append((elif_cond, elif_block, elif_bb))
        
        # Branch inicial
        self.builder.cbranch(cond_val, then_bb, elif_blocks[0][2] if elif_blocks else current_else_bb)

        # Bloque THEN
        self.builder.position_at_start(then_bb)
        self.bloque(if_node.then_block)
        if not self.builder.block.is_terminated:
            self.builder.branch(merge_bb)
        
        # Procesar ELIFs
        for i, (elif_cond, elif_block, elif_bb) in enumerate(elif_blocks):
            next_bb = elif_blocks[i+1][2] if i+1 < len(elif_blocks) else current_else_bb
            
            self.builder.position_at_start(elif_bb)
            elif_cond_val, _ = self.expr(elif_cond)
            elif_then_bb = func.append_basic_block(name=f"elif_then_{i}")
            self.builder.cbranch(elif_cond_val, elif_then_bb, next_bb)
            
            self.builder.position_at_start(elif_then_bb)
            self.bloque(elif_block)
            if not self.builder.block.is_terminated:
                self.builder.branch(merge_bb)
            
            elif_bb = next_bb

        # Bloque ELSE final
        self.builder.position_at_start(current_else_bb)
        if if_node.else_block:
            self.bloque(if_node.else_block)
        if not self.builder.block.is_terminated:
            self.builder.branch(merge_bb)
        
        self.builder.position_at_start(merge_bb)

    def sentecia_while(self, while_node: While):
        func = self.builder.function
        cond_bb = func.append_basic_block(name="while.cond")
        body_bb = func.append_basic_block(name="while.body")
        end_bb = func.append_basic_block(name="while.end")
        self.builder.branch(cond_bb)
        self.builder.position_at_start(cond_bb)
        cond_val, _ = self.expr(while_node.cond)
        self.builder.cbranch(cond_val, body_bb, end_bb)
        self.builder.position_at_start(body_bb)
        self.bloque(while_node.body)
        self.builder.branch(cond_bb)
        self.builder.position_at_start(end_bb)

    def sentecia_for(self, for_node: For):
        func = self.builder.function
        self.instruccion(for_node.init)
        cond_bb = func.append_basic_block(name="for.cond")
        body_bb = func.append_basic_block(name="for.body")
        inc_bb = func.append_basic_block(name="for.inc")
        exit_bb = func.append_basic_block(name="for.exit")
        self.builder.branch(cond_bb)
        self.builder.position_at_start(cond_bb)
        cond_val, _ = self.expr(for_node.cond)
        self.builder.cbranch(cond_val, body_bb, exit_bb)
        self.builder.position_at_start(body_bb)
        self.bloque(for_node.body)
        self.builder.branch(inc_bb)
        self.builder.position_at_start(inc_bb)
        self.expr(for_node.inc)
        self.builder.branch(cond_bb)
        self.builder.position_at_start(exit_bb)

    def sentencia_return(self, ret_node: Return):
        ret_val, ret_type = self.expr(ret_node.expr)
        current_func = self.builder.function
        func_ret_type = current_func.function_type.return_type
        if isinstance(func_ret_type, ir.IntType) and func_ret_type.width == 32 and ret_type == 'float':
            ret_val = self.builder.fptosi(ret_val, ir.IntType(32))
            ret_type = 'int'
        self.builder.ret(ret_val)

    def llamar_funcion(self, func_call: FuncCall):
        func = self.funciones.get(func_call.name)
        if not func:
            raise Exception(f"Función {func_call.name} no definida")
        args_expr = [self.expr(arg) for arg in func_call.args]
        converted_args = []
        for i, (arg_val, arg_type) in enumerate(args_expr):
            expected_type = func.args[i].type
            if isinstance(expected_type, ir.DoubleType) and arg_type == 'int':
                arg_val = self.builder.sitofp(arg_val, ir.DoubleType())
            elif isinstance(expected_type, ir.IntType) and arg_type == 'float':
                arg_val = self.builder.fptosi(arg_val, expected_type)
            converted_args.append(arg_val)
        call = self.builder.call(func, converted_args)
        func_info = self.tabla_simbolos.consultar_funcion(func_call.name)
        return (call, func_info['tipo_retorno'])

    def expr(self, expr):
        # 1) Literales AST
        if isinstance(expr, Literal):
            if expr.lit_type == 'int':
                return (ir.Constant(ir.IntType(32), expr.value), 'int')
            elif expr.lit_type == 'float':
                return (ir.Constant(ir.DoubleType(), expr.value), 'float')
            elif expr.lit_type == 'boolean':
                return (ir.Constant(ir.IntType(1), 1 if expr.value else 0), 'boolean')
            elif expr.lit_type == 'string':
                str_val = expr.value
                str_global = ir.GlobalVariable(
                    self.module,
                    ir.ArrayType(ir.IntType(8), len(str_val) + 1),
                    name=f"str.{hash(str_val)}"
                )
                str_global.linkage = 'internal'
                str_global.global_constant = True
                str_global.initializer = ir.Constant(
                    ir.ArrayType(ir.IntType(8), len(str_val) + 1),
                    bytearray(str_val.encode('utf-8') + b'\0')
                )
                ptr = self.builder.bitcast(str_global, ir.IntType(8).as_pointer())
                return (ptr, 'string')

        # 2) Atajo para true/false en AST Variable
        elif isinstance(expr, Variable) and expr.name in ("true", "false"):
            val = 1 if expr.name == "true" else 0
            return (ir.Constant(ir.IntType(1), val), 'boolean')

        # 3) Variables normales
        elif isinstance(expr, Variable):
            if expr.name in self.locals:
                alloc, var_type = self.locals[expr.name]
                loaded = self.builder.load(alloc, name=expr.name)
                return (loaded, var_type)
            else:
                var_type = self.tabla_simbolos.consultar_variable(expr.name)
                llvm_type = self.type_map[var_type]
                alloc = self.builder.alloca(llvm_type, name=expr.name)
                self.locals[expr.name] = (alloc, var_type)
                loaded = self.builder.load(alloc, name=expr.name)
                return (loaded, var_type)

        # Resto: BinaryOp, UnaryOp, FuncCall...

        elif isinstance(expr, BinaryOp):
            left_val, left_type = self.expr(expr.left)
            right_val, right_type = self.expr(expr.right)
            op = expr.op

            # ==============================================
            # Manejo de concatenación con conversión automática
            # ==============================================
            if op == '+':
                # Si al menos un operando es string
                if left_type == 'string' or right_type == 'string':
                    # Función para convertir tipos no-string a string
                    def convert_to_str(val, val_type):
                        if val_type == 'string':
                            return val
                        
                        # Crear buffer temporal (32 bytes para números/booleanos)
                        buffer = self.builder.alloca(ir.ArrayType(ir.IntType(8), 32), name="strconv_buf")
                        buffer_ptr = self.builder.bitcast(buffer, ir.IntType(8).as_pointer())
                        
                        # Seleccionar formato según tipo
                        if val_type == 'int':
                            fmt = self.get_or_create_global_string("%d\0")
                            val = self.builder.sext(val, ir.IntType(32)) if val.type.width < 32 else val
                        elif val_type == 'float':
                            fmt = self.get_or_create_global_string("%f\0")
                        elif val_type == 'boolean':
                            fmt = self.get_or_create_global_string("%s\0")
                            val = self.builder.select(val, 
                                self.get_or_create_global_string("true"),
                                self.get_or_create_global_string("false")
                            )
                        
                        # Llamar a sprintf
                        fmt_ptr = self.builder.bitcast(fmt, ir.IntType(8).as_pointer())
                        self.builder.call(self.module.globals["sprintf"], [buffer_ptr, fmt_ptr, val])
                        return buffer_ptr

                    # Convertir operandos si es necesario
                    if left_type != 'string':
                        left_val = convert_to_str(left_val, left_type)
                    if right_type != 'string':
                        right_val = convert_to_str(right_val, right_type)

                    # Concatenar strings
                    strcpy = self.module.globals["strcpy"]
                    strcat = self.module.globals["strcat"]
                    buffer = self.builder.alloca(ir.ArrayType(ir.IntType(8), 256), name="concat_buf")
                    dest = self.builder.bitcast(buffer, ir.IntType(8).as_pointer())
                    self.builder.call(strcpy, [dest, left_val])
                    self.builder.call(strcat, [dest, right_val])
                    return (dest, 'string')

            # ==============================================
            # Resto de operaciones numéricas (código existente)
            # ==============================================
            if left_type == 'int' and right_type == 'float':
                left_val = self.builder.sitofp(left_val, ir.DoubleType())
                left_type = 'float'
            elif left_type == 'float' and right_type == 'int':
                right_val = self.builder.sitofp(right_val, ir.DoubleType())
                right_type = 'float'

            if op in ['+', '-', '*', '/', '%']:
                if op == '/':
                    if left_type == 'int':
                        left_val = self.builder.sitofp(left_val, ir.DoubleType())
                    if right_type == 'int':
                        right_val = self.builder.sitofp(right_val, ir.DoubleType())
                    result = self.builder.fdiv(left_val, right_val)
                    return (result, 'float')
                else:
                    if left_type == 'int' and right_type == 'int':
                        if op == '+':
                            result = self.builder.add(left_val, right_val)
                        elif op == '-':
                            result = self.builder.sub(left_val, right_val)
                        elif op == '*':
                            result = self.builder.mul(left_val, right_val)
                        elif op == '%':
                            result = self.builder.srem(left_val, right_val)
                        return (result, 'int')
                    else:
                        if op == '+':
                            result = self.builder.fadd(left_val, right_val)
                        elif op == '-':
                            result = self.builder.fsub(left_val, right_val)
                        elif op == '*':
                            result = self.builder.fmul(left_val, right_val)
                        return (result, 'float')
            elif op == '^':
                if left_type == 'int':
                    left_val = self.builder.sitofp(left_val, ir.DoubleType())
                if right_type == 'int':
                    right_val = self.builder.sitofp(right_val, ir.DoubleType())
                pow_func = self.module.globals.get("llvm.pow.f64")
                if not pow_func:
                    pow_func_ty = ir.FunctionType(ir.DoubleType(), [ir.DoubleType(), ir.DoubleType()])
                    pow_func = ir.Function(self.module, pow_func_ty, name="llvm.pow.f64")
                result = self.builder.call(pow_func, [left_val, right_val])
                return (result, 'float')
            elif op in ['<', '>', '<=', '>=', '==', '!=']:
                if left_type == 'int':
                    cmp = self.builder.icmp_signed(op, left_val, right_val)
                else:
                    cmp = self.builder.fcmp_ordered(op, left_val, right_val)
                return (cmp, 'boolean')
        elif isinstance(expr, UnaryOp):
            operand_val, operand_type = self.expr(expr.operand)
            op = expr.op
            if op == '-' and operand_type == 'int':
                return (self.builder.neg(operand_val), 'int')
            elif op == '-' and operand_type == 'float':
                zero = ir.Constant(ir.DoubleType(), 0.0)
                return (self.builder.fsub(zero, operand_val), 'float')
            elif op in ['++', '--']:
                if isinstance(expr.operand, Variable):
                    var_name = expr.operand.name
                    if var_name in self.locals:
                        alloc, var_type = self.locals[var_name]
                        current_val = self.builder.load(alloc, name=var_name)
                        if op == '++':
                            if var_type == 'int':
                                one = ir.Constant(ir.IntType(32), 1)
                                new_val = self.builder.add(current_val, one)
                            elif var_type == 'float':
                                one = ir.Constant(ir.DoubleType(), 1.0)
                                new_val = self.builder.fadd(current_val, one)
                        elif op == '--':
                            if var_type == 'int':
                                one = ir.Constant(ir.IntType(32), 1)
                                new_val = self.builder.sub(current_val, one)
                            elif var_type == 'float':
                                one = ir.Constant(ir.DoubleType(), 1.0)
                                new_val = self.builder.fsub(current_val, one)
                        self.builder.store(new_val, alloc)
                        return (new_val, var_type)
                    else:
                        raise Exception(f"Variable {var_name} no declarada para {op}")
            else:
                raise Exception(f"Operador unario {op} no soportado")
        elif isinstance(expr, FuncCall):
            return self.llamar_funcion(expr)
        else:
            raise Exception("Expresión no soportada en IRGenerator")
    
    def funcion(self, func: Function):
        function = self.funciones.get(func.name)
        if not function:
            raise Exception(f"Función '{func.name}' no definida")
        entry_block = function.append_basic_block(name="entry")
        self.builder = ir.IRBuilder(entry_block)
        self.locals = {}
        
        
        # Registrar parámetros
        for i, (param_type, param_name) in enumerate(func.params):
            alloc = self.builder.alloca(self.type_map[param_type], name=param_name)
            self.builder.store(function.args[i], alloc)
            self.locals[param_name] = (alloc, param_type)
        
        # Procesar instrucciones (EXCLUYENDO el return_expr)
        for instr in func.instructions:
            self.instruccion(instr)
        
        # Manejar retorno por defecto
        if not self.builder.block.is_terminated:
            if func.ret_type == 'void':
                self.builder.ret_void()
            else:
                # NUEVO: Validar tipo de retorno
                if func.ret_type == 'string':
                    null_str = ir.Constant(ir.IntType(8).as_pointer(), None)
                    self.builder.ret(null_str)
                else:
                    # Generar constante cero del tipo correcto
                    zero = ir.Constant(self.type_map[func.ret_type], 0)
                    self.builder.ret(zero)


    def get_or_create_global_string(self, s: str):
        name = f"fmt_{hash(s)}"
        if name in self.module.globals:
            return self.module.globals[name]
        
        fmt_type = ir.ArrayType(ir.IntType(8), len(s))
        fmt_global = ir.GlobalVariable(self.module, fmt_type, name=name)
        fmt_global.linkage = "internal"
        fmt_global.global_constant = True
        fmt_global.initializer = ir.Constant(fmt_type, bytearray(s.encode("utf8")))
        return fmt_global