<%-- 
    Document   : planillaspago
    Created on : 24/11/2015, 12:38:21 AM
    Author     : Administrador
--%>
<%@page import="pconexion.listaplanilla"%>
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
        <title>planillas</title>
        
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
$("#txtfinca").autocomplete("reg_update_fincas_nombres.jsp");
});
</script>
   
      
       
        
    </head>
    <body>
        <h1>Generacion de Planilla</h1>
        <form name="frmplanillas" action="planillaspagoRECIBE.jsp">
        Fecha de Inicio:<input required="true" type="text" name="fechainicio" class="campofechainicio" maxlength="10" size="10">    
        Fecha de Fin <input required="true" type="text" name="fechafinal" class="campofechafin" maxlength="10" size="10">    
            
            
            <BR/> Finca A genera Planilla:<input Id ="txtfinca" type="text" maxlength="60" required="true"  name="txtfinca" value="" size="60" />
         
          
          <br></br>
            <input type="submit" value="Consultar" name="btnconsultar" />    
            
        </form> 
        
        <BR/><a href="Reportes_Planilla.jsp">Imprimir Planilla</a>
        <BR/><a href="indexORIGINAL.html">INICIO</a>
        <br></br>
        
       
    <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
     datos.proveedores();
       
      LinkedList <listaplanilla> planilla = datos.listaplanilla(); 
      LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
      datos.borratablakardex();
     
   
      DecimalFormat df = new DecimalFormat("0.00"); 
        //System.out.println(df.format(x));  
      
      
   //   float totales = datos.preciototal();
  //   int k = kardex.size();
  //   double precio=0.00;
  //   DecimalFormat format = new DecimalFormat("0.00");
  
  if (planilla.size()>0)    
  {  
   out.println("<td>"+planilla.get(0).getfinca() +"</td>");      
 }//Fin if 
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="280">Empleado</td>    
                <td WIDTH="70">Salario Base</td>    
                <td WIDTH="70">Horas Extras</td>    
                <td WIDTH="70">Prestamos</td>    
                <td WIDTH="70">Igss</td> 
                <td WIDTH="70">Septimo</td> 
                <td WIDTH="70">Sueldo Liquido</td> 
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

   
      for (int i=0;i<planilla.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+planilla.get(i).getempleado() +"</td>");
   out.println("<td>"+(df.format(planilla.get(i).getsueldobase())) +"</td>");
   out.println("<td>"+(df.format(planilla.get(i).gethorasextras()))+"</td>");
   out.println("<td>"+(df.format(planilla.get(i).getprestamos()))+"</td>  ");
   out.println("<td>"+(df.format(planilla.get(i).getiggs()))+"</td>  ");
   out.println("<td>"+(df.format(planilla.get(i).getseptimo()))+"</td>  ");
   out.println("<td>"+(df.format(planilla.get(i).getsueldoliquido()))+"</td>  ");
   
   
   out.println("</tr>");
}//for

%>       
          
 
           </table>    
        
    </body>
</html>
