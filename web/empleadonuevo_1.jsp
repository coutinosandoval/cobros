<%-- 
    Document   : empleadonuevo
    Created on : 10/08/2015, 09:44:12 PM
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form name="frmempleadonuevo" action="empleadonuevoRECIBE">
            Prime Apellido: <input type="text" name="txtprimerapellido" value="" size="15" required="true" />
            <br> Segundo Apellido: <input type="text" name="txtsegundoapellido" value="" size="15" required="true" />
            <br>Primer Nombre:<input type="text" name="txtprimernombre" value="" size="15" required="true" />
            <br>Segundo Nombre:<input type="text" name="txtsegundonombre" value="" size="15" required="true" />
            <input type="submit" value="Guardad" name="btnguardarempleado" />
        
        </form>
        
    </body>
</html>
