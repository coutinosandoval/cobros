<%-- 
    Document   : trasladosRecibefarmacias
    Created on : 3/12/2014, 08:41:25 PM
    Author     : Administrador
--%>
<%@page import="pconexion.conexion"%>
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
   // SE TOMAPO txtmedicamento PARA ENVIARLO, Y LUEGO OBTENER EL CODIGO REAL DEL PRODUCTO         
        if(request.getParameter("txtmedicamento") != null)
        {
try
{   


String codigoproducto = request.getParameter("txtcodigomedicamento");
String cantidad= request.getParameter("txtcantidadsolicitada");
String factura_compra = request.getParameter("txtfactura");

//String bdorigen =request.getParameter("txtbodegaorigen");
//String bdestino =request.getParameter("txtbodegadestino");
//String fechatraslado =request.getParameter("fecha");
//String grupo =request.getParameter("txtgrupo");
 String codempleado =request.getParameter("txtcodigoempleado");

 String bdorigen = "FARMACIA";
 String bdestino = "VENTAS";
 
String codempleados= "003";
 String vale ="90";
 //int solicituds = 100;
 String codigoproductoss = "123";
 String tiempos = "23:00";
 String fechatraslado = "04-12-14";
 String grupo = "FARMACIA";
 String usuario = "DEMSSHILL";
 



//(String codigoproductos, String cantidadtraslado,
//            String bodegaorigen,String bodegadestino, String codempleado, String camas,
//            String fechas, String grupos)

 //int filas = datos.trasladosfarmaciaventas(codigo,candidad,bdorigen,bdestino,codempleado,vale,fechatraslado,grupo);
 //int filas2 = datos.inventas(codigo,candidad,usuario);
 
 //ESTA LINEA SE USA SOLO PARA PRUEBAS
 int filas = datos.ventasfarmacia(codigoproducto,cantidad);
 int filas2 = datos.inventas(codigoproducto,cantidad,usuario,factura_compra);
 
 
 if (filas ==1 )
        {
    
        %>
         
    <script>
     
    window.location.href='farmacia.jsp';

     </script> 
     <%
        
 }//if filas                   
  else 
           {%>
    <script>alert("NO HAY SUFICIENTE PRODUCTO " );
     
    window.location.href='farmacia.jsp';

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
