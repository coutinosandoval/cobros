<%-- 
    Document   : resumenesENVIA
    Created on : 29/09/2015, 09:32:26 PM
    Author     : Administrador
--%>
<%@page import="pconexion.listamuestradevoluciones"%>
<%@page import="pconexion.listafacturasdevoluciones"%>
<%@page import="pconexion.listamovimientospagos"%>
<%@page import="pconexion.listaresumenes"%>
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
        <title>DEVOLUCIONES</title>
        
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
$("#txtcliente").autocomplete("reg_update_clientes.jsp");
});
</script>
   
      
        
    </head>
    <body>
        <BR/><a href="indexORIGINAL.html">INICIO</a>
        <h1>DEVOLUCION DE MERCADERIAS DE CLIENTES</h1>
        
        <form name="frmresumenes" action="devolucionesclientesCIERRA.jsp">
        <%-- 
   Elija la Finca de la cual se requiere el resumen
          <input type="text" Id ="txtfinca" name="txtfinca" value="" />
         <br></br>
--%>  
         
         <br></br> <input type="submit" value="Cerrar Devoluciones" name="txtconsultar" />
            
            
            
        </form>
        
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
    
     datos.borratablamovimientosdevoluciones();
       LinkedList <listamuestradevoluciones> resumenes = datos.listamuestradevoluciones() ; 
    
  if (resumenes.size()>0)    
  {  
   out.println("<td>"+resumenes.get(0).getnombre() +"</td>");      
 }//Fin if 
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="100">Codigo</td>    
                <td WIDTH="350">Producto</td>  
                <td WIDTH="80">Cantidad</td>    
                <td WIDTH="80">Precio Venta</td>  
                <td WIDTH="80">Factura</td>  
                <td WIDTH="180">Click sobre para efectuar devolucion</td>  
                
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

   
      for (int i=0;i<resumenes.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+resumenes.get(i).getcodigo() +"</td>");
   out.println("<td>"+resumenes.get(i).getproducto() +"</td>");
   out.println("<td>"+resumenes.get(i).getcantidad() +"</td>");
   out.println("<td>"+resumenes.get(i).getventa() +"</td>");
   out.println("<td>"+resumenes.get(i).getfactura() +"</td>");
   
   
   
   
   
   
   out.println("<td>" + "<a href=devolucionesclientesMuestraRECIBE.jsp?codigo="+ resumenes.get(i).getcodigo() +">"+"Devolver"+"</a>"+"</td>");
   
   out.println("</tr>");
}//for
      
%>       
          
 
           </table>  


        
          
    </body>
</html>
