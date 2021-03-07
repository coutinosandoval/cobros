<%-- 
    Document   : productosvencidos
    Created on : 12-oct-2014, 12:57:09
    Author     : Administrador
--%>
<%@page import="pconexion.listatablavencidos"%>
<%@page import="pconexion.listaexistencias"%>
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
        <title>productos vencidos</title>
        
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
        
             
        
        <h1>PRODUCTOS POR VENCER</h1>
        
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
        <%
     
     LinkedList<listatablavencidos> vencidos = datos.listatablavencidos();
     datos.borraproductosvencidos();
%> 
  
         
         
        <form name="frmproductosvencidos" action="productosvencidosrecibe.jsp" method="POST">
            Fecha Inicial:<input  type="text" name="fechainicial" class="campofecha" maxlength="10" size="10">
            Fecha Final:<input  type="text" name="fechafechafinal" class="campofecha" maxlength="10" size="10">
          <BR/>  <input type="submit" value="Consultar" name="txtconsultar" />
        <BR/><BR/>
        </form>


<table id="mytable"  border="1">
            <tr>
               
                <td bgcolor="#66CC99">Codigo</td>  
                <td WIDTH="85">Fecha de Vencimiento</td>  
                 <td WIDTH="5">Proveedor</td>  
                <td WIDTH="45">Factura de Compra</td>    
                 <td WIDTH="5">Fecha de Compra</td>  
                <td WIDTH="45">Ubicacion del Producto</td> 
                  
               
            </tr> 
         
          <%
    
  LinkedList <listatablavencidos> tablatemporal = datos.listatablavencidos(); 
for (int i=0;i<vencidos.size();i++)
{ 
   
    
   out.println("<tr>");
   out.println("<td>"+vencidos.get(i).obtenercodigoproducto()+"</td>");
   out.println("<td>"+vencidos.get(i).obtenerfechavencimiento()+"</td>");
   out.println("<td>"+vencidos.get(i).obtenernitproveedor() +"</td>");
   out.println("<td>"+vencidos.get(i).obtenerfacturaproveedor()+"</td>");
   out.println("<td>"+vencidos.get(i).obtenerfechacompra()+"</td>");
   out.println("<td>"+vencidos.get(i).obtenerubicacion()+"</td>");
   
  
   
  // out.println("</tr>");
}
%>       
          
  
           </table>  
<BR/><a href="index1.html">INICIO</a>
    </body>
</html>
