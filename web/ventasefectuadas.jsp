<%-- 
    Document   : kardexconsultas
    Created on : 21/09/2015, 10:32:39 PM
    Author     : Administrador
--%>

<%@page import="pconexion.listaventa"%>
<%@page import="pconexion.listaventas"%>
<%@page import="java.text.DecimalFormat" %>
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
        <title>Compras</title>
        
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
        <h1>Ventas Efectuadas</h1>
        
 <form name="frmkardex" action="ventasefectuadasRECIBE.jsp" method="POST">
         
        Fecha de Inicio:<input required="true" type="text" name="fechainicio" class="campofechainicio" maxlength="10" size="10">    
        Fecha de Fin <input required="true" type="text" name="fechafinal" class="campofechafin" maxlength="10" size="10">    
          
          <br></br>
            <input type="submit" value="Consultar" name="btnconsultar" />
        
        </form>
        
        
        <BR/><a href="indexORIGINAL.html">INICIO</a>
        <BR/><a href="ReportesKardex.jsp">Imprimir Reportes</a>
        
        <br></br>
        
        
    <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
       DecimalFormat df = new DecimalFormat("0.00"); 
     datos.proveedores();
     float total =0;
      LinkedList <listaventas> ventas = datos.listaventas(); 
      datos.borratablaventasresumentemporal();
// LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
     // datos.borratablakardex();
     
              
   
  
  
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="200">Nit</td>    
                <td WIDTH="300">Cliente </td> 
                <td WIDTH="110">Factura </td>    
                <td WIDTH="110">Fecha de Venta</td>    
                <td WIDTH="140">Tipo de Venta </td> 
                <td WIDTH="90">Usuario </td> 
                <td align="right" WIDTH="70">Total de Venta </td>  
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
if (ventas.size()>=0){
   
      for (int i=0;i<ventas.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+ventas.get(i).getnit()+"</td>");
   out.println("<td>"+ventas.get(i).getproveedor()+"</td>");
   out.println("<td>"+ventas.get(i).getfactura() +"</td>");
   out.println("<td>"+ventas.get(i).getfecha() +"</td>");
   out.println("<td>"+ventas.get(i).gettipoventa() +"</td>");
   out.println("<td>"+ventas.get(i).getusuario() +"</td>");
   out.println("<td align=right>"+(df.format(ventas.get(i).gettotalventa()))+"</td>");
   total=total + ventas.get(i).gettotalventa();
   out.println("</tr>");
}//for
       out.println("<td>"+ "" +"</td>"); 
       out.println("<td>"+ "" +"</td>"); 
       out.println("<td>"+ "" +"</td>"); 
       out.println("<td>"+ "" +"</td>"); 
       out.println("<td>"+ "" +"</td>"); 
       out.println("<td>"+ "" +"</td>"); 
      out.println("<td>"+total +"</td>"); 

      
}

 

%>       
     
 
           </table>  


        
    </body>
</html>
