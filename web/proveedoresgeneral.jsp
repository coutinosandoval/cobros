<%-- 
    Document   : kardexconsultas
    Created on : 21/09/2015, 10:32:39 PM
    Author     : Administrador
--%>

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
        <BR/><a href="ReportesKardex.jsp">Imprimir Reportes</a>
        
        <br></br>
        
        
    <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
       DecimalFormat format = new DecimalFormat("0.00");
      // String tabla ="montocompra";
       
     datos.proveedores();
     LinkedList <mostraracreedoresgeneral> acreedores = datos.mostraracreedoresgeneral();
     
      LinkedList <mostrarsaldosproveedoresgeneral> mostraracreedoresgeneral = datos.mostrarsaldosproveedoresgeneral(); 
    //  datos.mostraracreedoresgeneral();
     
              
      
   //   float totales = datos.preciototal();
  //   int k = kardex.size();
     double totales=0.00;
  //   DecimalFormat format = new DecimalFormat("0.00");
  
 
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="100">Nit</td> 
                <td WIDTH="180">Proveedor  </td> 
                <td WIDTH="100">Factura de Compra</td> 
                <td WIDTH="100">Fecha de Compra</td> 
                <td WIDTH="100">Valor Factura</td>    
                <td WIDTH="180">Modificar Status Factura</td>   
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

   
      for (int i=0;i<mostraracreedoresgeneral.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+mostraracreedoresgeneral.get(i).getnit() +"</td>");
   out.println("<td>"+mostraracreedoresgeneral.get(i).getnombrecliente() +"</td>");
   out.println("<td>"+mostraracreedoresgeneral.get(i).getfactura() +"</td>");
   out.println("<td>"+mostraracreedoresgeneral.get(i).getfecha() +"</td>");
   out.println("<td>"+(format.format(mostraracreedoresgeneral.get(i).getcantidad())) +"</td>");
   totales = totales + mostraracreedoresgeneral.get(i).getcantidad();
    out.println("<td>" + "<a href=cancelarfacturaproveedor.jsp?factura="+ mostraracreedoresgeneral.get(i).getfactura() +">"+"Cancelar Factura"+"</a>"+"</td>");
   
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
