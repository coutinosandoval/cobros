<%-- 
    Document   : user_rolesRECIBE
    Created on : 27/04/2016, 02:37:46 PM
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
     <%
            
        if(request.getParameter("txtrol") != null)
        {
try
{   
String rol = request.getParameter("txtrol");
String usuario = request.getParameter("txtuser");



 int filas = datos.agregarolesausuario(rol,usuario);
        
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='user_roles.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Usuario  ya Tiene Asignado dicho Rol");
     
    window.location.href='user_roles.jsp';

     </script> 
        <% }//else
 
         
}//try                     
      
catch (Exception e)
        {
    out.println("Error  "+ e.getMessage());
    
}//fin catch
}   //if            
        
        
  
        
        
        %>
      
 
        <h1>Hello World!</h1>
        
        
    </body>
</html>
