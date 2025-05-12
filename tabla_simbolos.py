class TablaSimbolos:
    def __init__(self):
        self.entornos = [{}]
        self.funciones = {}
        self.current_return_type = None




        self.entornos[0]['true']  = 'boolean'
        self.entornos[0]['false'] = 'boolean'


    def push_env(self):
        self.entornos.append({})

    def pop_env(self):
        if len(self.entornos) > 1:
            self.entornos.pop()

    def current_env(self):
        return self.entornos[-1]

    def agregar_variable(self, nombre, tipo):
        if nombre in self.current_env():
            raise Exception(f"Variable '{nombre}' ya fue declarada")
        self.current_env()[nombre] = tipo

    def consultar_variable(self, nombre):
        for env in reversed(self.entornos):
            if nombre in env:
                return env[nombre]
        raise Exception(f"Variable '{nombre}' no declarada")

    def existe_variable(self, nombre):
        try:
            self.consultar_variable(nombre)
            return True
        except:
            return False

    def agregar_funcion(self, nombre, tipo_retorno, parametros):
        if nombre in self.funciones:
            raise Exception(f"Función '{nombre}' ya definida")
        self.funciones[nombre] = {
            'tipo_retorno': tipo_retorno,
            'parametros': parametros
        }

    def consultar_funcion(self, nombre):
        if nombre not in self.funciones:
            raise Exception(f"Función '{nombre}' no definida")
        return self.funciones[nombre]

    def existe_funcion(self, nombre):
        return nombre in self.funciones

    def tipos_compatibles(self, target_type, expr_type):
        if target_type == expr_type:
            return True
        if target_type == "float" and expr_type == "int":
            return True
        return False
