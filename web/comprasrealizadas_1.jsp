<%-- 
    Document   : kardexconsultas
    Created on : 21/09/2015, 10:32:39 PM
    Author     : Administrador
--%>

<%@page import="pconexion.listacompras"%>
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
        <h1>Compras Efectuadas</h1>
        
 <form name="frmkardex" action="comprasrealizadasRECIBE.jsp" method="POST">
         
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
      float total =0;
       
       DecimalFormat df = new DecimalFormat("0.00"); 
     datos.proveedores();
      
      LinkedList <listacompras> compras = datos.listacompras(); 
     // LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
      datos.borratablacomprasresumentemporal();
     
              
   
  
  
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="40">Nit</td>    
                <td WIDTH="240">Proveedor </td> 
                <td WIDTH="110">Factura </td>    
                <td WIDTH="110">Fecha de Compra</td>    
                <td align="right" WIDTH="70">Total de Compra</td>    
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

   
      for (int i=0;i<compras.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+compras.get(i).getnitproveedor()+"</td>");
   out.println("<td>"+compras.get(i).getproveedor()+"</td>");
   out.println("<td>"+compras.get(i).getfacturacompra() +"</td>");
   out.println("<td>"+compras.get(i).getfechacompra() +"</td>");
   out.println("<td align=right>"+(df.format(compras.get(i).gettotalcompra()))+"</td>");
   total = total + compras.get(i).gettotalcompra();
   
   out.println("</tr>");
}//for
      
      out.println("<td>"+ "" +"</td>"); 
       out.println("<td>"+ "" +"</td>"); 
       out.println("<td>"+ "" +"</td>"); 
       out.println("<td>"+ "" +"</td>"); 
       out.println("<td align=right>"+(df.format(total )) +"</td>"); 

%>       
          
 
           </table>  


        
    </body>
</html>
