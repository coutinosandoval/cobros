<%-- 
    Document   : proveedoresVERIFICAinformacion
    Created on : 11-sep-2014, 19:52:12
    Author     : Administrador
EN ESTA PAGINA, SE INGRESAN TODOS LOS PRODUCTOS DE LAS FACTURAS DE COMPRAS
HABIENDO UN BOTON PARA EL INGRESO DE LA INFORMACION, QUE SE ALMACENA TEMPORALMENTE
EN UNA TABLA LLAMADA COMPRAS TEMPORAL, AL CERRAR LA FACTURA, EXISTE UN BOTON
LLAMADO CERRAR FACTURA, QUE DEBERA HACER LOS TRASLADOS DE LA INFORAMACION A LAS TABLAS
EXISTENCIAS, Y BORRAR TODO LO QUE HAY EN LA TABLA temporal



--%>
 <%@page import="pconexion.listaventatemporals"%>
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
       <title> compras </title>
 
        
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
        if ($('#phone').val()<0 || $('#phone').val()>100 || isNaN($('#phone').val())) {
            $('#phone').css('border-color','#FF0000');
            alert('El número esta fuera del rango o no es un numero');
            return false;
        }
        else {
            alert('OK');
        }
    });
   })
   
   <script type="text/javascript">
                 window.onload= function(){
                         document.FRMcompras.txtcodgrupoproducto.focus()
                     }
	}
</script>
   
   </script>

<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery.autocomplete.js"></script>
<script language="javascript" type="text/javascript">

jQuery(function(){
$("#txtcodigoproducto").autocomplete("reg_update.jsp");
});
</script>
   
   <script>
<!--
document.FRMcompras.txtcodgrupoproducto.focus();
//-->
function foco(){
 document.FRMcompras.txtcodgrupoproducto.focus();
}

</script> 
    </head>
    <body onload="foco()" >
        
        <h1>FACTURACION </h1>
        <BR/><a href="indexORIGINAL.html">INICIO</a>  <BR/><BR/><BR/>
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
            <%
     String usuario ="dc";           
     datos.proveedores();
       
     // LinkedList <listaventatemporal> ventastemporal = datos.listaventatemporal(); 
      LinkedList <grupobodegas> listabodegas = datos.grupoBodegas();
      LinkedList <grupoproductos> grupoproducto = datos.grupoproductos();
      LinkedList <depto> listaproveedor = datos.clientes(usuario);
      LinkedList <listafincas> listafincas = datos.listadofincas();
      
      float totales = datos.preciototal();
     int g = listaproveedor.size();
     int j = listabodegas.size();
     int k = grupoproducto.size();
     double precio=0.00;
     double total =0.00;
     String factura ="100";
      DecimalFormat df = new DecimalFormat("0.00"); 
    //  String factura = listaproveedor.get(0).getfacturacompra();
     
%> 
  


 <%-- 
    en este parrafo, muestra la informacion del proveedor
 del cual se esta ingresando la factura de compra
--%>         
    
 Cliente: <input type="text" name="txtnombreproveedor" disabled="disabled"  readonly="readonly"
                    value="<%=listaproveedor.get(0).getnomproveedor() %>" maxlength="80" size="80" />
        Nit:<input type="text" name="txtnitproveedor" disabled="disabled"  readonly="readonly"
                   value ="<%=listaproveedor.get(0).getnit()%>"   />
       <BR/> Factura de Venta: <input type="text" name="txtfacturacompra"  disabled="disabled"  readonly="readonly" maxlength="15" 
                    value="<%=listaproveedor.get(0).getfacturacompra()%>" size="15" />
        Fecha de Venta: <input type="text" name="txtfechacompra" maxlength="10" disabled="disabled"  readonly="readonly"
                    value="<%=listaproveedor.get(0).getfechacompra()%>"  size="10" />
        
   <%-- 
    formulario en el cual cada producto de compra se ingresa a un tabla temporal
   paraluego ingresarla a las tablas correspondientes
--%>    

 -----------------------------------------------------------------------
 
<form id ="FRMcompras"   name="FRMcompras" action="recibeVENTA.jsp">
   <%-- 
   se agregaron los campos name: proveedor, nits, facturacompra, fechacompra
   para poder tomarlos y enviarlos a la tabla temporal
   y estan ocultos sin etiqueta 
--%> 
    <input type="text" name="proveedor" hidden="true"
                value="<%=listaproveedor.get(0).getnomproveedor()%>" />
    <input id ="nits" type="text" name="nits" hidden="true"
                value="<%=listaproveedor.get(0).getnit()%>" />
   
    <BR/><input id = "facturacompra" type="text" name="facturacompra" hidden="true"
                 value="<%=listaproveedor.get(0).getfacturacompra()%>" />
   <input type="text" name="fechacompras" hidden="true"
                value="<%=listaproveedor.get(0).getfechacompra() %>" />
   
    <BR/> 
    Cantidad:<input type="text" maxlength="5" required="true" id="txtcantidad"  name="txtcantidad" value="1" size="5" />
    Código Producto:<input Id ="txtcodigoproducto" type="text" maxlength="15" required="true"  name="txtcodigoproducto" value="" size="15" />
    Descuento: <input type="text" name="txtprecioventa" value="0" size="10" maxlength="10" />
    <input type="text" hidden =" false" name="txtusuario" value="<%= usuario %>"  size="5" />
    
    <input type="submit" value="Guardar" id ="btnguardar" name="btnguardar" />


</form>
<BR/><BR/>


