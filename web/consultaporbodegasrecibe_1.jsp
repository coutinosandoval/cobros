<%-- 
    Document   : consultaporbodegasrecibe
    Created on : 19-oct-2014, 10:21:59
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1></h1>
       <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
        
        
        <%
            
        if(request.getParameter("txtbodega") != null)
        {
try
{   
String bodega = request.getParameter("txtbodega");



 int filas = datos.buscaexistenciasporbodega(bodega);
  
 
 if (filas >=1 )
        {
     %>
     
     
    <script>
     
    window.location.href='consultaporbodegas.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("NO HAY PRODUCTOS EN ESTA BODEGA");
     
    window.location.href='bodegaENVIA.html';

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
