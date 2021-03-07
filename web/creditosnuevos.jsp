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
        <title>Creditos</title>
        
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
$("#txtcliente").autocomplete("reg_update_clientes_nit.jsp");
$("#txtasesor").autocomplete("reg_update_asesor.jsp");

});
</script>
   
      
        
    </head>
    <body>
        <BR/><a href="indexORIGINAL.html">INICIO</a>
        <h1>NUEVOS CREDITOS</h1>
        
        <form name="frmcreditos" action="creditosnuevosRECIBE.jsp">
       
         
        <br></br> Fecha  <input required="true" type="text" class="campofecha" size="10" Id ="txtfechainicial" name="txtfechainicial" value="" />
        No. de Credito <input type="text" id="txtnocredito" name="txtnocredito" value="" size="5" />        
        
        <br></br>
        Cliente a otorgar Credito <input type="text" id="txtcliente" name="txtcliente" value="" size="50" />
       
       
        
   Monto Otorgado <input type="text" id="txtmonto" name="txtmonto" value="" size="10" />
    Porcentaje de Interes <input type="text" id="txtintereses" name="txtintereses" value="" size="5" />
     No. de Cuotas <input type="text" id="txtcuotas" name="txtcuotas" value="" size="5" />       
         <br></br> 
       Asesor que autoriza credito <input type="text" id="txtasesor" name="txtasesor" value="" size="50" />
        <br></br>
         <input type="submit" value="Enviar" name="txtenviar" />
        </form>
        
        
        
    </body>
</html>
