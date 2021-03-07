<%-- 
    Document   : historiales
    Created on : 13-oct-2014, 21:20:40
    Author     : Administrador
--%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="pconexion.listatablaventas"%>
<%@page import="pconexion.listatablahistorial"%>
<%@page import="pconexion.listatablavencidos"%>
<%@page import="pconexion.listaexistencias"%>
<%@page import="pconexion.listatablatemporal"%>
<%@page import="pconexion.grupoproductos"%>
<%@page import="pconexion.grupobodegas"%>
<%@page import="pconexion.depto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>historiales</title>
        
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
        <link href="calendario_dw/calendario_dw-estilos.css" type="text/css" rel="STYLESHEET">
   <style type="text/css">    
   
   body{
      font-family: tahoma, verdana, sans-serif;
   }
   </style>
   <script type="text/javascript" src="calendario_dw/jquery-1.4.4.min.js"></script>
   <script type="text/javascript" src="calendario_dw/calendario_dw.js"></script>
   <script type="text/javascript" src="js/jquery.columnhover.js"></script>
   <script type="text/javascript" src="js/jquery.columnhover.pack.js"></script>
   <script type="text/javascript" src="js/jquery.tablesorter.js"></script>
   <script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
   
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
   
   $("#mytable tbody tr").mouseover(function() {
     // a la fila sobre la que esté el ratón (this)
     // le añado la clase que la resaltará
     $(this).addClass("tr_hover");
});
   
   </script> 
   
        
    </head>
    <body>
      
      

        <h1>Ventas Realizadas</h1>
        
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
        <%
        float total =0;
       DecimalFormat format = new DecimalFormat("0.00");
       
       LinkedList <listatablaventas> ventas = datos.listatablaventas();
      datos.borraventastemporal();
      
%> 
        
        <form name="frmhistoriales" action="ventasrealizadastrecibe.jsp" method="POST">
            <input type="text" hidden="true" name="txtcodigo" value="3" size="5" />
        <BR/><BR/>
        Rango de Fechas
        <BR/><BR/>
        Desde <input type="text" name="txtfechai" value="" size="10" class="campofecha" />
        Hasta<input type="text" name="txtfechaf" value="" size="10" class="campofecha" />
        <input type="text" hidden="true" name="txtcodigo" value="demsshill" />
        <BR/>
        <input type="submit" value="Consultar" name="btnconsultar" />
        
        </form>
        
        <table id="mytable"  border="1">
            <tr>
                
                <td WIDTH="03">Codigo Producto</td>  
                <td WIDTH="50">Descripcion</td>  
                <td WIDTH="15">Cantidad Vendida</td> 
                <td WIDTH="15">Precio Venta</td> 
                <td WIDTH="5">Sub Total</td> 
                <td WIDTH="10">Empleado</td>  
                <td WIDTH="12">Fecha de Venta</td>  
                <td WIDTH="12">Hora Venta</td>
               
            </tr> 
         
          <%
    
  LinkedList <listatablavencidos> tablatemporal = datos.listatablavencidos(); 
for (int i=0;i<ventas.size();i++)
{ 
   
    
   out.println("<tr>");
   out.println("<td>"+ventas.get(i).obtenercodigoproducto() +"</td>");
   out.println("<td>"+ventas.get(i).obtenerdescripcion() +"</td>");
   out.println("<td>"+ventas.get(i).obtenercantidad() +"</td>");
   out.println("<td>"+ (format.format(ventas.get(i).obtenerprecioventa())) +"</td>");
   out.println("<td>"+ (format.format(ventas.get(i).obtenersubtotal())) +"</td>");
   out.println("<td>"+ventas.get(i).obtenerusuario() +"</td>");
   out.println("<td>"+ventas.get(i).obtenerfecha() +"</td>");
   out.println("<td>"+ventas.get(i).obtenerhora() +"</td>");
  total = total + ventas.get(i).obtenersubtotal() ;
  // out.println("</tr>");
}
%>       
  
           </table>  
<B> <font color="blue"><font size=16> <%=(format.format(total))%></font> </font> </B>
<BR/><BR/>


   <BR/><a href="../validacion.jsp">INICIO</a>      
    </body>
</html>
