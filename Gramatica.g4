/*
ESTRUCTURA DEL LENGUAJE
programx{
    main(){ --función principal
        bloque de instrucciones,
        variables,
        llamadas a funciones,
        estructuras while, if, for, etc.
    }
    tipo funcion(parametros o no){ -- demás funciones
        bloque de instrucciones,
        llamadas a funciones,
        variables locales,
        while, if, for,
        return
    }
}
*/

grammar Gramatica;

gramatica
    : VARIABLE LLAVE_APERTURA main funcion* LLAVE_CIERRE EOF
    ;

main
    : MAIN PARENTESIS_APERTURA PARENTESIS_CIERRE LLAVE_APERTURA instruccion* LLAVE_CIERRE
    ;

instruccion
    : declaracion_y_asignacion
    | sentencia_print
    | sentencia_if
    | sentencia_while
    | sentencia_for
    | sentencia_return
    | llamada_funcion
    ;

declaracion_y_asignacion
    : (tipo)? VARIABLE ASIGNACION expr FIN_DE_LINEA
    ;

tipo
    : INT
    | FLOAT
    | BOOLEAN
    | STRING
    ;

sentencia_print
    : PRINT PARENTESIS_APERTURA expr PARENTESIS_CIERRE FIN_DE_LINEA
    ;

sentencia_if
    : IF PARENTESIS_APERTURA expr PARENTESIS_CIERRE bloque
      (ELSE IF PARENTESIS_APERTURA expr PARENTESIS_CIERRE bloque)*
      (ELSE bloque)?
    ;

sentencia_while
    : WHILE PARENTESIS_APERTURA expr PARENTESIS_CIERRE bloque
    ;

sentencia_for
    : FOR PARENTESIS_APERTURA declaracion_y_asignacion expr FIN_DE_LINEA for_incremento_y_disminucion PARENTESIS_CIERRE bloque
    ;

for_incremento_y_disminucion
    : VARIABLE (MASMAS | MENOSMENOS)
    | declaracion_y_asignacion
    ;

sentencia_return
    : RETURN expr FIN_DE_LINEA
    ;

funcion
    : tipo VARIABLE PARENTESIS_APERTURA parametros? PARENTESIS_CIERRE LLAVE_APERTURA instruccion* (sentencia_return)? LLAVE_CIERRE
    ;

parametros
    : tipo VARIABLE (COMA tipo VARIABLE)*
    ;

argumentos
    : expr (COMA expr)*
    ;

llamada_funcion
    : VARIABLE PARENTESIS_APERTURA argumentos? PARENTESIS_CIERRE FIN_DE_LINEA?
    ;

bloque
    : LLAVE_APERTURA instruccion+ LLAVE_CIERRE
    ;

// Reglas de expresiones con precedencia y asociatividad

expr
   : relExpr
   ;

relExpr
   : addExpr ((MAYOR | MENOR | MAYOR_IGUAL_QUE | MENOR_IGUAL_QUE | IGUAL | DIFERENTE) addExpr)*
   ;

addExpr
   : mulExpr ((MAS | MENOS) mulExpr)*
   ;

mulExpr
   : powExpr ((MULTIPLICACION | DIVISION | MOD) powExpr)*
   ;

powExpr
   : unaryExpr (POTENCIA powExpr)?      // Exponenciación, asociatividad a la derecha
   ;

unaryExpr
   : MENOS unaryExpr                    // Negación unaria
   | atom
   ;

atom
   : PARENTESIS_APERTURA expr PARENTESIS_CIERRE
   | llamada_funcion
   | VARIABLE
   | NUMERO
   | CADENA
   | BOOLEANO
   ;

MAIN: 'main';
IF: 'if';
ELSE: 'else';
WHILE: 'while';
FOR: 'for';
PRINT: 'print';
RETURN: 'return';
ASIGNACION: '=';

MAS: '+';
MENOS: '-';
MULTIPLICACION: '*';
DIVISION: '/';
POTENCIA: '^';
MOD: '%';

IGUAL: '==';
DIFERENTE: '!=';
MENOR: '<';
MAYOR: '>';
MENOR_IGUAL_QUE: '<=';
MAYOR_IGUAL_QUE: '>=';

MASMAS: '++';
MENOSMENOS: '--';

INT: 'int';
FLOAT: 'float';
BOOLEAN: 'boolean';
STRING: 'string';

VARIABLE: [a-zA-Z_][a-zA-Z0-9_]*;
NUMERO: [0-9]+ ('.' [0-9]+)?;
CADENA: '"' (~["\r\n])* '"';
BOOLEANO: 'true' | 'false';

PARENTESIS_APERTURA: '(';
PARENTESIS_CIERRE: ')';
LLAVE_APERTURA: '{';
LLAVE_CIERRE: '}';
FIN_DE_LINEA: ';';
COMA: ',';

WS: [ \t\r\n]+ -> skip;
COMENTARIO_LINEA: '//' ~[\r\n]* -> skip;
COMENTARIO_MULTILINEA: '/*' .*? '*/' -> skip;
