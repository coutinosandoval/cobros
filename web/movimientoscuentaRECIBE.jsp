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
    if(request.getParameter("txtcuenta") != null)
        {
try
{   
String fechainicial = request.getParameter("txtfechainicial");
String fechafinal = request.getParameter("txtfechafinal");
String cuenta = request.getParameter("txtcuenta");


 int filas = datos.movimientoporcuenta(cuenta,fechainicial,fechafinal);
        
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='movimientoscuentas.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("No hay movimientos en este periodo");
     
    window.location.href='movimientoscuentas.jsp';

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
