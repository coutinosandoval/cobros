<%-- 
    Document   : facturacion
    Created on : 28-sep-2014, 9:00:00
    Author     : Administrador
--%>
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
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
        <table border="1">
<tr>
<td WIDTH="20">Codigo.</td>    
                <td WIDTH="5">cantidad</td>  
                <td WIDTH="45">Grupo</td>    
                <td WIDTH="45">Destino</td>    
                <td WIDTH="10">Fecha Vencimiento</td>  
</tr>
<%
    
  LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 
for (int i=0;i<tablatemporal.size();i++)
{
   out.println("<tr>");
   out.println("<td>"+tablatemporal.get(i).getcodigo()+"</td>");
   out.println("<td>"+tablatemporal.get(i).getcantidad()+"</td>");
   out.println("<td>"+tablatemporal.get(i).getngrupo()+"</td>");
   out.println("<td>"+tablatemporal.get(i).getubicacion()+"</td>");
   out.println("<td>"+tablatemporal.get(i).getfvencimiento()+"</td>");
   out.println("<td>"+tablatemporal.get(i).getprecio()+"</td>");
   
   out.println("</tr>");
}
%>
</table>

        
    </body>
</html>
