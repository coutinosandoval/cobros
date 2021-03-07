<%-- 
    Document   : fincaegresosRECIBE
    Created on : 22/01/2016, 11:42:13 AM
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
            
        if(request.getParameter("fecha") != null)
        {
try
{   
String fecha = request.getParameter("fecha");
String factura = request.getParameter("txtfactura");
String proveedor = request.getParameter("txtproveedor");
String descripcion = request.getParameter("txtdescripcion");
String cantidad = request.getParameter("txtcantidad");
String finca = request.getParameter("txtfinca");


 int filas = datos.agregaingresosfincas(
         fecha,factura,proveedor,descripcion,cantidad,finca);
  
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='fincaegresosvarios.html';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Informacion no almacenada");
     
    window.location.href='fincaegresosvarios.html';

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
