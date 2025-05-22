import os
import subprocess
import sys
from antlr4 import *
from antlr4.error.ErrorListener import ErrorListener
from GramaticaLexer import GramaticaLexer
from GramaticaParser import GramaticaParser
from visitor import AnalizadorVisitor
from listener import AnalizadorSemantico
from tabla_simbolos import TablaSimbolos
from constructor_ast import ASTconstructor
from generador_ir import IRgenerador
import llvmlite.binding as llvm
import time
from datetime import timedelta

class Timer:
    def __init__(self, phase_name, phase_times=None):  # phase_times opcional
        self.phase_name = phase_name
        self.phase_times = phase_times  # Puede ser None
        
    def __enter__(self):
        print(f"\n-> Iniciando fase: {self.phase_name}")
        self.start = time.monotonic()
        return self
        
    def __exit__(self, exc_type, exc_val, exc_tb):
        elapsed = time.monotonic() - self.start
        elapsed_td = timedelta(seconds=elapsed)
        status = "COMPLETADO" if not exc_type else "FALLÓ"
        print(f"--> {self.phase_name} {status} - Tiempo: {elapsed_td}")
        
        # Solo almacena tiempos si se proporcionó phase_times
        if self.phase_times is not None:
            self.phase_times.append((self.phase_name, elapsed))

class MiErrorListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        raise Exception(f"Error en línea {line}:{column} - {msg}")

def mostrar_menu_principal():
    print("\n Menú Del Compilador ")
    print("1. Compilar con optimización (--opt)")
    print("2. Compilar sin optimización")
    print("3. Generar solo código intermedio (.ll)")
    print("4. Compilar desde .ll optimizado manualmente")
    print("5. Generar ejecutable Windows (.exe)")
    print("6. Salir")
    return input("Seleccione una opción: ")

def seleccionar_archivo_ll():
    print("\n Selección de archivo IR")
    print("1. Optimizados manualmente (optManual)")
    print("2. Optimizados automáticamente (opt)")
    print("3. Sin optimizar (codigoIR)")
    
    opcion = input("Seleccione origen del .ll: ")
    
    directorios = {
        "1": "optManual",
        "2": "opt",
        "3": "codigoIR"
    }
    
    directorio = directorios.get(opcion)
    if not directorio:
        print("Opción inválida!")
        return None
    
    if not os.path.exists(directorio):
        print(f"✗ Error: No existe el directorio {directorio}")
        return None
    
    archivos = [f for f in os.listdir(directorio) if f.endswith('.ll')]
    if not archivos:
        print(f"No hay archivos .ll en {directorio}")
        return None

    print(f"\n Archivos en {directorio} ")
    for i, f in enumerate(archivos, 1):
        print(f"{i}. {f}")
    
    try:
        seleccion = int(input("Seleccione archivo .ll: "))
        return os.path.join(directorio, archivos[seleccion-1])
    except:
        return None



def convertir_a_exe():
    try:
      
        #with Timer("Verificación de dependencias"):
         #   subprocess.run(["x86_64-w64-mingw32-gcc", "--version"], 
          #                stdout=subprocess.DEVNULL, 
           #               stderr=subprocess.DEVNULL,
            #              check=True)

        archivo_ll = seleccionar_archivo_ll()
        if not archivo_ll:
            return

        # Crear carpeta para ejecutables
        os.makedirs("ejecutableEXE", exist_ok=True)
        nombre_base = os.path.splitext(os.path.basename(archivo_ll))[0]
        
        with Timer("Generación de ejecutable Windows"):
            print("\n[1/2] Generando objeto Windows...")
            obj_path = os.path.join("ejecutableEXE", f"{nombre_base}.obj")
            subprocess.run([
                "llc",
                "-mtriple=x86_64-pc-windows-gnu",
                "-filetype=obj",
                archivo_ll,
                "-o",
                obj_path
            ], check=True)
            
            print("[2/2] Generando .exe...")
            exe_path = os.path.join("ejecutableEXE", f"{nombre_base}.exe")
            subprocess.run([
                "x86_64-w64-mingw32-gcc",
                "-o",
                exe_path,
                obj_path,
                "-lm",
                "-static"
            ], check=True)
            
            print(f"\n✓ Ejecutable Windows generado: {exe_path}")
        
    except subprocess.CalledProcessError as e:
        print(f"\n✗ Error en compilación: {e}")
    except Exception as e:
        print(f"\n✗ Error inesperado: {e}")
    





def listar_archivos_test():
    test_dir = "testFiles"
    if not os.path.exists(test_dir):
        print(f"\nError: No existe el directorio {test_dir}")
        return None
    
    archivos = [f for f in os.listdir(test_dir) if f.endswith('.txt')]
    if not archivos:
        print("\nNo hay archivos .txt en el directorio testFiles")
        return None

    print("\n Archivos disponibles para compilar ")
    for i, archivo in enumerate(archivos, 1):
        print(f"{i}. {archivo}")
    
    try:
        seleccion = int(input("\nSeleccione un archivo (número): "))
        if 1 <= seleccion <= len(archivos):
            return os.path.join(test_dir, archivos[seleccion-1])
        else:
            print("Selección inválida")
            return None
    except ValueError:
        print("Entrada inválida")
        return None







