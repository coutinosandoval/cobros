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
            
        if(request.getParameter("fecha") != null)
        {
try
{   
String fecha = request.getParameter("fecha");
String recibo = request.getParameter("txtfactura");
String cantidad = request.getParameter("txtcantidad");
String nonmbre = request.getParameter("txtcliente");



 int filas = datos.agregaabonosclientes(
         fecha,recibo,cantidad,nonmbre);
 //window.location.href='abonosclientes.html';
  
 //int recibocliente=datos.llenatablaimpresionreciboclientes(fecha,recibo,cantidad,nonmbre);
 if ((filas ==1)  )
     //&& (recibocliente ==1)
        {
     %>
       
    <script>alert("Informacion Almacenada");
        //se envia a pagina del reporte para impresion de recibo del cliente que ha abonado
       // window.location.href='recibo.jsp'; 
       window.location.href='abonosclientes.html'; 
    

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Informacion no almacenada");
     
    window.location.href='abonosclientes.html';

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
