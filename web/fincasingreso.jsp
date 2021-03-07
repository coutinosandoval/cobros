<%-- 
    Document   : fincasingreso
    Created on : 18/08/2015, 09:27:18 AM
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fincas</title>
    </head>
    <body>
        <h1>Ingreso de Fincas</h1>
        
        <form name="frmingresofincas" action="fincasRecibe.jsp">
            <BR></BR> Codigo de la Finca:<input type="text" name="txtcodigofinca" value="" size="15" required = "true" />
            <BR></BR> Nombre de la Finca:<input type="text" name="txtnombrefinca" value="" size="45" required = "true" />
            <input type="submit" value="Guardar" name="tnguardar" />
        </form>
        <BR/><a href="indexORIGINAL.html">INICIO</a>
    </body>
</html>
