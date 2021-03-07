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
            
        if(request.getParameter("txtuser") != null)
        {
try
{   
String usuario = request.getParameter("txtuser");
String apellido1 = request.getParameter("txtprimerapellido");
String apellido2 = request.getParameter("txtsegundoapellido");
String nombre1 = request.getParameter("txtsegundonombre");
String nombre2 = request.getParameter("txtsegundonombre");
String clave = request.getParameter("txtclave");


 int filas = datos.agregausuarios(usuario,clave,nombre1,
         nombre2,apellido1,apellido2);
        
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Usuario Creado");
     
    window.location.href='empleadonuevo.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Usuario ya Existe");
     
    window.location.href='empleadonuevo.jsp';

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
