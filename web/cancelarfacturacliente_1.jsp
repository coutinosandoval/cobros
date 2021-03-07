<%-- 
    Document   : cancelarfacturacliente
    Created on : 29/02/2016, 11:35:53 AM
    Author     : dcoutino

    en esta pagina, se recibe un numero de factura, en la cual, alguna que 
    este o halla sido compra al credito, esta modifica a cancelada
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
            
       String factura = request.getParameter("factura");
try
{   


 int filas = datos.cancelafacturacliente(factura);
// String bandera ="verdadero";      
 
 %>
    
     <%
 if (filas ==1 )
        {
     %>
         
    <script>alert("Factura Acredidata con Exito");
     
    window.location.href='index.html';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Ha ocurrido un error");
     
    window.location.href='index.html';

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
