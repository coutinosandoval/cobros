<%-- 
    Document   : existencias
    Created on : 12-oct-2014, 0:30:58
    Author     : Administrador
PAGINA QUE MUESTRA LA EXISTENCIA DE PRODUCTOS EN BODEGAS, DE FORMA GENERAL
ES DECIR QUE HAY EN CADA BODEGA
--%>
<%@page import="pconexion.listaexistencias"%>
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
        <title>existencia</title>
    </head>
    <body>
        <h1>EXISTENCIAS DE PRODUCTOS</h1>
        
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
            <%
    
       LinkedList <listaexistencias> tablaexistencias = datos.listaexistencias(); 
      
    
%> 
        
        <table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="16">Codigo</td>  
                <td WIDTH="85">Descripcion</td>  
                 <td WIDTH="5">Existencia</td>  
                <td WIDTH="45">Ubicacion</td>    
                  
                
            </tr> 
         
          <%
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
for (int i=0;i<tablaexistencias.size();i++)
{ 
   
    
   out.println("<tr>");
   out.println("<td>"+tablaexistencias.get(i).obtenercodigoproducto()+"</td>");
   out.println("<td>"+tablaexistencias.get(i).obtenerdescripcion()+"</td>");
   out.println("<td>"+tablaexistencias.get(i).obtenercantidadproducto()+"</td>");
   out.println("<td>"+tablaexistencias.get(i).obtenerubicacion()+"</td>");
   
  
   
   out.println("</tr>");
}
%>       
          
  
           </table> 
<BR/><a href="consultas.html">REGRESAR</a>
    </body>
</html>
