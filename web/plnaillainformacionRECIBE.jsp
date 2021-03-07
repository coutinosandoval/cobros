<%-- 
    Document   : plnaillainformacionRECIBE
    Created on : 23/11/2015, 05:30:31 PM
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
     <%
            
        if(request.getParameter("codigo") != null)
        {
try
{   
String codigoempleado = request.getParameter("codigo");
String finca = request.getParameter("txtfinca");
String horasextras = request.getParameter("txthorasextras");
String diasfaltados = request.getParameter("txtdiasfaltados");
String fecha = request.getParameter("txtfecha");

 int filas = datos.llenaplanilla(codigoempleado,finca,horasextras,diasfaltados,fecha);
        
 
 if (filas ==1 )
        {
            datos.borraplanillasub(codigoempleado);
    %>
      
    <script>alert("Informacion Almacenada");
     
    window.location.href='horasextras.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Algo Salio Mal Revise la informacion");
     
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
