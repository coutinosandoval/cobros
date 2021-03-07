<%-- 
    Document   : comprasFACTURA
    Created on : 27-sep-2014, 15:54:02
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
        <title>JSP Page</title>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        
  <%-- 
    Scrip que muestra boton de fecha
--%>      
    <link href="calendario_dw/calendario_dw-estilos.css" type="text/css" rel="STYLESHEET">
   <style type="text/css">    
   
   body{
      font-family: tahoma, verdana, sans-serif;
   }
   </style>
   <script type="text/javascript" src="calendario_dw/jquery-1.4.4.min.js"></script>
   <script type="text/javascript" src="calendario_dw/calendario_dw.js"></script>
   
   <script type="text/javascript">
       
    
    <script type="text/javascript" src="js/jquery.columnhover.js"></script>
   <script type="text/javascript" src="js/jquery.columnhover.pack.js"></script>
   <script type="text/javascript" src="js/jquery.tablesorter.js"></script>
   <script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
   
   <script type="text/javascript"> 
       
       
       
       
       
       
       
   $(document).ready(function(){
      $(".campofecha") .calendarioDW();
      
      //validar numero entero
      
      $('#btnguardar').click(function() {
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
        
        
        
        
        
        <h1>INGRESO DE PRODUCTOS </h1>
        
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
            <%
     datos.proveedores();
       
      LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
      LinkedList <grupobodegas> listabodegas = datos.grupoBodegas();
      LinkedList <grupoproductos> grupoproducto = datos.grupoproductos();
      LinkedList <depto> listaproveedor = datos.proveedores();
     int g = listaproveedor.size();
     int j = listabodegas.size();
     int k = grupoproducto.size();
    
     
     
%> 
  


 <%-- 
    en este parrafo, muestra la informacion del proveedor
 del cual se esta ingresando la factura de compra
--%>         
    
 Proveedor:<input type="text" name="txtnombreproveedor" disabled="disabled"  readonly="readonly"
                    value="<%=listaproveedor.get(0).getnomproveedor() %>" maxlength="80" size="80" />
        Nit:<input type="text" name="txtnitproveedor" disabled="disabled"  readonly="readonly"
                   value ="<%=listaproveedor.get(0).getnit()%>"   />
       <BR/> Factura de Compra:<input type="text" name="txtfacturacompra"  disabled="disabled"  readonly="readonly" maxlength="15" 
                    value="<%=listaproveedor.get(0).getfacturacompra()%>" size="15" />
        Fecha de Compra:<input type="text" name="txtfechacompra" maxlength="10" disabled="disabled"  readonly="readonly"
                    value="<%=listaproveedor.get(0).getfechacompra()%>"  size="10" />
        
   <%-- 
    formulario en el cual cada producto de compra se ingresa a un tabla temporal
   paraluego ingresarla a las tablas correspondientes
--%>    

 -----------------------------------------------------------------------
 
<form id ="FRMcompras"   name="FRMcompras" action="recibeFACTURA.jsp">
   <%-- 
   se agregaron los campos name: proveedor, nits, facturacompra, fechacompra
   para poder tomarlos y enviarlos a la tabla temporal
   y estan ocultos sin etiqueta 
--%> 
    <input type="text" name="proveedor" hidden="false"
                value="<%=listaproveedor.get(0).getnomproveedor()%>" />
    <input id ="nits" type="text" name="nits" hidden="false"
                value="<%=listaproveedor.get(0).getnit()%>" />
   
    <BR/><input id = "facturacompra" type="text" name="facturacompra" hidden="false"
                 value="<%=listaproveedor.get(0).getfacturacompra()%>" />
   <input type="text" name="fechacompras" hidden="false"
                value="<%=listaproveedor.get(0).getfechacompra() %>" />
   <BR/>
<BR/>
    <BR/> Código Producto:<input type="text" maxlength="20" required="true"  name="txtcodigoproducto" value="" size="20" />
    Cantidad:<input type="text" maxlength="5" required="true" id="txtcantidad"  name="txtcantidad" value="" size="5" />
    Precio de Compra: <input type="text" name="txtpreciocompra" maxlength="5" required="true" id="txtpreciocompra" value="" />
    Fecha de Vencimiento:<input required="true" type="text" name="fecha" class="campofecha" maxlength="10" size="10">
    
    
    <BR/> Grupo Producto: <select required="true" name="cbogrupoproductos" id="cbogrupoproductos" onchange="document.FRMcompras.txtcodgrupoproducto.value=document.FRMcompras.cbogrupoproductos.options[FRMcompras.cbogrupoproductos.selectedIndex].text;"> 
    
       <option value="0" selected>...Seleccione el Grupo del Producto...</option>
   <%
for (int m=0;m<grupoproducto.size();m++)
{
 %>
 <option value="<%=m%>"><%=grupoproducto.get(m).getsetdescripcion()%></option>

<%                   
}
%> 
   
   </select>

Bodega Destino:<select required="true" id ="cbobodegas"name="cbobodegas" onchange="document.FRMcompras.txtbodega.value=document.FRMcompras.cbobodegas.options[FRMcompras.cbobodegas.selectedIndex].text;">
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
<BR/>

<input type="text" id="txtcodgrupoproducto"  name="txtcodgrupoproducto" hidden="false" value="" />
<input type="text" id="txtbodega"  name="txtbodega"  hidden="false" value="" />

<BR/>
<BR/>

            
        

<BR/><input type="submit" value="Guardar" id ="btnguardar" name="btnguardar" />


</form>
  <form name="btnborrafacturas" action="borrarinfofacturas.jsp" method="POST">
  
     Ingreso de dato: <input type="text" name="txtingreso" value="" size="15" />
      
      
 <BR/><input type="submit" value="Cerrar Factura" id ="btnguardars" name="btncerrar" />
  </form>
    
<BR/>
<BR/>
<BR/>
<BR/>

 -----------------------------------------------------------------------
 -----------------------------------------------------------------------
   
 
  <%-- 
    en la tabla siguiente, debera mostrar los productos que se 
    estan ingresando de una factura de compras
--%>  
        
 <table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="20">Codigo.</td>    
                <td WIDTH="5">cantidad</td>  
                <td WIDTH="45">Grupo</td>    
                <td WIDTH="45">Destino</td>    
                <td WIDTH="10">Fecha Vencimiento</td>    
            </tr> 
         
             
                <%

for (int i=0;i<tablatemporal.size();i++)
{
   out.println("<tr>");
     out.println("<td>"+tablatemporal.get(i).getcodigo()+"</td>");
     out.println("<td>"+tablatemporal.get(i).getcantidad()+"</td>");
    out.println("<td>"+tablatemporal.get(i).getngrupo()+"</td>");
    out.println("<td>"+tablatemporal.get(i).getubicacion()+"</td>");
    out.println("<td>"+tablatemporal.get(i).getfvencimiento()+"</td>");
    out.println("<td>"+tablatemporal.get(i).getprecio()+"</td>");
    
    out.println("<td id=nota1>" + 
                     " <INPUT TYPE= button onclick=borrar(this)><BR>"+"</td>");

    
    
   out.println("</tr>");
}
%>
                
          
  
           </table>  
             
 <BR/>
 <BR/>
        
    </body>
</html>
