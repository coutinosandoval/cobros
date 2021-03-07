<%-- 
    Document   : prestamosRECIBE
    Created on : 10/11/2015, 11:05:40 PM
    Author     : Administrador
--%>


<%@page import="pconexion.conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
        
        
        <%
            
        if(request.getParameter("txtnombreempleado") != null)
        {
try
{   
String fecha = request.getParameter("txtfechaprestamo");
String empleado = request.getParameter("txtnombreempleado");
String prestamo = request.getParameter("txtcantidadprestada");

 int filas = datos.ingresaprestamos(fecha,empleado,prestamo);
        
 
 
 
 if (filas ==1 )
        {
     %>
     
     <script>alert("Accion Almacenado");
     
    window.location.href='prestamos.html';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
    <script>alert("Ocurrio un error");
     
    window.location.href='prestamos.html';

     </script> 
       
         <% }//else
 
 
         
}//try                     
      
catch (Exception e)
        {
    out.println("Error  "+ e.getMessage());
    
}//fin catch
}   //if            
        
        
  
        
        
        %>
    
    </body>
</html>
