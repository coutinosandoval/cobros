<%-- 
    Document   : kardexconsultas
    Created on : 21/09/2015, 10:32:39 PM
    Author     : Administrador
--%>

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
        <title>Kardex</title>
        
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
      $(".campofechainicio") .calendarioDW();
      
      //validar numero entero
      
       $(".campofechafin") .calendarioDW();
        
   })
   </script>

<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery.autocomplete.js"></script>
<script language="javascript" type="text/javascript">

jQuery(function(){
$("#txtcodigoproducto").autocomplete("reg_update.jsp");
});

jQuery(function(){
$("#txtubicacion").autocomplete("reg_update_bodegas.jsp");
});
</script>
   
      
        
    </head>
    <body>
        <h1>Kardex por Producto!</h1>
        
 <form name="frmkardex" action="kardexconsultasrecibe.jsp" method="POST">
         
        Fecha de Inicio:<input required="true" type="text" name="fechainicio" class="campofechainicio" maxlength="10" size="10">    
        Fecha de Fin <input required="true" type="text" name="fechafinal" class="campofechafin" maxlength="10" size="10">    
            
            
            <BR/> Nombre del Producto:<input Id ="txtcodigoproducto" type="text" maxlength="40" required="true"  name="txtcodigoproducto" value="" size="40" />
                  Ubicacion del Producto:<input Id ="txtubicacion" type="text" maxlength="40" required="true"  name="txtubicacion" value="" size="40" />
         
          
          <br></br>
            <input type="submit" value="Consultar" name="btnconsultar" />
        
        </form>
        
        
        <BR/><a href="indexORIGINAL.html">INICIO</a>
        <BR/><a href="ReportesKardex.jsp">Imprimir Reportes</a>
        
        <br></br>
        
        
    <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
     datos.proveedores();
      
      LinkedList <listakardex> kardex = datos.listakardex(); 
      LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
      datos.borratablakardex();
     
              
      
   //   float totales = datos.preciototal();
  //   int k = kardex.size();
  //   double precio=0.00;
  //   DecimalFormat format = new DecimalFormat("0.00");
  
  if (kardex.size()>0)    
  {  
   out.println("<td>"+kardex.get(0).getcodigo()  +"</td>");
   out.println();
   out.println("<td>"+kardex.get(0).getbodega()  +"</td>");
   
 }//Fin if 
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="180">Fecha.</td>    
                <td WIDTH="70">Ingresos</td>    
                <td WIDTH="70">Egresos</td>    
                <td WIDTH="70">Saldo</td>    
                <td WIDTH="70">Factura</td> 
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

   
      for (int i=0;i<kardex.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+kardex.get(i).getfecha() +"</td>");
   out.println("<td>"+kardex.get(i).getingresos() +"</td>");
   out.println("<td>"+kardex.get(i).getegresos()+"</td>");
   out.println("<td>"+kardex.get(i).getsaldos()+"</td>  ");
   out.println("<td>"+kardex.get(i).getfactura()+"</td>  ");
   
   
   out.println("</tr>");
}//for

%>       
          
 
           </table>  


        
    </body>
</html>
