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
        <title>empleados</title>
    </head>
    <body>
        <BR/><a href="indexORIGINAL.html">INICIO</a>  <BR/><BR/><BR/>
        <h1>Ingreso de nuevos empleados</h1>
        <BR/><BR/>
        <form name="frmempleados" action="empleadosnuevosRECIBE.jsp">
       
        Prime Apellido: <input type="text" name="txtprimerapellido" value="" size="15" required="true" />
            Segundo Apellido: <input type="text" name="txtsegundoapellido" value="" size="15" required="true" />
            <br>Primer Nombre:<input type="text" name="txtprimernombre" value="" size="15" required="true" />
            Segundo Nombre:<input type="text" name="txtsegundonombre" value="" size="15" required="true" />
            <br>
            Usuario:<input type="text" name="txtuser" value="" size="10" />
            Clave:<input type="text" name="txtclave" value="" size="10" />
            <input type="submit" value="Guardad" name="btnguardarempleado" />
        </form>
         
    </body>
</html>
