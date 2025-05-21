from GramaticaListener import GramaticaListener
from GramaticaParser import GramaticaParser
from tabla_simbolos import TablaSimbolos


class AnalizadorSemantico(GramaticaListener):
    def __init__(self, tabla_simbolos):
        self.tabla = tabla_simbolos
        self.current_scope = []
        self.warnings = []  # Lista para warnings

    
    def _warning(self, msg, ctx):
        line = ctx.start.line if ctx and ctx.start else "desconocida"
        self.warnings.append(f"Línea {line}: [WARNING] {msg}")
    
    def _get_line(self, ctx):
        return ctx.start.line if ctx and ctx.start else "desconocida"
    
    def _error(self, msg, ctx):
        raise Exception(f"Línea {self._get_line(ctx)}: {msg}")

    def enterGramatica(self, ctx: GramaticaParser.GramaticaContext):
        for func_ctx in ctx.funcion():
            nombre = func_ctx.VARIABLE().getText()
            tipo_retorno = func_ctx.tipo().getText() if func_ctx.tipo() else "void"
            parametros = []
            if func_ctx.parametros():
                for tipo, var in zip(func_ctx.parametros().tipo(), func_ctx.parametros().VARIABLE()):
                    parametros.append((tipo.getText(), var.getText()))
            linea = func_ctx.start.line
            self.tabla.agregar_funcion(nombre, tipo_retorno, parametros, linea)  # Ahora los parámetros están definidos

    def enterMain(self, ctx:GramaticaParser.MainContext):
        self.tabla.push_env()

    def exitMain(self, ctx: GramaticaParser.MainContext):
        self._exit_scope(ctx)

    def enterBloque(self, ctx:GramaticaParser.BloqueContext):
        self.tabla.push_env() 

    def exitBloque(self, ctx: GramaticaParser.BloqueContext):
        self._exit_scope(ctx)

    # En listener.py
    def exitDeclaracion_y_asignacion(self, ctx):
        var_name = ctx.VARIABLE().getText()
        expr_tipo = self.inferir_tipo_expr(ctx.expr())  # Obtener tipo de la expresión
        
        if ctx.tipo():
            tipo_decl = ctx.tipo().getText()
            linea = ctx.start.line
            # Verificar compatibilidad antes de agregar la variable
            if not self.tabla.tipos_compatibles(tipo_decl, expr_tipo):
                self._error(
                    f"No se puede asignar '{expr_tipo}' a '{var_name}' de tipo '{tipo_decl}'", 
                    ctx.expr()  # <- Usar el contexto de la expresión para el error
                )
            self.tabla.agregar_variable(var_name, tipo_decl, linea)
        else:
            if not self.tabla.existe_variable(var_name):
                self._error(f"Variable '{var_name}' no declarada", ctx)
    

    def _exit_scope(self, ctx):
        current_depth = len(self.tabla.entornos) - 1
        current_env = self.tabla.entornos[-1]
        self.tabla.pop_env()

        # Verificar variables no usadas con su línea correcta
        for var_name in current_env:
            key = (var_name, current_depth)
            if key not in self.tabla.var_used:
                linea = self.tabla.var_declared.get(key, "desconocida")
                self.warnings.append(
                    f"Línea {linea}: [WARNING] Variable '{var_name}' declarada pero no utilizada"
                )


    def exitExpr(self, ctx: GramaticaParser.ExprContext):
        if ctx.getChildCount() == 1:
            token = ctx.getChild(0).getText()
            if token.isidentifier():
                # Verificar si es una llamada a función (con o sin parámetros)
                if (ctx.parentCtx and 
                    isinstance(ctx.parentCtx, GramaticaParser.Llamada_funcionContext) and
                    ctx.parentCtx.VARIABLE().getText() == token):
                    self.tabla.usar_funcion(token)
                if not self.tabla.existe_variable(token):
                    self._error(f"Variable '{token}' no declarada", ctx)



    def inferir_tipo_expr(self, expr_ctx):
        # Si hay una llamada a función, la procesamos
        llamada = expr_ctx.getTypedRuleContext(GramaticaParser.Llamada_funcionContext, 0)
        if llamada:
            return self.validar_llamada_funcion(llamada)
        # Para todos los demás casos, delegamos en tipo_expresiones
        return self.tipo_expresiones(expr_ctx)



    # En listener.py, método validar_llamada_funcion
    def validar_llamada_funcion(self, llamada_ctx):
        nombre = llamada_ctx.VARIABLE().getText()
        self.tabla.usar_funcion(nombre)  # Registrar uso

        if not self.tabla.existe_funcion(nombre):
            self._error(f"Función '{nombre}' no definida", llamada_ctx)

        func_info = self.tabla.consultar_funcion(nombre)
        
        # Procesar argumentos (incluyendo llamadas anidadas)
        args = llamada_ctx.argumentos().expr() if llamada_ctx.argumentos() else []
        if len(args) != len(func_info['parametros']):
            self._error(f"Número incorrecto de argumentos para '{nombre}'. Esperados {len(func_info['parametros'])}, obtenidos {len(args)}", llamada_ctx)
        
        for arg_expr, (tipo_esperado, _) in zip(args, func_info['parametros']):
            arg_tipo = self.inferir_tipo_expr(arg_expr)  # Esto procesa funciones anidadas
            if not self.tabla.tipos_compatibles(tipo_esperado, arg_tipo):
                self._error(f"Tipo de argumento incompatible en llamada a '{nombre}'. Esperado {tipo_esperado}, obtenido {arg_tipo}", arg_expr)
        
        return func_info['tipo_retorno']

    def enterFuncion(self, ctx: GramaticaParser.FuncionContext):
        nombre = ctx.VARIABLE().getText()
        tipo_retorno = ctx.tipo().getText() if ctx.tipo() else "void"
        self.tabla.push_env()
        if ctx.parametros():
            # Agregar parámetros con su línea correspondiente
            for tipo, var in zip(ctx.parametros().tipo(), ctx.parametros().VARIABLE()):
                linea_var = var.symbol.line  # Obtener línea del token VARIABLE
                self.tabla.agregar_variable(var.getText(), tipo.getText(), linea_var)  # <--- Agregar línea

    def exitFuncion(self, ctx: GramaticaParser.FuncionContext):
        self._exit_scope(ctx)

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
                tipo_var, depth = self.tabla.consultar_variable(ctx.VARIABLE().getText())
                return tipo_var 
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

    def exitAtom(self, ctx: GramaticaParser.AtomContext):
        if ctx.VARIABLE():
            var_name = ctx.VARIABLE().getText()
            try:
                tipo_var, depth = self.tabla.consultar_variable(var_name)  # Obtenemos profundidad
                self.tabla.usar_variable(var_name, depth)  # <- Usamos profundidad
            except Exception as e:
                self._error(str(e), ctx)

    
    def exitGramatica(self, ctx: GramaticaParser.GramaticaContext):
        # Verificar variables globales (omitir 'true' y 'false')
        global_env = self.tabla.entornos[0]
        for var_name in global_env:
            if var_name in ['true', 'false']:
                continue  # Ignorar predefinidos
            key = (var_name, 0)
            if key not in self.tabla.var_used:
                linea = self.tabla.var_declared.get(key, "desconocida")
                self.warnings.append(f"Línea {linea}: [WARNING] Variable '{var_name}' declarada pero no utilizada")

        # Verificar funciones no usadas (excepto main)
        unused_funcs = self.tabla.func_declared - self.tabla.func_used
        for func in unused_funcs:
            if func != 'main':
                linea = self.tabla.funciones[func]['linea']
                self.warnings.append(f"Línea {linea}: [WARNING] Función '{func}' declarada pero no invocada")
    
    def enterLlamada_funcion(self, ctx: GramaticaParser.Llamada_funcionContext):
        nombre_funcion = ctx.VARIABLE().getText()
        self.tabla.usar_funcion(nombre_funcion)