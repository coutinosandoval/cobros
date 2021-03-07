<%-- 
    Document   : existenciasporbodegas
    Created on : 1/03/2016, 02:39:10 PM
    Author     : dcoutino
--%>

<%@page import="pconexion.listaexistenciaproductosporbodega"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Existencias</title>
    </head>
    <body>
        <h1>Existencias de Productos Por Bodegas</h1>
        
      
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
                <td WIDTH="180">Ubicacion   </td> 
                <td WIDTH="100">Cantidad </td> 
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
     LinkedList <listaexistenciaproductosporbodega> existencias =datos.existenciaproductosporbodega();
    
  // LinkedList <mostrarsaldosclientesgeneral> clientes = datos.mostrarsaldosclientes();
     
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
