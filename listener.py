from GramaticaListener import GramaticaListener
from GramaticaParser import GramaticaParser
from tabla_simbolos import TablaSimbolos


class AnalizadorSemantico(GramaticaListener):
    def __init__(self, tabla_simbolos):
        self.ts = tabla_simbolos
        self.current_scope = []

    def enterGramatica(self, ctx:GramaticaParser.GramaticaContext):
        for func_ctx in ctx.funcion():
            nombre = func_ctx.VARIABLE().getText()
            tipo_retorno = func_ctx.tipo().getText() if func_ctx.tipo() else "void"
            parametros = []
            if func_ctx.parametros():
                tipos = func_ctx.parametros().tipo()
                nombres = func_ctx.parametros().VARIABLE()
                for tipo, nombre_var in zip(tipos, nombres):
                    parametros.append((tipo.getText(), nombre_var.getText()))
            self.ts.agregar_funcion(nombre, tipo_retorno, parametros)

    def enterMain(self, ctx:GramaticaParser.MainContext):
        self.ts.push_env()

    def exitMain(self, ctx:GramaticaParser.MainContext):
        self.ts.pop_env()

    def enterBloque(self, ctx:GramaticaParser.BloqueContext):
        self.ts.push_env()

    def exitBloque(self, ctx:GramaticaParser.BloqueContext):
        self.ts.pop_env()

    def exitDeclaracion_y_asignacion(self, ctx:GramaticaParser.Declaracion_y_asignacionContext):
        var_name = ctx.VARIABLE().getText()
        expr_tipo = self.inferir_tipo_expr(ctx.expr())
        if ctx.tipo():
            tipo_decl = ctx.tipo().getText()
            if not self.ts.tipos_compatibles(tipo_decl, expr_tipo):
                raise Exception(f"No se puede asignar un valor de tipo '{expr_tipo}' a la variable '{var_name}' de tipo '{tipo_decl}'")
            self.ts.agregar_variable(var_name, tipo_decl)
        else:
            if not self.ts.existe_variable(var_name):
                raise Exception(f"Variable '{var_name}' no declarada")

    def exitExpr(self, ctx: GramaticaParser.ExprContext):
        # Con la nueva gramática, la expresión se compone de subreglas; 
        # solo se valida si la expresión es un literal simple y corresponde a un identificador.
        if ctx.getChildCount() == 1:
            token = ctx.getChild(0).getText()
            # Solo validamos la existencia de variable si el token es un identificador (p.ej. "x", "y", etc.)
            # Si contiene operadores o no cumple la forma de identificador, se asume que es literal.
            if token.isidentifier():
                if not self.ts.existe_variable(token):
                    raise Exception(f"Variable '{token}' no declarada")



    def inferir_tipo_expr(self, expr_ctx):
        # Si hay una llamada a función, la procesamos
        llamada = expr_ctx.getTypedRuleContext(GramaticaParser.Llamada_funcionContext, 0)
        if llamada:
            return self.validar_llamada_funcion(llamada)
        # Para todos los demás casos, delegamos en tipo_expresiones
        return self.tipo_expresiones(expr_ctx)



    def validar_llamada_funcion(self, llamada_ctx):
        nombre = llamada_ctx.VARIABLE().getText()
        if not self.ts.existe_funcion(nombre):
            raise Exception(f"Función '{nombre}' no definida")
        func_info = self.ts.consultar_funcion(nombre)
        args = [self.inferir_tipo_expr(e) for e in llamada_ctx.argumentos().expr()] if llamada_ctx.argumentos() else []
        if len(args) != len(func_info['parametros']):
            raise Exception(f"Número incorrecto de argumentos en llamada a '{nombre}'")
        for arg, (tipo_esperado, _) in zip(args, func_info['parametros']):
            if not self.ts.tipos_compatibles(tipo_esperado, arg):
                raise Exception(f"Tipo de argumento '{arg}' no compatible con '{tipo_esperado}'")
        return func_info['tipo_retorno']

    def enterFuncion(self, ctx:GramaticaParser.FuncionContext):
        nombre = ctx.VARIABLE().getText()
        tipo_retorno = ctx.tipo().getText() if ctx.tipo() else "void"
        self.ts.push_env()
        if ctx.parametros():
            for tipo, var in zip(ctx.parametros().tipo(), ctx.parametros().VARIABLE()):
                self.ts.agregar_variable(var.getText(), tipo.getText())

    def exitFuncion(self, ctx:GramaticaParser.FuncionContext):
        self.ts.pop_env()

    def tipo_expresiones(self, ctx):
        from GramaticaParser import GramaticaParser  # para acceder a las clases de contexto

        # Caso base: AtomContext
        if isinstance(ctx, GramaticaParser.AtomContext):
            if ctx.NUMERO() is not None:
                num_str = ctx.NUMERO().getText()
                return 'float' if '.' in num_str else 'int'
            elif ctx.CADENA() is not None:
                return 'string'
            elif ctx.BOOLEANO() is not None:
                return 'boolean'
            elif ctx.VARIABLE() is not None:
                return self.ts.consultar_variable(ctx.VARIABLE().getText())
            elif ctx.llamada_funcion() is not None:
                return self.validar_llamada_funcion(ctx.llamada_funcion())
            # Caso: paréntesis, e.g. ( expr )
            elif ctx.getChildCount() == 3 and ctx.getChild(0).getText() == '(':
                return self.tipo_expresiones(ctx.expr(0))

        # Caso: AddExprContext
        if isinstance(ctx, GramaticaParser.AddExprContext):
            # Regla: addExpr : mulExpr ((MAS | MENOS) mulExpr)* ;
            hijos = ctx.mulExpr()
            if len(hijos) == 1:
                return self.tipo_expresiones(hijos[0])
            else:
                left_type = self.tipo_expresiones(hijos[0])
                right_type = self.tipo_expresiones(hijos[1])
                op = ctx.getChild(1).getText()  # el operador entre los dos primeros mulExpr
                if op in ['+', '-']:
                    return 'float' if left_type == 'float' or right_type == 'float' else 'int'
        
        # Caso: MulExprContext
        if isinstance(ctx, GramaticaParser.MulExprContext):
            # Regla: mulExpr : powExpr ((MULTIPLICACION | DIVISION | MOD) powExpr)* ;
            hijos = ctx.powExpr()
            if len(hijos) == 1:
                return self.tipo_expresiones(hijos[0])
            else:
                left_type = self.tipo_expresiones(hijos[0])
                right_type = self.tipo_expresiones(hijos[1])
                op = ctx.getChild(1).getText()
                if op in ['*', '/', '%']:
                    return 'float' if left_type == 'float' or right_type == 'float' else 'int'
        
        # Caso: PowExprContext
        if isinstance(ctx, GramaticaParser.PowExprContext):
            # Regla: powExpr : unaryExpr (POTENCIA powExpr)? ;
            if ctx.getChildCount() == 1:
                return self.tipo_expresiones(ctx.unaryExpr())
            else:
                # El operador '^' siempre devuelve float
                return 'float'
        
        # Caso: UnaryExprContext
        if isinstance(ctx, GramaticaParser.UnaryExprContext):
            # Regla: unaryExpr : MENOS unaryExpr | atom ;
            if ctx.getChildCount() == 1:
                return self.tipo_expresiones(ctx.getChild(0))
            else:
                # Por ejemplo, - expr
                return self.tipo_expresiones(ctx.unaryExpr())
        
        # Caso: RelExprContext
        if isinstance(ctx, GramaticaParser.RelExprContext):
            # Regla: relExpr : addExpr ((< | > | <= | >= | == | !=) addExpr)* ;
            hijos = ctx.addExpr()
            if len(hijos) == 1:
                return self.tipo_expresiones(hijos[0])
            else:
                # Las operaciones relacionales dan resultado boolean
                return 'boolean'
        
        # Caso: ExprContext (envoltorio de relExpr)
        if isinstance(ctx, GramaticaParser.ExprContext):
            return self.tipo_expresiones(ctx.relExpr())
        
        # Si no se pudo determinar, intentamos iterar sobre sus hijos
        if ctx.getChildCount() > 0:
            for i in range(ctx.getChildCount()):
                try:
                    return self.tipo_expresiones(ctx.getChild(i))
                except Exception:
                    continue
        return 'void'
