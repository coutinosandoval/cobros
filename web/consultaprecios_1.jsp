<%-- 
    Document   : consultaprecios
    Created on : 14-oct-2014, 11:56:56
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultasprecios</title>
    </head>
    <body>
        <h1></h1>
        <form name="frmconsultaprecios" action="consultapreciosrecibe.jsp" method="POST">
            Codigo del Producto: <input type="text" name="txtcodigoproducto" value="" />
            <input type="submit" value="Consultar" name="btnconsultar" />
        </form>
        
    </body>
</html>
