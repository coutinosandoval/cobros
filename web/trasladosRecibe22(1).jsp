<%-- 
    Document   : trasladosRecibe
    Created on : 06-oct-2014, 11:22:52
    Author     : Administrador
--%>
<%@page import="pconexion.conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1></h1>
        
    <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
       
              
        <%
            
        if(request.getParameter("txtdescripcion") != null)
        {
try
{   
String codempleado =request.getParameter("txtcodigoempleado");
String vale =request.getParameter("txtvale");
String codigo = request.getParameter("txtdescripcion");
String candidad= request.getParameter("txtcantidad");
String bdorigen =request.getParameter("txtbodegaorigen");
String bdestino =request.getParameter("txtbodegadestino");
String fechatraslado =request.getParameter("fecha");

 int filas = datos.traslados(codigo,candidad,bdorigen,bdestino,codempleado,vale,fechatraslado);
 
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='traslados.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("No se realizo el traslado REVISE los DATOS");
     
    window.location.href='traslados.jsp';

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
