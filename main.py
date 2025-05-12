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
    def __init__(self, phase_name):
        self.phase_name = phase_name
        
    def __enter__(self):
        print(f"\n[*] Iniciando fase: {self.phase_name}")
        self.start = time.monotonic()
        return self
        
    def __exit__(self, exc_type, exc_val, exc_tb):
        elapsed = timedelta(seconds=time.monotonic() - self.start)
        status = "COMPLETADO" if not exc_type else "FALLÓ"
        print(f"[+] {self.phase_name} {status} - Tiempo: {elapsed}")

class MiErrorListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        raise Exception(f"Error sintáctico en línea {line}:{column} - {msg}")

def mostrar_menu_principal():
    print("\n=== Menú del Compilador ===")
    print("1. Compilar con optimización (--opt)")
    print("2. Compilar sin optimización")
    print("3. Generar solo código intermedio (.ll)")
    print("4. Compilar desde .ll optimizado manualmente")
    print("5. Generar ejecutable Windows (.exe)")
    print("6. Salir")
    return input("Seleccione una opción: ")

def seleccionar_archivo_ll():
    print("\n=== Selección de archivo IR ===")
    print("1. Usar archivo de testFiles")
    print("2. Usar archivo optimizado manualmente")
    opcion = input("Seleccione origen del .ll: ")
    
    directorio = "testFiles" if opcion == "1" else "optManual"
    if not os.path.exists(directorio):
        print(f"Directorio {directorio} no existe!")
        return None
    
    archivos = [f for f in os.listdir(directorio) if f.endswith('.ll')]
    if not archivos:
        print("No hay archivos .ll en el directorio")
        return None

    for i, f in enumerate(archivos, 1):
        print(f"{i}. {f}")
    
    try:
        seleccion = int(input("Seleccione archivo .ll: "))
        return os.path.join(directorio, archivos[seleccion-1])
    except:
        return None


def convertir_a_exe():
    try:
        with Timer("Verificación de dependencias"):
            subprocess.run(["x86_64-w64-mingw32-gcc", "--version"], 
                          stdout=subprocess.DEVNULL, 
                          stderr=subprocess.DEVNULL)
    except:
        print("\n✗ Error: Requiere mingw-w64 instalado.")
        print("Instale con: sudo apt-get install mingw-w64")
        return
    
    archivo_ll = seleccionar_archivo_ll()
    if not archivo_ll:
        return

    nombre_base = os.path.splitext(os.path.basename(archivo_ll))[0]
    
    try:
        with Timer("Generación de ejecutable Windows"):
            print("\n[1/2] Generando objeto Windows...")
            subprocess.run([
                "llc",
                "-mtriple=x86_64-pc-windows-gnu",
                "-filetype=obj",
                archivo_ll,
                "-o",
                f"{nombre_base}.obj"
            ], check=True)
            
            print("[2/2] Generando .exe...")
            subprocess.run([
                "x86_64-w64-mingw32-gcc",
                "-o",
                f"{nombre_base}.exe",
                f"{nombre_base}.obj",
                "-lm",
                "-static"
            ], check=True)
            
            print(f"\n✓ Ejecutable Windows generado: {nombre_base}.exe")
        
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

    print("\n=== Archivos disponibles en testFiles ===")
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

    try:
        # Configurar listeners de error
        error_listener = MiErrorListener()
        
        # 1. Fase de Análisis Léxico
        with Timer("Análisis léxico"):
            input_stream = FileStream(archivo_entrada)
            lexer = GramaticaLexer(input_stream)
            lexer.removeErrorListeners()
            lexer.addErrorListener(error_listener)
            
            # Generar tokens y verificar errores léxicos
            tokens = CommonTokenStream(lexer)
            tokens.fill()  # Fuerza el análisis léxico completo
            
            print("✓ No se encontraron errores léxicos")

        # 2. Fase de Análisis Sintáctico
        with Timer("Análisis sintáctico"):
            parser = GramaticaParser(tokens)
            parser.removeErrorListeners()
            parser.addErrorListener(error_listener)
            tree = parser.gramatica()  # Construye el árbol sintáctico
            
            print("✓ No se encontraron errores sintácticos")

        # 3. Análisis Semántico
        with Timer("Análisis semántico"):
            tabla = TablaSimbolos()
            listener = AnalizadorSemantico(tabla)
            walker = ParseTreeWalker()
            walker.walk(listener, tree)
            print("✓ No se encontraron errores semánticos")

        # 4. Ejecución del Visitor
        with Timer("Ejecución del código"):
            visitor = AnalizadorVisitor()
            visitor.visit(tree)
            print("✓ Ejecución completada")

        # 5. Generación de AST
        with Timer("Generación de AST"):
            ast_constructor = ASTconstructor()
            ast = ast_constructor.visit(tree)

        # 6. Generación de IR
        with Timer("Generación de código intermedio"):
            ir_generador = IRgenerador(ast, tabla)
            modulo_llvm = ir_generador.generar()
            
            nombre_base = os.path.splitext(os.path.basename(archivo_entrada))[0]
            archivo_ll = f"{nombre_base}.ll"
            
            with open(archivo_ll, "w") as f:
                f.write(str(modulo_llvm))
            
            if solo_ir:
                print(f"\nArchivo IR generado: {archivo_ll}")
                return

        # 7. Optimización (si se solicita)
        if optimizar:
            with Timer("Optimización de código"):
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
                
                archivo_opt = f"{nombre_base}_opt.ll"
                with open(archivo_opt, "w") as f:
                    f.write(str(llvm_mod))
                print(f"✓ IR optimizado generado: {archivo_opt}")
                archivo_ll = archivo_opt

        # 8. Compilación a binario
        compilar = input("\n¿Desea compilar a binario? (s/n): ").lower()
        if compilar == 's':
            with Timer("Compilación a binario"):
                subprocess.run([
                    "clang", 
                    "-o", 
                    nombre_base, 
                    archivo_ll, 
                    "-lm"
                ])
                print(f"✓ Ejecutable generado: ./{nombre_base}")
                
                # Ejecutar el programa
                ejecutar = input("¿Desea ejecutar el programa? (s/n): ").lower()
                if ejecutar == 's':
                    with Timer("Ejecución del programa"):
                        print("\nSalida del programa:")
                        subprocess.run([f"./{nombre_base}"])

    except Exception as e:
        print(f"\n✗ Error durante la compilación: {str(e)}")
    
