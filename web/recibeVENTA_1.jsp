<%-- 
    Document   : recibeFACTURA
    Created on : 15-sep-2014, 19:19:27
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>datos</title>
    </head>
    <body>
        <h1></h1>
       <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
        
        
        <%
            
       
try
{   
String codigoP = request.getParameter("txtcodigoproducto");
String cantidadP = request.getParameter("txtcantidad");
String nitP = request.getParameter("nits");
String facturacompra = request.getParameter("facturacompra");
String fechacompra = request.getParameter("fechacompras");
String usuario = request.getParameter("txtusuario");
String precioventa = request.getParameter("txtprecioventa");

if (precioventa.equals(""))
{
    precioventa="0";
}
   
                     
 //int filas = datos.agregartablatemporal(codigoP,cantidadP,ubicacionP,
   //    nitP,facturacompra,fechacompra,fechavencimientoP,grupoP,preciocompra);
 int filas = datos.agregartablaventastemporal(codigoP,cantidadP,nitP,
         facturacompra,fechacompra,usuario,precioventa);
 
 //codigoP,cantidadP,fechacompra,facturacompra,nitP
     

 if (filas ==1 )
        {
     %>
  <jsp:forward page="ventas.jsp"/>
    
     <%   
         
 }//if filas                   
  else 
           {%>
     <center>
         <h2><font color="#00d10">EL CODIGO <%=codigoP%> NO EXISTE AGREGUELO</font></h2> 
        <% }//else
 
  
         
}//try                     
      
catch (Exception e)
        {
    out.println("Error  "+ e.getMessage());
    
}//fin catch
        
        
        
  
        
        
        %>
    
    </body>
</html>
