<%-- 
    Document   : existenciasporproductosRECIBE
    Created on : 1/03/2016, 04:00:25 PM
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
            
       
try
{   
String bodega = request.getParameter("txtproducto");
//String producto="TIENDA";

 //int filas = datos.existenciasproductos(producto);
 //int filas = datos.existenciasproductosporbodega(producto);
//int filas = datos.existenciasproductosbodegas(bodega);
datos.borratablaexistenciaproductosporbodega();
  int filas = datos.existebodega(bodega);

 if (filas ==1 )
        {
     %>
         
    <script>
     
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
