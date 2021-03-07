<%-- 
    Document   : kardexconsultas
    Created on : 21/09/2015, 10:32:39 PM
    Author     : Administrador
--%>

<%@page import="pconexion.mostrarsaldosclientesgeneral"%>
<%@page import="pconexion.mostrarsaldosproveedoresgeneral"%>
<%@page import="pconexion.mostraracreedoresgeneral"%>
<%@page import="pconexion.listakardex"%>
<%@page import="pconexion.listafincas"%>
<%@page import="java.text.DecimalFormat" %>
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
        <title>acreedores</title>
        
 <link href="calendario_dw/calendario_dw-estilos.css" type="text/css" rel="STYLESHEET">
   <style type="text/css">
   body{
      font-family: tahoma, verdana, sans-serif;
   }
   </style>
   <script type="text/javascript" src="calendario_dw/jquery-1.4.4.min.js"></script>
   <script type="text/javascript" src="calendario_dw/calendario_dw.js"></script>
   
   <script type="text/javascript">
   $(document).ready(function(){
      $(".campofechainicio") .calendarioDW();
      
      //validar numero entero
      
       $(".campofechafin") .calendarioDW();
        
   })
   </script>

<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery.autocomplete.js"></script>
<script language="javascript" type="text/javascript">

jQuery(function(){
$("#txtcodigoproducto").autocomplete("reg_update.jsp");
});

jQuery(function(){
$("#txtubicacion").autocomplete("reg_update_bodegas.jsp");
});
</script>
   
      
        
    </head>
    <body>
        <h1>Lista de Acreedores!</h1>
        
        
        <BR/><a href="indexORIGINAL.html">INICIO</a>
        
        
   <%-- 
    <BR/><a href="ReportesKardex.jsp">Imprimir Reportes</a>
--%>
        
        
        
        
        <br></br>
        
        
    <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
       DecimalFormat format = new DecimalFormat("0.00");
       
     datos.proveedores();
            
      
   //   float totales = datos.preciototal();
  //   int k = kardex.size();
     double totales=0.00;
  
 
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="100">Nit</td> 
                <td WIDTH="180">Cliente  </td> 
                <td WIDTH="100">No. Credito</td> 
                <td WIDTH="100">Fecha de Credito</td> 
                <td WIDTH="100">Valor Credito</td>    
                <td WIDTH="180">Modificar Status Credito</td>    
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
     LinkedList <mostraracreedoresgeneral> acreedores =datos.mostraracreedoresgeneral();
    
   LinkedList <mostrarsaldosclientesgeneral> clientes = datos.mostrarsaldosclientes();
     
      for (int i=0;i<clientes.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+clientes.get(i).getnit() +"</td>");
   out.println("<td>"+clientes.get(i).getnombrecliente() +"</td>");
   out.println("<td>"+clientes.get(i).getfactura() +"</td>");
   out.println("<td>"+clientes.get(i).getfecha() +"</td>");
   out.println("<td>"+(format.format(clientes.get(i).getcantidad())) +"</td>");
   totales = totales + clientes.get(i).getcantidad();
    out.println("<td>" + "<a href=cancelarfacturacliente.jsp?factura="+ clientes.get(i).getfactura() +">"+"Cancelar Credito"+"</a>"+"</td>");
   
   out.println("</tr>");
}//for
   out.println("<td>"+""+ "</td>");
   out.println("<td>"+""+ "</td>");
   out.println("<td>"+""+ "</td>");
   out.println("<td>"+""+ "</td>");
    out.println("<td>"+(format.format(totales)) +"</td>");
%>       
     
 
           </table>  


        
    </body>
</html>
