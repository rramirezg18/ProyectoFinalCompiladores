from GramaticaVisitor import GramaticaVisitor
from GramaticaParser import GramaticaParser

class ASTNode:
    pass

class Program(ASTNode):
    def __init__(self, main, functions):
        self.main = main
        self.functions = functions

class Main(ASTNode):
    def __init__(self, instructions):
        self.instructions = instructions

class Function(ASTNode):
    def __init__(self, ret_type, name, params, instructions, return_expr=None):
        self.ret_type = ret_type
        self.name = name
        self.params = params
        self.instructions = instructions
        self.return_expr = return_expr

class Declaration(ASTNode):
    def __init__(self, var_type, var_name, expr):
        self.var_type = var_type
        self.var_name = var_name
        self.expr = expr

class Print(ASTNode):
    def __init__(self, expr):
        self.expr = expr

class If(ASTNode):
    def __init__(self, cond, then_block, else_block=None, elif_blocks=None):
        self.cond = cond
        self.then_block = then_block
        self.else_block = else_block
        self.elif_blocks = elif_blocks if elif_blocks is not None else []

class While(ASTNode):
    def __init__(self, cond, body):
        self.cond = cond
        self.body = body

class For(ASTNode):
    def __init__(self, init, cond, inc, body):
        self.init = init
        self.cond = cond
        self.inc = inc
        self.body = body

class Return(ASTNode):
    def __init__(self, expr):
        self.expr = expr

class FuncCall(ASTNode):
    def __init__(self, name, args):
        self.name = name
        self.args = args

class Block(ASTNode):
    def __init__(self, instructions):
        self.instructions = instructions

class BinaryOp(ASTNode):
    def __init__(self, left, op, right):
        self.left = left
        self.op = op
        self.right = right

class UnaryOp(ASTNode):
    def __init__(self, op, operand):
        self.op = op
        self.operand = operand

class Literal(ASTNode):
    def __init__(self, value, lit_type):
        self.value = value
        self.lit_type = lit_type

class Variable(ASTNode):
    def __init__(self, name):
        self.name = name

