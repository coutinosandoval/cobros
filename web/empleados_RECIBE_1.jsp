<%-- 
    Document   : empleados
    Created on : 01-sep-2014, 10:00:30
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
            
        if(request.getParameter("codigo") != null)
        {
try
{   
String codigos = request.getParameter("codigo");
String nombres = request.getParameter("nombre");
String apellidos = request.getParameter("apellido");

 int filas = datos.agregarempleado(codigos,nombres,apellidos);
        
 
 
 
 if (filas ==1 )
        {
     %>
     
     <script>alert("Empleado Almacenado");
     
    window.location.href='empleados_ENVIA.html';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
    <script>alert("Codigo de Empleado ya Existe");
     
    window.location.href='empleados_ENVIA.html';

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
