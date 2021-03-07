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


 int filas = datos.crearroles(rol);
        
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Rol Creado");
     
    window.location.href='rolessnuevos.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Rol ya Existe");
     
    window.location.href='rolessnuevos.jsp';

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
