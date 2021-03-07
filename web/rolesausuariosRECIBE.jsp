<%-- 
    Document   : empleadosnuevosRECIBE
    Created on : 10/11/2015, 11:14:02 AM
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
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
     <%
            
        if(request.getParameter("txtrol") != null)
        {
try
{   
String rol = request.getParameter("txtrol");
String usuario = request.getParameter("txtpagina");



 //int filas = datos.agregaroles_a_usuarios(rol,usuario);
 int filas = datos.agregarolesausuario(rol,usuario);
        
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='rolesausuarios.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Usuarios ya Tiene Asignado el Rol");
     
    window.location.href='rolesausuarios.jsp';

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
