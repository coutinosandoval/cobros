<%-- 
    Document   : movimientosXcuentaRECIBE
    Created on : 3/03/2016, 02:36:02 PM
    Author     : dcoutino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
        <% 
     try
     {   
         
       // int filas=0;
      int  filas = datos.movimientosporcuenta();
      
      if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='empleadosnuevos.html';

     </script> 
     <%
         
 }//if filas 
        
     }//fin try
     
     catch (Exception e)
        {
    out.println("Error  "+ e.getMessage());
    
}//fin catch
        
        %>
    </body>
</html>
