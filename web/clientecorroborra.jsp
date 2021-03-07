<%-- 
    Document   : clientecorroborra
    Created on : 10/02/2016, 11:56:52 AM
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
        <h1>Hello World!</h1>
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
  <%      
        try
{   
String nit = request.getParameter("txtnitcliente");
String factura = request.getParameter("txtfacturadeventa");
String usuario = request.getParameter("txtcodigovendedor");


 int filas = datos.buscacliente(nit, factura, usuario);
        
//filas =3;
 
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion AlmacenadaS");
     
    window.location.href='ventas.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Informacion no almacenada");
     
    window.location.href='clientesingresos.html';

     </script> 
        <% }//else
 
 
         
}//try                     
      
catch (Exception e)
        {
    out.println("Error  "+ e.getMessage());
    
}//fin catch
        
 %>       
    </body>
</html>
