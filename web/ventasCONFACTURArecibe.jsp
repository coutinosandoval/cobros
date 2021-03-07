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
            
        if(request.getParameter("txtcodigoproducto") != null)
        { 
try
{   
String codigoP = request.getParameter("txtcodigoproducto");
String cantidadP = request.getParameter("txtcantidad");
String grupoP = request.getParameter("txtcodgrupoproducto");
String ubicacionP = request.getParameter("txtbodega");
//String fechavencimientoP = request.getParameter("fecha");
String fechavencimientoP = "01/01/2015";
String nitP = request.getParameter("nits");
String facturacompra = request.getParameter("facturacompra");
String fechacompra = request.getParameter("fechacompras");
String preciocompra = request.getParameter("txtpreciocompra");
//String precioventa=request.getParameter("txtprecioventa");
String precioventa = request.getParameter("txtprecioventa");
String nombrecliente=request.getParameter("proveedor");


 
                     
 //int filas = datos.agregartablatemporal(codigoP,cantidadP,ubicacionP,
   //    nitP,facturacompra,fechacompra,fechavencimientoP,grupoP,preciocompra);
 int filas = datos.agregartablatemporal1(codigoP,cantidadP,ubicacionP,grupoP,fechavencimientoP,
         preciocompra,precioventa,fechacompra,facturacompra,nitP,nombrecliente
         );
 
 
     

 if (filas ==1 )
        {
     %>
  <jsp:forward page="comprasCONFACTURA.jsp"/>
    
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
}   //if            
        
        
  
        
        
        %>
    
    </body>
</html>
