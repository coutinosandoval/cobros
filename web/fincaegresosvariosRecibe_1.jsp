<%-- 
    Document   : fincaegresosvariosRecibe
    Created on : 22/01/2016, 10:49:14 AM
    Author     : dcoutino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1></h1>
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />   
        
        <h1></h1>
        
     <%
            
     // int filas = 1;
        {
try
{   
    
String fecha = request.getParameter("fecha");
String factura = request.getParameter("txtfactura");
String proveedor = request.getParameter("txtproveedor");     
String descripcion = request.getParameter("txtdescripcion"); 
String cantidad = request.getParameter("txtcantidad");
String finca = request.getParameter("txtfinca");

fecha = "15/01/2016";
factura = "12";
proveedor = "deluc";     
descripcion = "txtdescripcion"; 
cantidad ="25";
 finca = "txtfinca";

int filas = datos.agregaegresosvariosfincas(fecha,factura,proveedor,descripcion,cantidad,finca);

 if (filas ==1 )
        {
     %>
    
     
     
    <script>alert("Informacion Almacenada");
     
    window.location.href='fincaegresosvarios.html';

     </script> 
     <%
         
 }//if filas                   
  
 
         
}//try                     
      
catch (Exception e)
        {
    out.println("Error  "+ e.getMessage());
    
}//fin catch
}   //if            
            
  
        
        
        %>
        
    </body>
</html>
