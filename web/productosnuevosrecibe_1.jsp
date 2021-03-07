<%-- 
    Document   : productosnuevosrecibe
    Created on : 13-oct-2014, 10:46:45
    Author     : Administrador
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>productos</title>
    </head>
    <body>
        <h1></h1>
     <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
     <%
            
        if(request.getParameter("txtcodigoproducto") != null)
        {
try
{   
String codigo = request.getParameter("txtcodigoproducto");
String descripcion = request.getParameter("txtdescripcionproducto");


 int filas = datos.agregaproductos(codigo,descripcion);
        
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='productosnuevos.html';

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
