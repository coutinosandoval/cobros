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
   $(document).ready(function(){
      $(".campofecha") .calendarioDW();
      
      //validar numero entero
      
       $(".campofechafin") .calendarioDW();
        
   })
   </script>

<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery.autocomplete.js"></script>
<script language="javascript" type="text/javascript">

jQuery(function(){
$("#txtcodigoproducto").autocomplete("reg_muestra_lista_productos.jsp");
});
</script>
   
      
 
        
    </head>
    <body>
        <h1>Egresos de Mercaderia</h1>
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
         <%
     
     datos.proveedores();
       
      LinkedList <grupobodegas> listabodegas = datos.grupoBodegas();
     
        %>
    
        <form name="frmtraslados" action="trasladosRecibe.jsp" method="POST">
          </BR> 
          Fecha:<input  type="text" name="fecha" class="campofecha" maxlength="10" size="10">
          Codigo Empleado:<input type="text"  name="txtcodigoempleado"  value="" maxlength="5" size="5" />
          No. de Documento<input type="text"  name="txtvale"  value="" maxlength="5" size="5" />
          Producto de Salida:<input id="txtcodigoproducto" type="text" name="txtcodigoproducto" value="" maxlength="60" size="60" />
     <BR/>  </BR> 
      Ubicacion: <select  id ="cbobodega" name="cbobodega" onchange="document.frmtraslados.txtbodegaorigen.value=document.frmtraslados.cbobodega.options[frmtraslados.cbobodega.selectedIndex].text;">
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
Cantidad de Salida:<input type="text" maxlength="5"  id="txtcantidad"  name="txtcantidad" value="" maxlength="3" size="3" />  
  </BR>
        </BR>
    
        <input type="text" id="txtbodegas" hidden ="true"  name="txtbodegaorigen"  value=""  />
        <input type="text" id="txtbodega" hidden ="true" name="txtbodegadestino"  value="VENTAS" />
       
        <input type="submit" value="Trasladar" id="trasladar" name ="trasladar" />
        </form> 
        
    <BR/><a href="indexORIGINAL.html">INICIO</a>     
    </body>
</html>
