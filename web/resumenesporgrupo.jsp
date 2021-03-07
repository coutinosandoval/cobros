<%-- 
    Document   : resumenesporgrupo
    Created on : 20/10/2015, 09:50:03 PM
    Author     : Administrador
--%>
<%@page import="pconexion.listagastosporgrupos"%>
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
        <title>Resumenes</title>
        
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
$("#txtfinca").autocomplete("reg_update_fincas.jsp");
});
</script>
   
      
        
        
    </head>
    <body>
        <h1>Resumenes por Grupos</h1>
        <form name="frmresumenesporgrupo" action="resumenesporgruposRECIBE.jsp">
           <br> <br> Fecha Inicial: <input required="true"  Id ="fechainicial"  class="campofechainicio" type="text" name="txtfechainicial" value="" size="10" />
             Fecha Final<input required="true"  Id ="fechafinal" class="campofechafin"  type="text" name="txtfechafinal" value="" size="10" />
            
          <br> <br> Finca a Consultar: <input required="true"  Id="txtfinca"  type="text" name="txtfinca" value="" size="80" />
         <br>  <br>  <input type="submit" value="Enviar" name="btnenviar" />
          <br>  <br>  
        </form>
  <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
     datos.proveedores();
       
      LinkedList <listagastosporgrupos> grupos = datos.listagastosporgrupos(); 
       datos.borratablafincagastosporgrupos();
  
  
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="280">Gupo Productos</td>    
                <td WIDTH="60">Total</td>    
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

   
      for (int i=0;i<grupos.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+grupos.get(i).getgrupo() +"</td>");
   out.println("<td>"+grupos.get(i).gettotal() +"</td>");
   
   
   out.println("</tr>");
}//for

%>       
          
 
           </table>  


          
    </body>
</html>
