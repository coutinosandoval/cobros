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
$("#txtproducto").autocomplete("reg_muestra_lista_productos.jsp");
});
</script>
   
      
        

        
    </head>
    <body>
        <BR/><a href="indexORIGINAL.html">INICIO</a>  <BR/>
        <h1>Existencias de Productos Por Bodegas</h1>
        
        <form name="frmexistenciaporproductos" action="existenciasporproductosRECIBE.jsp">
        
            Producto a Consultar: <input required="true" type="text" id="txtproducto" name="txtproducto" value="" size="50" />
            <input type="submit" value="Consultar" name="btnconsultar" />
            <br><br><br><br>
        </form>
        
        
        
    <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
       DecimalFormat format = new DecimalFormat("0.00");
       
    
            
      
   //   float totales = datos.preciototal();
  //   int k = kardex.size();
     double totales=0.00;
  LinkedList <listaexistenciaproductos> existencias =datos.existenciaproductos();
    
  
  
  datos.borratablaexistenciastemporal();
   
 
  if (existencias.size()>0)    
  {  
   out.println("<td>"+existencias.get(0).obtenerdescripcion()  +"</td>");
   out.println();
   out.println();
   
   
 }//Fin if 
  
  
  
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="100">Codigo </td> 
                <td WIDTH="100">Cantidad </td> 
                <td WIDTH="180">Ubicacion   </td> 
                
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
     
     
   
      
      for (int i=0;i<existencias.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+existencias.get(i).obtenercodigo() +"</td>");
   out.println("<td>"+existencias.get(i).obtenercantidad() +"</td>");
   out.println("<td>"+existencias.get(i).obtenerubicacion() +"</td>");
   out.println("</tr>");
}//for

%>       
     
 
           </table>  

  
        
    </body>
</html>