def compilar(optimizar=False, solo_ir=False):
    archivo_entrada = listar_archivos_test()
    if not archivo_entrada:
        return

    total_start = time.monotonic()
    phase_times = []  # Lista para recopilar tiempos

    try:
        # Configurar listeners de error
        error_listener = MiErrorListener()
        
        # 1. Fase de Análisis Léxico
        with Timer("Análisis léxico", phase_times):
            input_stream = FileStream(archivo_entrada)
            lexer = GramaticaLexer(input_stream)
            lexer.removeErrorListeners()
            lexer.addErrorListener(error_listener)
            tokens = CommonTokenStream(lexer)
            tokens.fill()
            print("✓ No se encontraron errores léxicos")

        # 2. Fase de Análisis Sintáctico
        with Timer("Análisis sintáctico", phase_times):
            parser = GramaticaParser(tokens)
            parser.removeErrorListeners()
            parser.addErrorListener(error_listener)
            tree = parser.gramatica()
            print("✓ No se encontraron errores sintácticos")

        # 3. Análisis Semántico
        with Timer("Análisis semántico", phase_times):
            tabla = TablaSimbolos()
            listener = AnalizadorSemantico(tabla)
            walker = ParseTreeWalker()
            walker.walk(listener, tree)
            if listener.warnings:
                print("\n[!] Warnings detectados:")
                for warn in listener.warnings:
                    print(f"  → {warn}")
            print("✓ No se encontraron errores semánticos")

        # 4. Ejecución del Visitor (comentario preservado)
        #with Timer("Ejecución del código", phase_times):
            #visitor = AnalizadorVisitor()
            #visitor.visit(tree)
          #  print("✓ Ejecución completada")

        # 5. Generación de AST
        with Timer("Generación de AST", phase_times):
            ast_constructor = ASTconstructor()
            ast = ast_constructor.visit(tree)

        # 6. Generación de IR
        with Timer("Generación de código IR", phase_times):
            ir_generador = IRgenerador(ast, tabla)
            modulo_llvm = ir_generador.generar()
            nombre_base = os.path.splitext(os.path.basename(archivo_entrada))[0]
            output_dir = "codigoIR" if solo_ir else "opt" if optimizar else "codigoIR"
            os.makedirs(output_dir, exist_ok=True)
            archivo_ll = os.path.join(output_dir, f"{nombre_base}.ll")
            with open(archivo_ll, "w") as f:
                f.write(str(modulo_llvm))
            if solo_ir:
                print(f"\nArchivo IR generado: {archivo_ll}")
                return

        # 7. Optimización (si se solicita) (comentario preservado)
        if optimizar:
            with Timer("Optimización de código", phase_times):
                llvm.initialize()
                llvm.initialize_native_target()
                llvm.initialize_native_asmprinter()
                llvm_mod = llvm.parse_assembly(str(modulo_llvm))
                llvm_mod.verify()
                pmb = llvm.PassManagerBuilder()
                pmb.opt_level = 2
                pm = llvm.ModulePassManager()
                pmb.populate(pm)
                pm.run(llvm_mod)
                archivo_opt = os.path.join("opt", f"{nombre_base}_O2.ll")
                with open(archivo_opt, "w") as f:
                    f.write(str(llvm_mod))
                print(f"✓ IR optimizado generado: {archivo_opt}")
                archivo_ll = archivo_opt

        # 8. Compilación y ejecución automáticas 
        with Timer("Compilación a binario", phase_times):
            subprocess.run(["clang", "-o", nombre_base, archivo_ll, "-lm"])
            print(f"✓ Ejecutable generado: ./{nombre_base}")
            
            # Ejecución sin mostrar tiempos pero mostrando salida
            #print("\n Salida del programa")
            resultado = subprocess.run(
                [f"./{nombre_base}"],
                capture_output=True,
                text=True
            )
            print(resultado.stdout)
            if resultado.stderr:
                print(resultado.stderr)

        # Mostrar tiempos por fase 
        print("\nTiempos por fase:")
        for phase_name, elapsed in phase_times:
            td = timedelta(seconds=elapsed)
            hours = td.seconds // 3600
            minutes = (td.seconds % 3600) // 60
            seconds = td.seconds % 60
            microseconds = td.microseconds
            time_str = f"{hours}:{minutes:02}:{seconds:02}:{microseconds:06d}"
            time_str = time_str[:-2]  # Quita los últimos dos dígitos para 4 decimales
            print(f"{phase_name.ljust(25)} {time_str}")

        total_elapsed = timedelta(seconds=time.monotonic() - total_start)
        print(f"\n! TIEMPO TOTAL DE COMPILACIÓN: {total_elapsed}")

    except Exception as e:
        if phase_times:
            print("\nTiempos por fase hasta el error:")
            for phase_name, elapsed in phase_times:
                td = timedelta(seconds=elapsed)
                hours = td.seconds // 3600
                minutes = (td.seconds % 3600) // 60
                seconds = td.seconds % 60
                microseconds = td.microseconds
                time_str = f"{hours}:{minutes:02}:{seconds:02}:{microseconds:06d}"
                time_str = time_str[:-2]
                print(f"{phase_name.ljust(25)} {time_str}")

        if "Línea" in str(e):  
            print(f"\n✗ Error semántico: {str(e)}")
        else:
            print(f"\n✗ Error durante la compilación: {str(e)}")
        
        total_elapsed = timedelta(seconds=time.monotonic() - total_start)
        print(f"\n! TIEMPO TOTAL HASTA EL ERROR: {total_elapsed}")



