<%-- 
    Document   : empleadosmodificacionstatusrecibe
    Created on : 21/01/2016, 09:00:23 AM
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
            
        if(request.getParameter("codigocodigo") != null)
        {
try
{   
String codigo = request.getParameter("codigocodigo");
String status = request.getParameter("status");


 int filas = datos.actualizastatusempleado(codigo,status);
        
 filas=1;
 if (filas ==1 )
        {
     %>
         
    <script>alert("Empleado Fue Actualizado Exitosamente");
     
    window.location.href='empleadosstatus.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("NO SE PUDO ACTUALIZAR EL EMPLEADO");
     
    window.location.href='empleadosstatus.jsp';

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
