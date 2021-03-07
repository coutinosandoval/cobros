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
    
try
{   

    String cuenta = request.getParameter("txtcuenta");
    String fechainicial = request.getParameter("txtfechainicial");
    String fechafinal = request.getParameter("txtfechafinal");


 int filas = datos.movimientoporcuenta(cuenta,fechainicial,fechafinal);
        
 
 if (filas ==1 )
        {
     %>
         
    <script>;
     
    window.location.href='movimientoscuentas.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>;
     
    window.location.href='movimientoscuentas.jsp';

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
