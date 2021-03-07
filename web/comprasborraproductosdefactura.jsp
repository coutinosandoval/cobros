<%-- 
    Document   : comprasborraproductosdefactura.jsp
    Created on : 8/05/2017, 04:24:33 PM
    Author     : Dcoutino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <%-- 
    ESTA PAGINA RECIBE INFORMACION DE LA PAGINA comprasCONFACTURA, cantidad y numero de factura
    para ser eliminada, cuando asi lo haga el usuario, esto es, por si el operador se equivoco cuando 
        ingresaba la compra
--%>
        
        <h1>      bienvenidos     
</h1>
<jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
       
              
        <%
     out.println("paginas");
       
try
{   


 int filas = datos.borrainformaciondefacturadecompras(request.getParameter("cantidad"));
      
 
 %>
    
     <%

 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Borrada");
     
    window.location.href='comprasCONFACTURA.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("request.getParameter");
     
    window.location.href='comprasCONFACTURA.jsp';

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
