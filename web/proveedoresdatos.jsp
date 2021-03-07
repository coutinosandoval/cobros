<%-- 
    Document   : proveedoresdatos
    Created on : 19/01/2016, 08:36:42 PM
    Author     : dcoutino
--%>

<%@page import="pconexion.proveedoresdatos"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
              
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
$("#txtnombreproveedor").autocomplete("reg_update_proveedores.jsp");
});

</script>
   
      
  
   
    </head>
    <body>
        
        
        
        
        <h1>Informacion de Proveedores</h1>
        <form name="frmproveedoresdatos" action="proveedoresdatosrecibe.jsp">
         <Br/>
            Nombre del Proveedor a Consultar:
            <input type="text" required="true" id="txtnombreproveedor" name="txtnombreproveedor" value="" size="40" />
         
         <Br/>
         <input type="submit" value="Consultar" name="btnconsultar" />
        
         <Br/> <Br/>
        </form>
  <BR/><a href="indexORIGINAL.html">INICIO</a>     
        
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
     datos.proveedores();
      
      LinkedList <proveedoresdatos> infoproveedor = datos.proveedoresdatos(); 
      datos.borrainformacionproveeores();
     
              
      
   //   float totales = datos.preciototal();
  //   int k = kardex.size();
  //   double precio=0.00;
  //   DecimalFormat format = new DecimalFormat("0.00");
  
  if (infoproveedor.size()>0)    
  {  
   out.println("<td>"+infoproveedor.get(0).obtenernombre() +"</td>");
   
   
 }//Fin if 
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="18">Nit</td>    
                <td WIDTH="100">Direccion</td>    
                <td WIDTH="70">Telefonos</td>    
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

   
      for (int i=0;i<infoproveedor.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+infoproveedor.get(i).obtenernit() +"</td>");
   out.println("<td>"+infoproveedor.get(i).obtenerdireccion() +"</td>");
   out.println("<td>"+infoproveedor.get(i).obtenertelefonos() +"</td>");
   
   
   out.println("</tr>");
}//for

%>       
          
 
           </table>  


        
        
    </body>
</html>
