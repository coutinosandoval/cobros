<%-- 
    Document   : fincaingresosRECIBE
    Created on : 22/01/2016, 12:00:43 PM
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
            
        if(request.getParameter("txtcuenta") != null)
        {
try
{   

String cuenta = request.getParameter("txtcuenta");
String nombre = request.getParameter("txtnombrecuenta");
String banco = request.getParameter("txtbanco");

//cuenta="12";
//nombre="datos";
//banco = "banco";

 int filas = datos.agregacuentas(cuenta, nombre, banco);
  
 //filas =1;
 if (filas ==1 )
        {
     %>
         
    <script>alert("Cuenta Almacenada");
     
    window.location.href='indexORIGINAL.html';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Informacion no almacenada");
     
    window.location.href='indexORIGINAL.html';

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
