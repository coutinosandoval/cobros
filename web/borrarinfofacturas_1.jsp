<%-- 
    Document   : borrarinfofacturas
    Created on : 29-sep-2014, 20:35:40
    Author     : Administrador
--%>
<%@page import="pconexion.listatablatemporal"%>
<%@page import="pconexion.grupoproductos"%>
<%@page import="pconexion.grupobodegas"%>
<%@page import="pconexion.depto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Collection"%>
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
       
        
        
        <%
            
      
        {
try
{   
 String nit = request.getParameter("nits");
String factura = request.getParameter("facturacompra"); 
//String finca1 = request.getParameter("codfinca1"); 
//String finca2 = request.getParameter("codfinca2"); 
//String gastofinca1 = request.getParameter("txtfincauno"); 
//String gastofinca2 = request.getParameter("txtfincados"); 
String fecha = request.getParameter("fechacompras"); 
String tipocompra = request.getParameter("tipocompra"); 
    
//int filass = datos.borratemporal(nit,factura);
int filas = datos.borrartemporal(nit,factura,fecha,tipocompra);
 //int filas = datos.borratemporals(nit,factura); 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='index.html';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Informacion NO  Almacenada");
     
    window.location.href='index.html';

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