<%-- 
    formulario  que da orden para cerrar la factura que se este ingresando, el cual se ejecuta y borra la tabla
   temporal, y la inforamcion en la tabla proveedores temporal, que toma informacion para llenar factura
--%> 
   <form name="btnborrafacturas" action="borrainfofacturaventas.jsp" method="POST">
 
     <%-- 
    SE ENVIA LA INFORMACION DEL NUMERO DE LA FACTURA PARA SER IMPRESA
--%>    
          <a href="ReportesFactura.jsp?factura= <%=listaproveedor.get(0).getfacturacompra() %> "> IMPRIMIR FACTURA </a>
     
 
 <input type="submit" value="Cerrar Factura" id ="btnguardars" name="btncerrar" />
       
 <input hidden =" false" type="text" name="txtfincauno" value="0" size="10" required="true" />
 
 <input type="text" name="txtfechacompra1" maxlength="10"   readonly="readonly"
                    value="<%=listaproveedor.get(0).getfechacompra()%>"  size="10" />
 
 <input hidden =" false" type="text" name="txtfincados" value="0" size="10" required="true" />
 <input hidden =" false" type="text" name="txtfinca1" value="f1" size="5" />
 <input  hidden =" false" type="text" name="txtfinca2" value="f2" size="5" />
 <input hidden =" false"  id ="nits" type="text" name="codfinca1" 
                value="<%=listafincas.get(0).getcodigo()%>" />
 <input hidden =" false" id ="nits" type="text" name="codfinca2" 
                value="<%=listafincas.get(1).getcodigo()%>" />
       
       
       <BR></BR>  <input  hidden =" false" type="text" name="gg" value="" />
     <input hidden =" false" id ="nits" type="text" name="nits" 
                value="<%=listaproveedor.get(0).getnit()%>" />
      <BR/><input hidden =" false" id = "facturacompra" type="text" name="facturacompra"
                 value="<%=listaproveedor.get(0).getfacturacompra()%>" />
       
 <input hidden =" false" type="text" name="fechacompras" hidden="true"
                value="<%=listaproveedor.get(0).getfechacompra() %>" />
    
  <input type="text" hidden =" false" name="txtuser" value="<%= usuario %>"  size="5" />
  Tipo de Venta: <select required="true" name="cbogrupoproductos" 
             id="cbogrupoproductos" onchange="document.btnborrafacturas.txttipoventa.value=document.btnborrafacturas.cbogrupoproductos.options[btnborrafacturas.cbogrupoproductos.selectedIndex].text;"> 
    
       <option value="0" selected>EFECTIVO</option>
       <option value="1" selected>CREDITO</option>
   <%

%> 
   
   </select>
  
  
  tipo de venta: <input type="text" name="txttipoventa" value="EFECTIVO" size="8" />     
  </form>  



 
  <%-- 
    en la tabla siguiente, debera mostrar los productos que se 
    estan ingresando de una factura de ventas
  <tr>
<td align="right">right</td>
<td>alineado a la derecha</td>
</tr> 
  
--%>  



<%
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

 LinkedList <listaventatemporals> ventastemporal = datos.ventatemporals(usuario,listaproveedor.get(0).getfacturacompra()); 

 
 
 
         for (int i=0;i<ventastemporal.size();i++)
{ 
  
   total = (total + (ventastemporal.get(i).getprecioventa() * 
                       ventastemporal.get(i).getcantidad()));
} 
%>       





<font size="24" color="red" align="center" > <%=df.format(total) %> </font>

 <table id="mytable" BORDER="0">
            <tr>
                <td align="center" font color =" blue" WIDTH="80">Codigo.</td> 
                 <td align="center" WIDTH="550">Descripcion</td> 
                  <td align="center" WIDTH="80">cantidad</td>  
                  <td align="center" WIDTH="80">precio</td>  
                <td align="right" WIDTH="80">total</td> 
               
            </tr> 
         
  
            <%
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

 //LinkedList <listaventatemporals> ventastemporal = datos.ventatemporals(usuario,listaproveedor.get(0).getfacturacompra()); 

 
 total =0.00;
 
         for (int i=0;i<ventastemporal.size();i++)
{ 
   // precio = precio + 5;
   // int i =0;
   out.println("<tr>");
   out.println("<td>"+ventastemporal.get(i).getcodigo()+"</td>");
   out.println("<td>"+ventastemporal.get(i).getdescripcion()+"</td>");
   out.println("<td align=center>"+ventastemporal.get(i).getcantidad()+"</td>");
   out.println("<td align=right>"+(df.format(ventastemporal.get(i).getprecioventa()))+"</td>");
  out.println("<td align=right >"+(df.format(ventastemporal.get(i).getprecioventa() * 
                       ventastemporal.get(i).getcantidad())) +"</td>");
  
   total = (total + (ventastemporal.get(i).getprecioventa() * 
                       ventastemporal.get(i).getcantidad()));
  
   out.println("</tr>");
   
   
   
}
 out.println("<td>"+""+"</td>");
 out.println("<td>"+""+"</td>");
 out.println("<td>"+""+"</td>");
 out.println("<td>"+""+"</td>");
// out.println("<td font size = 24 align=right bgcolor=blue >"+df.format(total)+"</td>");
 //out.println("<td font size =24>"+ df.format(total)+"</td>");    
 //out.println("<td font size= 24 color=blue face=Comic Sans MS,arial,verdana </td>");
%>       

 </table>  
         
 <BR/>
 <BR/>
 
 
 
    </body>
</html>
