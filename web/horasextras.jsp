<%-- 
    Document   : horasextras
    Created on : 23/11/2015, 12:39:52 PM
    Author     : Administrador
--%>

<%@page import="pconexion.listaempleadosplanilla"%>
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
        <title>info planilla</title>
        
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
      $(".fecha") .calendarioDW();
      
      //validar numero entero
      
       $(".campofechafin") .calendarioDW();
        
   })
   </script>

<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery.autocomplete.js"></script>
<script language="javascript" type="text/javascript">



jQuery(function(){
$("#txthoras").autocomplete("reg_update_fincas_nombres.jsp");
});
</script>
   
   
      
        
    </head>
    <body>
        <h4>Ingres nombre de la finca de la cual desea ingresar informacion</h4>
        <h4>Luego eliga el nombre del empleado para agregar Horas Extras, y Dias faltados</h4>
        <br></br>
        <form name="frmhorasextras" action="horasextrasRECIBE.jsp">
            
            Finca a Ingresar Horas Extras: <input required="true" type="text" id="txthoras" name="txthoras" value="" size="30" />
            Fecha de Ingreso Informacion: <input required="true"  type="text" name="txtfecha" class="fecha" value="" size="10" />
         <br></br>
            <input type="submit" value="Consultar" name="btnhorasextras" />
            
        </form>     
   
   <BR/><a href="indexORIGINAL.html">INICIO</a>
        <br></br>         
        <br></br>  
                
    <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
     datos.proveedores();
       
       datos.borratablakardex();
      LinkedList <listaempleadosplanilla> empleados = datos.listaempleadosplanilla();
              
      
   //   float totales = datos.preciototal();
  //   int k = kardex.size();
  //   double precio=0.00;
  //   DecimalFormat format = new DecimalFormat("0.00");
  
  
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="380">Empleados</td>  
                <td WIDTH="380">Ingresar Informacion Para Planilla</td>  
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

   
      for (int i=0;i<empleados.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+empleados.get(i).getempleado() +"</td>");
   out.println("<td>" + "<a href=planillainformacion.jsp?nombre="+ empleados.get(i).getcodigo() +">"+"Agregar"+"</a>"+"</td>");
   
   out.println("</tr>");
}//for

%>       
          
 
           </table>  

  
        
    </body>
</html>
