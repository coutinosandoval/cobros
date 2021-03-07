<%-- 
    Document   : fincaingresosRECIBE
    Created on : 22/01/2016, 12:00:43 PM
    Author     : dcoutino
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
            
        if(request.getParameter("fecha") != null)
        {
try
{   
String fechainicial = request.getParameter("txtfechainicial");
String fechafinal = request.getParameter("txtfechafinal");
String cuenta = request.getParameter("txtcuenta");



 int filas = datos.movimientoporcuenta(fechainicial,fechafinal,cuenta);
  
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Encontrada");
     
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
