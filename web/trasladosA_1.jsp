<%-- 
    Document   : traslados
    Created on : 30-sep-2014, 13:33:59
    Author     : Administrador
--%>
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
        <title>traslados</title>
        
   <link href="calendario_dw/calendario_dw-estilos.css" type="text/css" rel="STYLESHEET">
   <style type="text/css">    
   
   body{
      font-family: tahoma, verdana, sans-serif;
   }
   </style>
   <script type="text/javascript" src="calendario_dw/jquery-1.4.4.min.js"></script>
   <script type="text/javascript" src="calendario_dw/calendario_dw.js"></script>
   
   <script type="text/javascript">
       
    
   // <script type="text/javascript" src="js/jquery.columnhover.js"></script>
   <script type="text/javascript" src="js/jquery.columnhover.pack.js"></script>
   <script type="text/javascript" src="js/jquery.tablesorter.js"></script>
   <script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
   
   <script type="text/javascript"> 
       
   $(document).ready(function(){
      $(".campofecha") .calendarioDW();
      
      //validar numero entero
      
      $('#trasladar').click(function() {
        if ($('#txtcantidad').val()<0 ||  isNaN($('#txtcantidad').val())) {
            $('#txtcantidad').css('border-color','#FF0000');
            alert('El número esta fuera del rango o no es un numero');
            return false;
        }
       
    });
   })
   </script>      
        
    </head>
    <body>
        <h1>Traslados de Mercaderia</h1>
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
         <%
     
     datos.proveedores();
       
      LinkedList <grupobodegas> listabodegas = datos.grupoBodegas();
     
        %>
    
        <form name="frmtraslados" action="trasladosRecibe.jsp" method="POST">
          </BR>  Codigo Empleado:<input type="text"  name="txtcodigoempleado"  value="" />
          No. de Vale:<input type="text"  name="txtvale"  value="" />
          </BR> Codigo del Producto a Trasladar:<input type="text" name="txtcodigoproducto" value="" />
       
      Bodega Origen<select  id ="cbobodega" name="cbobodega" onchange="document.frmtraslados.txtbodegaorigen.value=document.frmtraslados.cbobodega.options[frmtraslados.cbobodega.selectedIndex].text;">
    <option value="0" selected>...Seleccione la bodega Origen...</option>    
    <%
for (int m=0;m<listabodegas.size();m++)
{
 %>
 <option value="<%=m%>"><%=listabodegas.get(m).getsetdescripcion()%></option>

<%                   
}
%>  
  </select>   
      Bodega Destino:<select  id ="cbobodegas" name="cbobodegas" onchange="document.frmtraslados.txtbodegadestino.value=document.frmtraslados.cbobodegas.options[frmtraslados.cbobodegas.selectedIndex].text;">
    <option value="0" selected>...Seleccione la bodega Destino...</option>    
    <%
for (int m=0;m<listabodegas.size();m++)
{
 %>
 <option value="<%=m%>"><%=listabodegas.get(m).getsetdescripcion()%></option>

<%                   
}
%>  
  </select>
          </BR> Cantidad a Trasladar:<input type="text" maxlength="5"  id="txtcantidad"  name="txtcantidad" value="" size="5" />
        </BR>Fecha:<input  type="text" name="fecha" class="campofecha" maxlength="10" size="10">
    
        <input type="text" id="txtbodegas" hidden ="true"  name="txtbodegaorigen"  value=""  />
        <input type="text" id="txtbodega" hidden ="true" name="txtbodegadestino"  value="" />
       
        <input type="submit" value="Trasladar" id="trasladar" name ="trasladar" />
        </form> 
        
    <BR/><a href="index1.html">INICIO</a>     
    </body>
</html>
