<%-- 
    Document   : bodegaRECIBE
    Created on : 08-sep-2014, 13:43:23
    Author     : Administrador
--%>
<%--<%@page import="pconexion.conexion"%>--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
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
String codigos = "txt";
String nombres = "txtubicacionbodega";


 int filas = datos.agregabodega(request.getParameter("txtcodbodega"),nombres);
  
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='bodegaENVIA.html';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Codigo de Bodega ya Existe");
     
    window.location.href='bodegaENVIA.html';

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
