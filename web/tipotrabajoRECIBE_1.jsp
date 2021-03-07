<%-- 
    Document   : tipotrabajo
    Created on : 10/11/2015, 11:23:01 AM
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
        
       <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
     <%
            
        if(request.getParameter("txtcodigotrabajo") != null)
        {
try
{   
String codigotrabajo = request.getParameter("txtcodigotrabajo");
String descripcion = request.getParameter("txtdescripcion");
String salarioasignado = request.getParameter("txtsalarioasignado");

 int filas = datos.ingresatipotrabajo(codigotrabajo,descripcion,salarioasignado);
        
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='tipotrabajo.html';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Codigo de Trabajo ya Existe");
     
    window.location.href='tipotrabajo.html';

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
