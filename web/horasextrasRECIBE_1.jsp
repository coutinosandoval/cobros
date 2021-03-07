<%-- 
    Document   : horasextrasRECIBE
    Created on : 10/11/2015, 11:44:56 PM
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
     <%
            
        if(request.getParameter("txthoras") != null)
        {
try
{   
String finca = request.getParameter("txthoras");
String fecha = request.getParameter("txtfecha");
datos.borraplanillasub();
 int filas = datos.llenaplanillasub(finca,fecha);
        
 
 if (filas ==1 )
        {
     %>
         
    <script> alert("Informacion Almacenada");
     
    window.location.href='horasextras.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Codigo de Trabajo ya Existe");
     
    window.location.href='horasextras.jsp';

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
