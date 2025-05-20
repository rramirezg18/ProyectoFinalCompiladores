from antlr4 import *
from GramaticaVisitor import GramaticaVisitor
from GramaticaParser import GramaticaParser


class ReturnException(Exception):
    def __init__(self, value):
        self.value = value


class AnalizadorVisitor(GramaticaVisitor):
    def __init__(self):
        super().__init__()
        self.variables = [{'true': True, 'false': False}]
        self.funciones = {}

    # Manejo de ámbitos
    def push_scope(self):
        self.variables.append({})

    def pop_scope(self):
        self.variables.pop()

    def current_scope(self):
        return self.variables[-1]

    def set_variable(self, var_name, value):
        for scope in reversed(self.variables):
            if var_name in scope:
                scope[var_name] = value
                return
        self.current_scope()[var_name] = value

    # Visitar la raíz del árbol
    def visitGramatica(self, ctx:GramaticaParser.GramaticaContext):
        # Primero se procesan todas las funciones
        for func in ctx.funcion():
            self.visit(func)
        # Buscar y ejecutar main
        main_block = ctx.main()
        if main_block:
            return self.visit(main_block)
        return None

    # main { ... }
    def visitMain(self, ctx:GramaticaParser.MainContext):
        self.push_scope()
        for instr in ctx.instruccion():
            self.visit(instr)
        self.pop_scope()
        return None

    def visitInstruccion(self, ctx:GramaticaParser.InstruccionContext):
        return self.visitChildren(ctx)

    # Declaración y asignación: (tipo)? VARIABLE = expr ;
    def visitDeclaracion_y_asignacion(self, ctx:GramaticaParser.Declaracion_y_asignacionContext):
        var_name = ctx.VARIABLE().getText()
        value = self.visit(ctx.expr())
        self.set_variable(var_name, value)
        return None

    def visitTipo(self, ctx:GramaticaParser.TipoContext):
        return ctx.getText()

    # print(expr);
    def visitSentencia_print(self, ctx:GramaticaParser.Sentencia_printContext):
        value = self.visit(ctx.expr())
        print(value)
        return None

    # if (expr) bloque (else if (expr) bloque)* (else bloque)?
    def visitSentencia_if(self, ctx:GramaticaParser.Sentencia_ifContext):
        cond = self.visit(ctx.expr(0))  # Se toma la primera condición
        if self._is_true(cond):
            return self.visit(ctx.bloque(0))
        # Procesa else if
        expr_count = len(ctx.expr())
        block_count = len(ctx.bloque())
        for i in range(1, expr_count):
            if self._is_true(self.visit(ctx.expr(i))):
                return self.visit(ctx.bloque(i))
        # Procesa else (si existe)
        if block_count > expr_count:
            return self.visit(ctx.bloque(block_count - 1))
        return None



    # while (expr) bloque
    def visitSentencia_while(self, ctx:GramaticaParser.Sentencia_whileContext):
        while self._is_true(self.visit(ctx.expr())):
            self.visit(ctx.bloque())
        return None

    # for (declaracion_asignacion, expr, for_incremento) bloque
    def visitSentencia_for(self, ctx:GramaticaParser.Sentencia_forContext):
        self.push_scope()
        if ctx.declaracion_y_asignacion():
            self.visit(ctx.declaracion_y_asignacion())
        # En este caso, solo hay una expresión: la condición
        cond_expr = ctx.expr()
        while self._is_true(self.visit(cond_expr)):
            self.visit(ctx.bloque())
            if ctx.for_incremento_y_disminucion():
                self.visit(ctx.for_incremento_y_disminucion())
        self.pop_scope()
        return None


    def visitFor_incremento_y_disminucion(self, ctx:GramaticaParser.For_incremento_y_disminucionContext):
        if ctx.declaracion_y_asignacion():
            return self.visit(ctx.declaracion_y_asignacion())
        else:
            var_name = ctx.VARIABLE().getText()
            current = None
            for scope in reversed(self.variables):
                if var_name in scope:
                    current = scope[var_name]
                    break
            if current is None:
                current = 0
            if ctx.MASMAS():
                new_value = current + 1
            elif ctx.MENOSMENOS():
                new_value = current - 1
            else:
                new_value = current
            self.set_variable(var_name, new_value)
            return None

    # return expr;
    def visitSentencia_return(self, ctx:GramaticaParser.Sentencia_returnContext):
        value = self.visit(ctx.expr())
        raise ReturnException(value)

    # Función: tipo VARIABLE (parametros)? { instrucciones (return expr)? }
    def visitFuncion(self, ctx:GramaticaParser.FuncionContext):
        func_name = ctx.VARIABLE().getText()
        params = self.visit(ctx.parametros()) if ctx.parametros() else []
        self.funciones[func_name] = {
            'params': params,
            'body': ctx,
            'return_type': self.visit(ctx.tipo()) if ctx.tipo() else None
        }
        return None

    def visitParametros(self, ctx:GramaticaParser.ParametrosContext):
        return [(t.getText(), var.getText()) for t, var in zip(ctx.tipo(), ctx.VARIABLE())]

    def visitArgumentos(self, ctx:GramaticaParser.ArgumentosContext):
        return [self.visit(expr) for expr in ctx.expr()]

    def visitLlamada_funcion(self, ctx:GramaticaParser.Llamada_funcionContext):
        func_name = ctx.VARIABLE().getText()
        if func_name not in self.funciones:
            raise Exception(f"Función no definida: {func_name}")
        func = self.funciones[func_name]
        args = self.visit(ctx.argumentos()) if ctx.argumentos() else []
        if len(args) != len(func['params']):
            raise Exception(f"Número incorrecto de argumentos para {func_name}")
        # nuevo scope para los parámetros
        self.push_scope()
        for (param_type, param_name), arg_val in zip(func['params'], args):
            self.current_scope()[param_name] = arg_val

        # Ejecutamos el cuerpo y capturamos el return
        result = None
        try:
            for instr in func['body'].instruccion():
                self.visit(instr)
        except ReturnException as re:
            result = re.value
        finally:
            self.pop_scope()
        return result

    def visitBloque(self, ctx:GramaticaParser.BloqueContext):
        self.push_scope()
        result = None
        try:
            for instr in ctx.instruccion():
                self.visit(instr)
        except ReturnException as re:
            # Propaga la excepción para que llegue hasta la llamada de función
            self.pop_scope()
            raise
        self.pop_scope()
        return result

    # MÉTODOS PARA LAS NUEVAS REGLAS DE EXPRESIONES CON PRECEDENCIA

    # expr : relExpr
    def visitExpr(self, ctx:GramaticaParser.ExprContext):
        return self.visit(ctx.relExpr())

    # relExpr : addExpr ((< | > | <= | >= | == | !=) addExpr)* ;
    def visitRelExpr(self, ctx:GramaticaParser.RelExprContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.addExpr(0))
        left = self.visit(ctx.addExpr(0))
        for i in range(1, len(ctx.addExpr())):
            op = ctx.getChild(2*i - 1).getText()
            right = self.visit(ctx.addExpr(i))
            left = self._apply_relational_op(left, op, right)
        return left

    # addExpr : mulExpr ((+ | -) mulExpr)* ;
    def visitAddExpr(self, ctx:GramaticaParser.AddExprContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.mulExpr(0))
        left = self.visit(ctx.mulExpr(0))
        for i in range(1, len(ctx.mulExpr())):
            op = ctx.getChild(2*i - 1).getText()
            right = self.visit(ctx.mulExpr(i))
            if op == '+':
                left = left + right
            elif op == '-':
                left = left - right
        return left

    # mulExpr : powExpr ((* | / | %) powExpr)* ;
    def visitMulExpr(self, ctx:GramaticaParser.MulExprContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.powExpr(0))
        left = self.visit(ctx.powExpr(0))
        for i in range(1, len(ctx.powExpr())):
            op = ctx.getChild(2*i - 1).getText()
            right = self.visit(ctx.powExpr(i))
            if op == '*':
                left = left * right
            elif op == '/':
                left = left / right
            elif op == '%':
                left = left % right
        return left

    # powExpr : unaryExpr (^ powExpr)? ;
    def visitPowExpr(self, ctx:GramaticaParser.PowExprContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.unaryExpr())
        left = self.visit(ctx.unaryExpr())
        op = ctx.POTENCIA().getText()
        right = self.visit(ctx.powExpr())
        return left ** right  # Uso de la potencia en Python

    # unaryExpr : (-) unaryExpr | atom ;
    def visitUnaryExpr(self, ctx:GramaticaParser.UnaryExprContext):
        if ctx.getChildCount() == 2:
            op = ctx.MENOS().getText()
            operand = self.visit(ctx.unaryExpr())
            return -operand
        else:
            return self.visit(ctx.atom())

    # atom : '(' expr ')' | llamada_funcion | VARIABLE | NUMERO | CADENA | BOOLEANO ;
    def visitAtom(self, ctx:GramaticaParser.AtomContext):
        if ctx.PARENTESIS_APERTURA():
            return self.visit(ctx.expr())
        elif ctx.llamada_funcion():
            return self.visit(ctx.llamada_funcion())
        elif ctx.VARIABLE():
            var_name = ctx.VARIABLE().getText()
            # Buscar la variable en el scope actual
            for scope in reversed(self.variables):
                if var_name in scope:
                    return scope[var_name]
            raise Exception(f"Variable no definida: {var_name}")
        elif ctx.NUMERO():
            num_str = ctx.NUMERO().getText()
            if '.' in num_str:
                return float(num_str)
            else:
                return int(num_str)
        elif ctx.CADENA():
            text = ctx.CADENA().getText()
            return text[1:-1]  # Eliminar comillas
        elif ctx.BOOLEANO():
            return True if ctx.BOOLEANO().getText() == 'true' else False
        else:
            raise Exception("Expresión no reconocida")

    # Funciones auxiliares para operaciones relacionales y condiciones
    def _apply_relational_op(self, left, op, right):
        if op == '==':
            return left == right
        elif op == '!=':
            return left != right
        elif op == '<':
            return left < right
        elif op == '>':
            return left > right
        elif op == '<=':
            return left <= right
        elif op == '>=':
            return left >= right
        else:
            raise Exception(f"Operador relacional no soportado: {op}")

    def _is_true(self, value):
        if isinstance(value, bool):
            return value
        if isinstance(value, (int, float)):
            return value != 0
        if isinstance(value, str):
            return len(value) > 0
        return bool(value)
