<%-- 
    Document   : resumenesRECIBE
    Created on : 29/09/2015, 09:31:41 PM
    Author     : Administrador
--%>
<%@page import="pconexion.listatablatemporal"%>
<%@page import="pconexion.grupoproductos"%>
<%@page import="pconexion.grupobodegas"%>
<%@page import="pconexion.depto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Collection"%>
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
            
      
        {
try
{   
String fecha1= request.getParameter("txtfechainicial");
String fecha2= request.getParameter("txtfechafinal");
String finca= request.getParameter("txtfinca");
//int filass = datos.borratemporal(nit,factura);
datos.borratablafincagastoscasa();
int filas = datos.resumenesfincagastos(fecha1,fecha2,finca);
 //int filas = datos.borratemporals(nit,factura); 
 if (filas ==1 )
        {
     %>
         
    <script>;
     
    window.location.href='resumenesENVIA.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Informacion Recuperada");
     
    window.location.href='resumenesENVIA.jsp';

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
