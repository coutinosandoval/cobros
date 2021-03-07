<%-- 
    Document   : grupoproductosRECIBE
    Created on : 12/11/2014, 03:39:58 PM
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
            
        if(request.getParameter("txtcodigogrupo") != null)
        {
try
{   
String codigo = request.getParameter("txtcodigogrupo");
String descripcion = request.getParameter("txtdescripcion");


 int filas = datos.agregagrupoproductos(codigo,descripcion);
        
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='grupoproductos.html';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Codigo de Producto ya Existe");
     
    window.location.href='productosnuevos.html';

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
