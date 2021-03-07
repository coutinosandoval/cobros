<%-- 
    Document   : consultapreciosrecibe
    Created on : 14-oct-2014, 11:57:44
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
            
        if(request.getParameter("txtcodigoproducto") != null)
        {
try
{   
String codproducto = request.getParameter("txtcodigoproducto");
String descripcion = request.getParameter("txtdescripcion");


int filas = datos.insertarpreciosconsulta(codproducto,descripcion);

  
 
 if (filas >=1 )
        {
     %>
     
     
    <script>
     
    window.location.href='consultaprecioss.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("NO HAY PRODUCTOS EN ESTA BODEGA");
     
    window.location.href='consultaprecioss.jsp';

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
