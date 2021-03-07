<%-- 
    Document   : empleadosstatus
    Created on : 20/01/2016, 08:44:44 AM
    Author     : dcoutino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
$("#txtempleado").autocomplete("reg_update_empleado.jsp");
});
</script>
   
    
    
    </head>
    <body>
        <h1>Status Empleados</h1>
        <BR/><a href="indexORIGINAL.html">INICIO</a>     
        <BR/><BR/>
        <form name="frmstatus" action="empleadosstatusrecibe.jsp">
            Empleado:<input id="txtempleado" type="text" name="txtempleado" value="" size="40" />
            <input type="submit" value="Consultar" name="btnconsultar" />
        
        </form>   
        
    </body>
</html>