class ASTconstructor(GramaticaVisitor):
    def visitGramatica(self, ctx:GramaticaParser.GramaticaContext):
        main_ast = self.visit(ctx.main())
        functions = [self.visit(func) for func in ctx.funcion()]
        return Program(main_ast, functions)

    def visitMain(self, ctx:GramaticaParser.MainContext):
        instructions = [self.visit(instr) for instr in ctx.instruccion()]
        return Main(instructions)

    def visitInstruccion(self, ctx:GramaticaParser.InstruccionContext):
        if ctx.declaracion_y_asignacion():
            return self.visit(ctx.declaracion_y_asignacion())
        elif ctx.sentencia_print():
            return self.visit(ctx.sentencia_print())
        elif ctx.sentencia_if():
            return self.visit(ctx.sentencia_if())
        elif ctx.sentencia_while():
            return self.visit(ctx.sentencia_while())
        elif ctx.sentencia_for():
            return self.visit(ctx.sentencia_for())
        elif ctx.sentencia_return():
            return self.visit(ctx.sentencia_return())
        elif ctx.llamada_funcion():
            return self.visit(ctx.llamada_funcion())
        else:
            return None

    def visitDeclaracion_y_asignacion(self, ctx:GramaticaParser.Declaracion_y_asignacionContext):
        var_type = self.visit(ctx.tipo()) if ctx.tipo() else None
        var_name = ctx.VARIABLE().getText()
        expr = self.visit(ctx.expr())
        return Declaration(var_type, var_name, expr)

    def visitTipo(self, ctx:GramaticaParser.TipoContext):
        return ctx.getText()

    def visitSentencia_print(self, ctx:GramaticaParser.Sentencia_printContext):
        expr = self.visit(ctx.expr())
        return Print(expr)

    def visitSentencia_if(self, ctx:GramaticaParser.Sentencia_ifContext):
        # La condición principal del if
        main_cond = self.visit(ctx.expr(0))
        main_block = self.visit(ctx.bloque(0))
        
        # Procesa las cláusulas "else if" (si existen)
        elif_blocks = []

        expr_count = len(ctx.expr())
        block_count = len(ctx.bloque())
        for i in range(1, expr_count):
            cond = self.visit(ctx.expr(i))
            block = self.visit(ctx.bloque(i))
            elif_blocks.append((cond, block))
        
        # Procesa el bloque "else" (si existe)
        else_block = None
        if block_count > expr_count:
            else_block = self.visit(ctx.bloque(block_count - 1))
        
        return If(main_cond, main_block, else_block, elif_blocks)



    def visitSentencia_while(self, ctx:GramaticaParser.Sentencia_whileContext):
        cond = self.visit(ctx.expr())
        body = self.visit(ctx.bloque())
        return While(cond, body)

    def visitSentencia_for(self, ctx:GramaticaParser.Sentencia_forContext):
        init = self.visit(ctx.declaracion_y_asignacion())
        cond = self.visit(ctx.expr())
        inc = self.visit(ctx.for_incremento_y_disminucion())
        body = self.visit(ctx.bloque())
        return For(init, cond, inc, body)

    def visitFor_incremento_y_disminucion(self, ctx:GramaticaParser.For_incremento_y_disminucionContext):
        if ctx.MASMAS() or ctx.MENOSMENOS():
            var_name = ctx.VARIABLE().getText()
            op = ctx.MASMAS().getText() if ctx.MASMAS() else ctx.MENOSMENOS().getText()
            return UnaryOp(op, Variable(var_name))
        else:
            return self.visit(ctx.declaracion_y_asignacion())

    def visitSentencia_return(self, ctx:GramaticaParser.Sentencia_returnContext):
        expr = self.visit(ctx.expr())
        return Return(expr)

    def visitFuncion(self, ctx:GramaticaParser.FuncionContext):
        ret_type = self.visit(ctx.tipo())
        func_name = ctx.VARIABLE().getText()
        params = self.visit(ctx.parametros()) if ctx.parametros() else []
        instructions = [self.visit(instr) for instr in ctx.instruccion()]
        return_expr = self.visit(ctx.sentencia_return()) if ctx.sentencia_return() else None
        return Function(ret_type, func_name, params, instructions, return_expr)

    def visitParametros(self, ctx:GramaticaParser.ParametrosContext):
        params = []
        params.append((ctx.tipo(0).getText(), ctx.VARIABLE(0).getText()))
        for i in range(1, len(ctx.tipo())):
            params.append((ctx.tipo(i).getText(), ctx.VARIABLE(i).getText()))
        return params

    def visitArgumentos(self, ctx:GramaticaParser.ArgumentosContext):
        args = []
        for expr in ctx.expr():
            args.append(self.visit(expr))
        return args

    def visitLlamada_funcion(self, ctx:GramaticaParser.Llamada_funcionContext):
        func_name = ctx.VARIABLE().getText()
        args = self.visit(ctx.argumentos()) if ctx.argumentos() else []
        return FuncCall(func_name, args)

    def visitBloque(self, ctx:GramaticaParser.BloqueContext):
        instructions = [self.visit(instr) for instr in ctx.instruccion()]
        return Block(instructions)

    # MÉTODOS PARA LAS EXPRESIONES CON PRECEDENCIA

    def visitExpr(self, ctx:GramaticaParser.ExprContext):
        return self.visit(ctx.relExpr())

    def visitRelExpr(self, ctx:GramaticaParser.RelExprContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.addExpr(0))
        left = self.visit(ctx.addExpr(0))
        for i in range(1, len(ctx.addExpr())):
            op = ctx.getChild(2*i - 1).getText()
            right = self.visit(ctx.addExpr(i))
            left = BinaryOp(left, op, right)
        return left

    def visitAddExpr(self, ctx:GramaticaParser.AddExprContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.mulExpr(0))
        left = self.visit(ctx.mulExpr(0))
        for i in range(1, len(ctx.mulExpr())):
            op = ctx.getChild(2*i - 1).getText()
            right = self.visit(ctx.mulExpr(i))
            left = BinaryOp(left, op, right)
        return left

    def visitMulExpr(self, ctx:GramaticaParser.MulExprContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.powExpr(0))
        left = self.visit(ctx.powExpr(0))
        for i in range(1, len(ctx.powExpr())):
            op = ctx.getChild(2*i - 1).getText()
            right = self.visit(ctx.powExpr(i))
            left = BinaryOp(left, op, right)
        return left

    def visitPowExpr(self, ctx:GramaticaParser.PowExprContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.unaryExpr())
        left = self.visit(ctx.unaryExpr())
        op = ctx.POTENCIA().getText()
        right = self.visit(ctx.powExpr())
        return BinaryOp(left, op, right)

    def visitUnaryExpr(self, ctx:GramaticaParser.UnaryExprContext):
        if ctx.getChildCount() == 2:
            op = ctx.MENOS().getText()
            operand = self.visit(ctx.unaryExpr())
            return UnaryOp(op, operand)
        else:
            return self.visit(ctx.atom())

    def visitAtom(self, ctx:GramaticaParser.AtomContext):
        if ctx.PARENTESIS_APERTURA():
            return self.visit(ctx.expr())
        elif ctx.llamada_funcion():
            return self.visit(ctx.llamada_funcion())
        elif ctx.VARIABLE():
            return Variable(ctx.VARIABLE().getText())
        elif ctx.NUMERO():
            num_str = ctx.NUMERO().getText()
            return Literal(int(num_str), 'int') if '.' not in num_str else Literal(float(num_str), 'float')
        elif ctx.CADENA():
            text = ctx.CADENA().getText()
            return Literal(text[1:-1], 'string')
        elif ctx.BOOLEANO():
            return Literal(True if ctx.BOOLEANO().getText()=='true' else False, 'boolean')
        else:
            raise Exception("Expresión no reconocida")
