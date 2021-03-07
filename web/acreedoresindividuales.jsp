<%-- 
    Document   : resumenesENVIA
    Created on : 29/09/2015, 09:32:26 PM
    Author     : Administrador
--%>
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
        <title>RESUMENES</title>
        
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
        <h1>MOVIEMIENTOS POR CLIENTES</h1>
        
        <form name="frmresumenes" action="acreedoresindividualesRECIBE.jsp">
        <%-- 
   Elija la Finca de la cual se requiere el resumen
          <input type="text" Id ="txtfinca" name="txtfinca" value="" />
         <br></br>
--%>  
         
        <br></br> Fecha Inicial: <input required="true" type="text" class="campofecha" size="10" Id ="txtfechainicial" name="txtfechainicial" value="" />
        Fecha Final <input type="text" required="true" class="campofecha" size="10" Id ="txtfechafinal" name="txtfechafinal" value="" />
        <br>
        Cliente a Consultar: <input type="text" id="txtcliente" name="txtcliente" value="" size="70" />
        <br></br> <input type="submit" value="Consultar" name="txtconsultar" />
            
            
            
        </form>
        
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
     //datos.proveedores();
     
      LinkedList <listamovimientospagos> resumenes = datos.listamovimientospagos(); 
    datos.borratablamovimientospagos();
//  LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
      //datos.borratablafincagastoscasa();
     
              
      
      float totales = 0;
  //   int k = kardex.size();
  //   double precio=0.00;
     DecimalFormat format = new DecimalFormat("0.00");
  
  if (resumenes.size()>0)    
  {  
   out.println("<td>"+resumenes.get(0).getnombre() +"</td>");      
 }//Fin if 
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="100">Fecha</td>    
                <td WIDTH="100">Recibo</td>    
                <td WIDTH="100">Debe</td> 
                <td WIDTH="100">Haber</td> 
                <td aling= right WIDTH="100">Saldo</td> 
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

   
      for (int i=0;i<resumenes.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+resumenes.get(i).getfecha() +"</td>");
   out.println("<td>"+resumenes.get(i).getfactura() +"</td>");
   out.println("<td>"+(format.format(resumenes.get(i).getcompras())) +"</td>");
   out.println("<td>"+(format.format(resumenes.get(i).getabonos())) +"</td>  ");
   out.println("<td>"+(format.format(resumenes.get(i).getsaldo())) +"</td>  ");
  // out.println("<td>" + "<a href=planillainformacion.jsp?factura="+ resumenes.get(i).getfactura() +">"+"Agregar"+"</a>"+"</td>");
   totales = totales +resumenes.get(i).getsaldo();
   out.println("</tr>");
}//for
   //   out.println("<td>"+ ""+"</td>");
   //   out.println("<td>"+ ""+"</td>");
   //   out.println("<td>"+ ""+"</td>");
   //   out.println("<td>"+ ""+"</td>");
   //   out.println("<td>"+(format.format(totales)) +"</td>");
%>       
          
 
           </table>  


        
        
        
    </body>
</html>
