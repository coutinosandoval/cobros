<%-- 
    Document   : proveedores_RECIBE
    Created on : 08-sep-2014, 8:44:59
    Author     : Administrador
--%>
<%@page import="pconexion.conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
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
            
        if(request.getParameter("txtcodigo") != null)
        {
try
{   
String nitP = request.getParameter("txtcodigo");
String nombreP = request.getParameter("txtnombrecliente");
String direccionP = request.getParameter("txtdireccioncliente");
String telefonoP = request.getParameter("txttelefono");
//String codigoempleado = request.getParameter("txtcodigoempleado");
//String facturaventa = request.getParameter("txtfacturaventa");
//String facturaventa ="250";
 //int filas = datos.agregaclientenuevo(nitP,nombreP,direccionP,telefonoP,
  //       codigoempleado,facturaventa);
 
 int filas = datos.agregacolaboradores(nitP,nombreP,direccionP,telefonoP);
 
// String bandera ="verdadero";      
 
 %>
    
     <%
 if (filas ==1 )
        {
     %>
         
    <script>alert("Informacion Almacenada");
     
    window.location.href='indexORIGINAL.html';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Nit de Cliente ya Existe");
     
    window.location.href='clientesingresos.html';

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
