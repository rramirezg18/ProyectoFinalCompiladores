# Generated from Gramatica.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .GramaticaParser import GramaticaParser
else:
    from GramaticaParser import GramaticaParser

# This class defines a complete generic visitor for a parse tree produced by GramaticaParser.

class GramaticaVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by GramaticaParser#gramatica.
    def visitGramatica(self, ctx:GramaticaParser.GramaticaContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#main.
    def visitMain(self, ctx:GramaticaParser.MainContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#instruccion.
    def visitInstruccion(self, ctx:GramaticaParser.InstruccionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#declaracion_y_asignacion.
    def visitDeclaracion_y_asignacion(self, ctx:GramaticaParser.Declaracion_y_asignacionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#tipo.
    def visitTipo(self, ctx:GramaticaParser.TipoContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#sentencia_print.
    def visitSentencia_print(self, ctx:GramaticaParser.Sentencia_printContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#sentencia_if.
    def visitSentencia_if(self, ctx:GramaticaParser.Sentencia_ifContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#sentencia_while.
    def visitSentencia_while(self, ctx:GramaticaParser.Sentencia_whileContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#sentencia_for.
    def visitSentencia_for(self, ctx:GramaticaParser.Sentencia_forContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#for_incremento_y_disminucion.
    def visitFor_incremento_y_disminucion(self, ctx:GramaticaParser.For_incremento_y_disminucionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#sentencia_return.
    def visitSentencia_return(self, ctx:GramaticaParser.Sentencia_returnContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#funcion.
    def visitFuncion(self, ctx:GramaticaParser.FuncionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#parametros.
    def visitParametros(self, ctx:GramaticaParser.ParametrosContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#argumentos.
    def visitArgumentos(self, ctx:GramaticaParser.ArgumentosContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#llamada_funcion.
    def visitLlamada_funcion(self, ctx:GramaticaParser.Llamada_funcionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#bloque.
    def visitBloque(self, ctx:GramaticaParser.BloqueContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#expr.
    def visitExpr(self, ctx:GramaticaParser.ExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#relExpr.
    def visitRelExpr(self, ctx:GramaticaParser.RelExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#addExpr.
    def visitAddExpr(self, ctx:GramaticaParser.AddExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#mulExpr.
    def visitMulExpr(self, ctx:GramaticaParser.MulExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#powExpr.
    def visitPowExpr(self, ctx:GramaticaParser.PowExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#unaryExpr.
    def visitUnaryExpr(self, ctx:GramaticaParser.UnaryExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by GramaticaParser#atom.
    def visitAtom(self, ctx:GramaticaParser.AtomContext):
        return self.visitChildren(ctx)



del GramaticaParser