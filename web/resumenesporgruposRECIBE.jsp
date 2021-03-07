<%-- 
    Document   : resumenesporgruposRECIBE
    Created on : 20/10/2015, 09:49:44 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        
     <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
        
        
        <%
            
       
try
{   
String finca=request.getParameter("txtfinca") ;
String fechainicial=request.getParameter("txtfechainicial");
String fechafinal=request.getParameter("txtfechafinal");

 int filas = datos.ingresarfincagastosporgrupos(finca,fechainicial,fechafinal) ;
        
 if (filas ==1 )
        {
            response.sendRedirect("resumenesporgrupo.jsp");
     
         
 }//if filas                   
  else 
           {%>
     <script>alert("Codigo de Producto No Existe");
     
    window.location.href='resumenesporgrupo.jsp';

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
