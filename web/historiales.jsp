<%-- 
    Document   : historiales
    Created on : 13-oct-2014, 21:20:40
    Author     : Administrador
--%>
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
        <h1>Historial de Traslado de Mercaderias</h1>
        
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
        <%
     
       
      LinkedList<listatablahistorial> historial = datos.listatablahistorial();
      datos.borrahistorialtemporal();
      
%> 
        
        <form name="frmhistoriales" action="historialesrecibe.jsp" method="POST">
            Codigo del Empleado:<input type="text" name="txtcodigo" value="" size="5" />
        <BR/><BR/>
        Rango de Fechas
        <BR/><BR/>
        Desde <input type="text" name="txtfechai" value="" size="10" class="campofecha" />
        Hasta<input type="text" name="txtfechaf" value="" size="10" class="campofecha" />
        <BR/>
        <input type="submit" value="Consultar" name="btnconsultar" />
        
        </form>
        
        <table id="mytable"  border="1">
            <tr>
               
                <td bgcolor="#66CC99">Codigo Empleado</td>  
                <td WIDTH="85">Fecha de Operaciones</td>  
                 <td WIDTH="25">No. Documento</td>  
                <td WIDTH="45">Cantidad Solicitada</td>    
                 <td WIDTH="5">Producto Retirado</td>  
                <td WIDTH="45">Ubicacion del Producto</td> 
                <td WIDTH="45">Destino del Producto</td>
                  
               
            </tr> 
         
          <%
    
  LinkedList <listatablavencidos> tablatemporal = datos.listatablavencidos(); 
for (int i=0;i<historial.size();i++)
{ 
   
    
   out.println("<tr>");
   out.println("<td>"+historial.get(i).obtenercodigovendedor() +"</td>");
   out.println("<td>"+historial.get(i).obtenerfecha() +"</td>");
   out.println("<td>"+historial.get(i).obtenerdocumento() +"</td>");
   out.println("<td>"+historial.get(i).obtenercantidad() +"</td>");
   out.println("<td>"+historial.get(i).obtenerproductos() +"</td>");
   out.println("<td>"+historial.get(i).obtenerbodegaorigen() +"</td>");
   out.println("<td>"+historial.get(i).obtenerbodegadestino() +"</td>");
   
  
   
  // out.println("</tr>");
}
%>       
          
  
           </table>  
   <BR/><a href="index1.html">INICIO</a>      
    </body>
</html>
