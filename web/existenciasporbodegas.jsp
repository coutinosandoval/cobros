<%-- 
    Document   : existenciasporbodegas
    Created on : 1/03/2016, 02:39:10 PM
    Author     : dcoutino
--%>

<%@page import="pconexion.listaexistenciaproductos"%>
<%@page import="pconexion.listaexistenciaproductosporbodega"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Existencias</title>
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
$("#txtproducto").autocomplete("reg_update_bodegas.jsp");
});
</script>
   
      
        <script language="javascript">
             function bodegas() { 
                 var bodega = document.frmexistenciaporbodegas.textproducto.valueOf();
             }
    </script>

        
    </head>
    
    
    <body>
        
        
        
        
        <BR/><a href="indexORIGINAL.html">INICIO</a>  <BR/>
        <h1>Existencias en Bodegas</h1>
        
      <form name="frmexistenciaporbodegas" action="existenciasporbodegaRECIBE.jsp">
        
           Bodega a Consultar: <input required="true" type="text" id="txtproducto" name="txtproducto" value="" size="50" />
            <input type="submit" value="Consultar" name="btnconsultar" />
            <br><br><br><br>
        </form>
        
        
    <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
       DecimalFormat format = new DecimalFormat("0.00");
       
    
            
      
   //   float totales = datos.preciototal();
  //   int k = kardex.size();
     double totales=0.00;
  
 
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="100">Codigo </td> 
                 <td WIDTH="180">Descripcion   </td> 
                <td WIDTH="180">Cantidad   </td> 
                <td WIDTH="100">Ubicacion </td> 
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
     LinkedList <listaexistenciaproductosporbodega> existencias =datos.existenciaproductosporbodega();
    
     //borra la informacion que tien la tabla de mostrar los datos 
     datos.borratablaexistenciaproductosporbodega();
    
      for (int i=0;i<existencias.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+existencias.get(i).obtenercodigo() +"</td>");
   out.println("<td>"+existencias.get(i).obtenerdescripcion() +"</td>");
  out.println("<td>"+existencias.get(i).obtenercantidad() +"</td>");
   out.println("<td>"+existencias.get(i).obtenerubicacion() +"</td>");
   out.println("</tr>");
}//for
   
%>       
     
 
           </table>  

  
        
    </body>
</html>
