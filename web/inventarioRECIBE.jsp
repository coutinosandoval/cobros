<%-- 
    Document   : inventarioRECIBE
    Created on : 10/05/2016, 10:15:01 AM
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
        <h1></h1>
        
     <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
        
        
        <%
            
        
try
{   


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
            
        
        
  
        
        
        %>
       
        
    </body>
</html>