def compilar_desde_ir():
    total_start = time.monotonic()
    phase_times = []  # Lista para almacenar tiempos de fase
    
    try:
        # Listar archivos .ll en la carpeta optManual
        opt_dir = "optManual"
        if not os.path.exists(opt_dir):
            print(f"\n✗ Error: No existe el directorio {opt_dir}")
            return
        
        archivos = [f for f in os.listdir(opt_dir) if f.endswith('.ll')]
        if not archivos:
            print("\n✗ No hay archivos .ll en el directorio optManual")
            return

        print("\n Archivos optimizados disponibles")
        for i, archivo in enumerate(archivos, 1):
            print(f"{i}. {archivo}")
        
        try:
            seleccion = int(input("\nSeleccione un archivo (número): "))
            if 1 <= seleccion <= len(archivos):
                archivo_ll = os.path.join(opt_dir, archivos[seleccion-1])
            else:
                print("Selección inválida")
                return
        except:
            print("Entrada inválida")
            return

        nombre_base = os.path.splitext(os.path.basename(archivo_ll))[0]
        
        try:
            with Timer("Compilación a binario", phase_times):
                # Compilar a objeto
                subprocess.run([
                    "llc", 
                    "-filetype=obj",
                    "-relocation-model=pic",
                    archivo_ll, 
                    "-o", 
                    f"{nombre_base}.o"
                ], check=True)
                
                # Generar ejecutable
                subprocess.run([
                    "clang",
                    "-o", 
                    nombre_base, 
                    f"{nombre_base}.o", 
                    "-lm",
                    "-no-pie"
                ], check=True)
                print(f"\n✓ Ejecutable generado: ./{nombre_base}")
                
                # Ejecutar programa
                print("\n Salida del programa ")
                resultado = subprocess.run(
                    [f"./{nombre_base}"],
                    capture_output=True,
                    text=True
                )
                print(resultado.stdout)
                if resultado.stderr:
                    print(resultado.stderr)

            # Mostrar tiempos si todo fue bien
            print("\nTiempos por fase:")
            for phase_name, elapsed in phase_times:
                td = timedelta(seconds=elapsed)
                print(f"{phase_name.ljust(25)} {td}")

            total_elapsed = timedelta(seconds=time.monotonic() - total_start)
            print(f"\n! TIEMPO TOTAL DE COMPILACIÓN: {total_elapsed}")

        except subprocess.CalledProcessError as e:
            # Mostrar tiempos acumulados hasta el error
            if phase_times:
                print("\nTiempos por fase hasta el error:")
                for phase_name, elapsed in phase_times:
                    td = timedelta(seconds=elapsed)
                    print(f"{phase_name.ljust(25)} {td}")

            total_elapsed = timedelta(seconds=time.monotonic() - total_start)
            print(f"\n✗ Error en compilación: {str(e)}")
            print(f"! TIEMPO TOTAL HASTA EL ERROR: {total_elapsed}")
            
        except Exception as e:
            if phase_times:
                print("\nTiempos por fase hasta el error:")
                for phase_name, elapsed in phase_times:
                    td = timedelta(seconds=elapsed)
                    print(f"{phase_name.ljust(25)} {td}")

            total_elapsed = timedelta(seconds=time.monotonic() - total_start)
            print(f"\n✗ Error inesperado: {str(e)}")
            print(f"! TIEMPO TOTAL HASTA EL ERROR: {total_elapsed}")
                
    except Exception as e:
        total_elapsed = timedelta(seconds=time.monotonic() - total_start)
        print(f"\n✗ Error general: {str(e)}")
        print(f"! TIEMPO TOTAL HASTA EL ERROR: {total_elapsed}")

def main():
    llvm.initialize()
    while True:
        opcion = mostrar_menu_principal()
        
        if opcion == "1":
            compilar(optimizar=True)
        elif opcion == "2":
            compilar(optimizar=False)
        elif opcion == "3":
            compilar(solo_ir=True)
        elif opcion == "4":
            compilar_desde_ir()
        elif opcion == "5":
            convertir_a_exe()
        elif opcion == "6":
            print("Saliendo...")
            break
        else:
            print("Opción inválida!")

if __name__ == "__main__":
    main()