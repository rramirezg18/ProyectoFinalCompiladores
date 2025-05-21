class TablaSimbolos:
    def __init__(self):
        self.entornos = [{}]
        self.funciones = {}  
        self.var_declared = {}  # (nombre, profundidad): línea
        self.var_used = set()    # Almacena tuplas (nombre, profundidad)
        self.func_declared = set()  
        self.func_used = set()

        # Agregar variables predefinidas con línea 0
        self.agregar_variable('true', 'boolean', 0)
        self.agregar_variable('false', 'boolean', 0)
        
        # Función print predefinida
        self.funciones['print'] = {
            'tipo_retorno': 'void',
            'parametros': [('any', 'mensaje')],
            'linea': 0
        }
        self.func_declared.add('print')
        self.func_used.add('print')

        # Valores predefinidos
        self.entornos[0]['true'] = 'boolean'
        self.entornos[0]['false'] = 'boolean'


    def push_env(self):
        self.entornos.append({})

    def pop_env(self):
        if len(self.entornos) > 1:
            self.entornos.pop()

    def current_env(self):
        return self.entornos[-1]

    def agregar_variable(self, nombre, tipo, linea):
        current_depth = len(self.entornos) - 1
        if nombre in self.current_env():
            raise Exception(f"Variable '{nombre}' ya fue declarada")
        self.current_env()[nombre] = tipo
        self.var_declared[(nombre, current_depth)] = linea  # Guardar línea
    
    def usar_variable(self, nombre, depth):
        self.var_used.add((nombre, depth))

    def consultar_variable(self, nombre):
        # Devuelve (tipo, profundidad)
        for i, env in enumerate(reversed(self.entornos)):
            if nombre in env:
                depth = len(self.entornos) - 1 - i
                return env[nombre], depth
        raise Exception(f"Variable '{nombre}' no declarada")

    def usar_variable(self, nombre, depth):  # <- ¡Acepta profundidad!
        self.var_used.add((nombre, depth))

    def existe_variable(self, nombre):
        try:
            self.consultar_variable(nombre)
            return True
        except:
            return False

    def agregar_funcion(self, nombre, tipo_retorno, parametros, linea):
        self.func_declared.add(nombre)
        if nombre in self.funciones:
            raise Exception(f"Función '{nombre}' ya definida")
        self.funciones[nombre] = {
            'tipo_retorno': tipo_retorno,
            'parametros': parametros,
            'linea': linea  # Nueva clave para la línea
        }
        # Si es main, marcarla como usada automáticamente
        if nombre == 'main':
            self.usar_funcion(nombre)
    
    def usar_funcion(self, nombre):
        self.func_used.add(nombre)

    def consultar_funcion(self, nombre):
        if nombre not in self.funciones:
            raise Exception(f"Función '{nombre}' no definida")
        return self.funciones[nombre]

    def existe_funcion(self, nombre):
        return nombre in self.funciones

    def tipos_compatibles(self, target_type, expr_type, ctx=None):
        if target_type == expr_type:
            return True
        if target_type == "float" and expr_type == "int":
            return True

        return False 
