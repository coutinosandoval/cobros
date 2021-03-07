<%-- 
    Document   : proveedoresVERIFICAinformacion
    Created on : 11-sep-2014, 19:52:12
    Author     : Administrador
EN ESTA PAGINA, SE INGRESAN TODOS LOS PRODUCTOS DE LAS FACTURAS DE VENTAS
HABIENDO UN BOTON PARA EL INGRESO DE LA INFORMACION, QUE SE ALMACENA TEMPORALMENTE
EN UNA TABLA LLAMADA VENTASTEMPORAL, AL CERRAR LA FACTURA, EXISTE UN BOTON
LLAMADO CERRAR FACTURA, QUE DEBERA HACER LOS TRASLADOS DE LA INFORAMACION A LAS TABLAS
VENTAS, Y BORRAR TODO LO QUE HAY EN LA TABLA temporal



--%>
 <%@page import="pconexion.clientestemporal"%>
<%@page import="pconexion.listaventatemporal"%>
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
        <title></title>
       <title> Ventas </title>
 
        
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
   $(document).ready(function(){
      $(".campofecha") .calendarioDW();
      
      //validar numero entero
      
      $('#send').click(function() {
        if ($('#phone').val()<0  || isNaN($('#phone').val())) {
            $('#phone').css('border-color','#FF0000');
            alert('El dato no es un numero');
            return false;
        }
        else {
            alert('OK');
        }
    });
   })
   </script>

<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery.autocomplete.js"></script>
<script language="javascript" type="text/javascript">

jQuery(function(){
$("#txtcodigoproducto").autocomplete("reg_update.jsp");
});

    
      function validarSiNumero(numero){
        if (!/^([0-9])*$/.test(numero))
          alert("El valor " + numero + " no es un número");
          numero.focus();
          
         // document.getElementById(numero).focus();
          
      }
    



</script>
   
   
    </head>
    <body>
        
        <h1>INGRESO DE PRODUCTOS </h1>
        <BR/><a href="index1.html">INICIO</a>  <BR/><BR/><BR/>
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
            <%
     datos.proveedores();
       
      LinkedList <listaventatemporal> tablatemporal = datos.listaventatemporal(); 
      LinkedList <grupobodegas> listabodegas = datos.grupoBodegas();
      LinkedList <grupoproductos> grupoproducto = datos.grupoproductos();
      LinkedList <clientestemporal> listacliente = datos.clientetemporal();
   //   LinkedList <listafincas> listafincas = datos.listadofincas();
      
      float totales = datos.preciototal();
     int g = listacliente.size();
     int j = listabodegas.size();
     int k = grupoproducto.size();
     double precio=0.00;
     DecimalFormat format = new DecimalFormat("0.00");
     
     
%> 
  


 <%-- 
    en este parrafo, muestra la informacion del proveedor
 del cual se esta ingresando la factura de compra
--%>         
   Factura:<input type="text" name="txtfacturacompra"  disabled="disabled"  readonly="readonly" maxlength="15" 
                    value="<%=listacliente.get(0).getfactura()%>" size="15" />
   <BR/><BR/>     

 Nit:<input type="text" name="txtnitproveedor" disabled="disabled"  readonly="readonly"
                   value ="<%=listacliente.get(0).getnit()%>"   />
 Cliente: <input type="text" name="txtnombreproveedor" disabled="disabled"  readonly="readonly"
                    value="<%=listacliente.get(0).getnombre() %>" maxlength="80" size="80" />
<BR/> Direccion:<input type="text" name="txtfechacompra" maxlength="10" disabled="disabled"  readonly="readonly"
                    value="<%=listacliente.get(0).getdireccion()%>"  size="10" />
              
 
 
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
   LA FECHA SE TOMA DEL SISTEMA EN LA PARTE LOGICA DEL SISTEMA
--%> 
    <input type="text" name="proveedor" hidden="true"
                value="<%=listacliente.get(0).getnombre()%>" />
    <input id ="nits" type="text" name="nits" hidden="true"
                value="<%=listacliente.get(0).getnit()%>" />
   
    <BR/><input id = "facturacompra" type="text" name="facturacompra" hidden="true"
                 value="<%=listacliente.get(0).getfactura()%>" />
   <input type="text" name="fechacompras" hidden="true"
                value="<%=listacliente.get(0).getdireccion() %>" />
  
     Código Producto:<input Id ="txtcodigoproducto" type="text" maxlength="20" required="true"  name="txtcodigoproducto" value="" size="20" />
    Cantidad:<input type="text" maxlength="5" required="true"   name="txtcantidad" value="" size="5" id="txtcantidad"  onChange="validarSiNumero(this.value);" />
    Precio de Compra: <input type="text" name="txtpreciocompra" maxlength="10" required="true" id="txtpreciocompra" value="" />
    Precio Venta:<input type="text" name="txtprecioventa" value="" maxlength="10" size="10" />
    
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

<input type="text" id="txtcodgrupoproducto" hidden="true"  name="txtcodgrupoproducto"  value="" />
<input type="text" id="txtbodega" hidden="true"  name="txtbodega"   value="" />


<BR/><input type="submit" onsubmit="" value="Guardar" id ="btnguardar" name="btnguardar" />


</form>

<%-- 
    formulario  que da orden para cerrar la factura que se este ingresando, el cual se ejecuta y borra la tabla
   temporal, y la inforamcion en la tabla proveedores temporal, que toma informacion para llenar factura
--%> 
   <form name="btnborrafacturas" action="borrarinfofacturas.jsp" method="POST">
  
  <BR/><input type="submit" value="Cerrar Factura" id ="btnguardars" name="btncerrar" />
       
       
 
   
        <input  hidden =" false" type="text" name="gg" value="" />
     <input hidden =" false" id ="nits" type="text" name="nits" 
                value="<%=listacliente.get(0).getnit()%>" />
    <input hidden =" false" id = "facturacompra" type="text" name="facturacompra"
                 value="<%=listacliente.get(0).getfactura()%>" />
       
 <input hidden =" false" type="text" name="fechacompras" hidden="true"
                value="<%=listacliente.get(0).getdireccion() %>" />
   
  </form>  

<BR/>

 -----------------------------------------------------------------------
 -----------------------------------------------------------------------
   
 
  <%-- 
    en la tabla siguiente, debera mostrar los productos que se 
    estan ingresando de una factura de compras
--%>  
        
 <table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="30">Codigo.</td> 
                <td WIDTH="700">Descripcion</td> 
                <td WIDTH="25">cantidad</td>  
                <td WIDTH="150">Precio de Venta</td> 
                <td WIDTH="150">Sub Total</td> 
                
            </tr> 
         
          <%
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
for (int i=0;i<tablatemporal.size();i++)
{ 
   // precio = precio + 5;
    
   out.println("<tr>");
   out.println("<td>"+tablatemporal.get(i).getcodigo()+"</td>");
   out.println("<td>"+tablatemporal.get(i).getdescripcion() +"</td>");
   out.println("<td>"+tablatemporal.get(i).getcantidad() +"</td>");
   out.println("<td>"+(format.format(tablatemporal.get(i).getprecioventa()))+"</td>");
   out.println("<td>"+(format.format(tablatemporal.get(i).getcantidad() * tablatemporal.get(i).getprecioventa()))+"</td>");
   out.println("</tr>");
}
%>       
          
 
           </table>  
  
 
    </body>
</html>
