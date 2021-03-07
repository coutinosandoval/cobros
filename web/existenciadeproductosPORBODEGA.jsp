<%-- 
    Document   : existenciadeproductosPORBODEGA
    Created on : 29/03/2016, 04:21:19 PM
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
        <h1>Hello World!</h1>
        
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
        
        
        <%
            
       
try
{   
//String bodega = request.getParameter("txtbodega");
String bodega="SERVIDORES";

 int filas = datos.existenciasproductosporbodega(bodega);
  
 
 if (filas ==1 )
        {
     %>
         
    <script>;
     
    window.location.href='existenciasporbodegas.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("No hay existencias");
     
    window.location.href='existenciasporbodegas.jsp';

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
