<%-- 
    Document   : proveedoresdatosrecibe
    Created on : 19/01/2016, 08:37:07 PM
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
            
        if(request.getParameter("txtnombreproveedor") != null)
        {
try
{   
String proveedor =request.getParameter("txtnombreproveedor");


 int filas = datos.llenainfoproveedores(proveedor);
 
 
 if (filas ==1 )
        {
     %>
         
    <script>;
     
    window.location.href='proveedoresdatos.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("No se realizo el traslado REVISE los DATOS");
     
    window.location.href='proveedoresdatos.jsp';

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