def compilar_desde_ir():
    # Listar archivos .ll en la carpeta optManual
    opt_dir = "optManual"
    if not os.path.exists(opt_dir):
        print(f"\nError: No existe el directorio {opt_dir}")
        return
    
    archivos = [f for f in os.listdir(opt_dir) if f.endswith('.ll')]
    if not archivos:
        print("\nNo hay archivos .ll en el directorio optManual")
        return

    print("\n=== Archivos optimizados disponibles ===")
    for i, archivo in enumerate(archivos, 1):
        print(f"{i}. {archivo}")
    
    try:
        seleccion = int(input("\nSeleccione un archivo (número): "))
        if 1 <= seleccion <= len(archivos):
            archivo_ll = os.path.join(opt_dir, archivos[seleccion-1])
        else:
            print("Selección inválida")
            return
    except ValueError:
        print("Entrada inválida")
        return

    nombre_base = os.path.splitext(os.path.basename(archivo_ll))[0]
    
    try:
        with Timer("Compilación desde IR optimizado"):
            # Compilar a objeto
            print("\nCompilando a binario...")
            subprocess.run([
                "llc", 
                "-filetype=obj",
                "-relocation-model=pic",
                archivo_ll, 
                "-o", 
                f"{nombre_base}.o"
            ], check=True)
            
            subprocess.run([
                "clang",
                "-o", 
                nombre_base, 
                f"{nombre_base}.o", 
                "-lm",
                "-no-pie"
            ], check=True)
            
            print(f"\n✓ Ejecutable generado: ./{nombre_base}")
            
            # Ejecutar el programa
            ejecutar = input("\n¿Desea ejecutar el programa? (s/n): ").lower()
            if ejecutar == 's':
                with Timer("Ejecución del programa"):
                    print("\n=== Salida del programa ===")
                    subprocess.run([f"./{nombre_base}"])
                
    except subprocess.CalledProcessError as e:
        print(f"\n✗ Error durante la compilación: {str(e)}")
    except Exception as e:
        print(f"\n✗ Error inesperado: {str(e)}")

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