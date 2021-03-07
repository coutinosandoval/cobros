<%-- 
    Document   : comprasrealizadasRECIBE
    Created on : 28/02/2016, 11:50:44 AM
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
            
      
        {
try
{   
String fecha1= request.getParameter("fechainicio");
String fecha2= request.getParameter("fechafinal");

int filas = datos.llenacomprasresumentemporal(fecha1,fecha2);
 //int filas = datos.borratemporals(nit,factura); 
 if (filas ==1 )
        {
     %>
         
    <script>;
     
    window.location.href='comprasrealizadas.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("No hay Informacion en este periodo");
     
    window.location.href='comprasrealizadas.jsp';

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
