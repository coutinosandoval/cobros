<%-- 
    Document   : fincasRecibe
    Created on : 18/08/2015, 09:26:59 AM
    Author     : Administrador
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>recibe fincas</title>
    </head>
    <body>
        
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
        
        
        <%
            
        if(request.getParameter("txtcodigofinca") != null)
        {
try
{   
//String codigos = "codigo" ; //request.getParameter("txtcodigofinca");
//String nombres = "nombre"; //request.getParameter("txtnombrefinca");


 int filas = datos.altasfincas(request.getParameter("txtcodigofinca"), request.getParameter("txtnombrefinca"));
  
 //int  filas=2;
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='fincasingreso.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Codigo de Finca ya Existe");
     
    window.location.href='fincasingreso.jsp';

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
