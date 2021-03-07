<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>traslados</title>
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
$("#txtcuenta").autocomplete("reg_update_cuentas.jsp");
});
</script>
   
      
 
    </head>
    <body>
        <div>Ingreso Efectivo</div>
        
        <form name="FRMefectivo" action="retirosRECIBE.jsp">
         
            <br> Fecha: <input required="true" type="text" name="fecha" class="campofecha" size="12">
         No de Cheque <input required="true" type="text" name="txtfactura" value="" size="15" />
         <br> Cuenta <input type="text" id="txtcuenta" name="txtcuenta" value="" size="30" />
      
          Cantidad a Retirar <input required="true" type="text" name="txtcantidad" value="" size="10" />
       <br><input type="submit" value="Enviar" name="btnenviar" />
            
        </form>
        
        <BR/><a href="indexORIGINAL.html">INICIO</a>
        
    </body>
</html>
