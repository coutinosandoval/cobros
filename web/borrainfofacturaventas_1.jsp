<%-- 
    Document   : borrainfofacturaventas
    Created on : 4/02/2016, 03:24:58 PM
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
            
      
        {
try
{   
 String nit = request.getParameter("nits");
String factura = request.getParameter("facturacompra"); 
//String fecha = request.getParameter("fechacompras"); 
String usuario = request.getParameter("txtuser"); 
String tipoventa = request.getParameter("txttipoventa"); 

int filas =datos.borraventastemporals(nit,factura,usuario,tipoventa);
//int filas = datos.borratemporals(nit,factura); 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='index.html';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Informacion NO  Almacenada");
     
    window.location.href='index.html';

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
