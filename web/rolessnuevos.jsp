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
        <title>roles</title>
    </head>
    <body>
        <BR/><a href="indexORIGINAL.html">INICIO</a>  <BR/><BR/><BR/>
        <h1>Creacion de Nuevos Roles</h1>
        <BR/><BR/>
        <form name="frmroles" action="rolessnuevosRECIBE.jsp">
       
            Nombre del Rol: <input type="text" name="txtrol" value="" size="15" required="true" />
             <br>
            <input type="submit" value="Guardad" name="btnguardarempleado" />
        </form>
         
    </body>
</html>
