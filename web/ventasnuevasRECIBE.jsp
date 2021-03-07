<%-- 
    Document   : proveedorescorrobora
    Created on : 07-oct-2014, 12:20:12
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
        <h1>Hello World!</h1>
        
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
       <%
            
        if(request.getParameter("txtnitcliente") != null)
        {
try
{   
String nit = request.getParameter("txtnitcliente");
String factura = request.getParameter("txtfacturadeventa");
//String fecha = request.getParameter("fecha");
String fecha ="08/02/2016";
String usuario = request.getParameter("txtcodigovendedor");


 int filas = datos.buscacliente(nit, factura, usuario);
        
 
 
 
 // PREGUNTA SI EL NIT QUE SE ENVIO SEGUN LA FACTURA DE COMPRA
 // YA EXISTE, ENTONCES SE ENVIA A LA PAGINA DECOMPRAS, 
 // EN CASO CONTRARIO SE DEBE ENVIAR A LA PAGINA DE INGRESO DE PROVEEDORES
 // esto va abajo de if  <jsp:forward page="comprasCONFACTURA.jsp"/>
 //esto va abajo de else   <jsp:forward page="ingresoPROVEEDORES.html"/>
 
 if (filas ==1 )
        {
     %>
     
    <%-- 
     <center>
          
     <h2><font color="#00d10">SE GRAVO, Y VALORDE FILAS ES   <%=filas%>  YA EXISTE</font></h2> 
     
--%>
        <jsp:forward page="ventas.jsp"/>
    
          <%
         
 }//if filas                   
  else 
           {%>
          <jsp:forward page="clientesingresos.html"/> 
       <%--        
     <center>
         <h2><font color="#00d10"> NO SE GRAVO Y VALOR DE FILAS ES   <%=filas%>  </font></h2> 
--%>


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
