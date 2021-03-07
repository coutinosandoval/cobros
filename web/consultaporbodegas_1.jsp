<%-- 
    Document   : consultaporbodegas
    Created on : 19-oct-2014, 10:06:08
    Author     : Administrador
--%>
<%@page import="pconexion.listaexistencias"%>
<%@page import="pconexion.listaexistencias2"%>
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
        <title>bodegas</title>
    </head>
    <body>
        
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
          <%
     datos.proveedores();
       
      LinkedList <grupobodegas> listabodegas = datos.grupoBodegas();
LinkedList <listaexistencias2> tablaexistencias = datos.listaexistencias2(); 
 
datos.borratablaexistenciaporbodega();

%> 
     <table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="16">Codigo</td>  
                <td WIDTH="85">Descripcion</td>  
                 <td WIDTH="5">Existencia</td>  
                <td WIDTH="45">Ubicacion</td>    
                  
                
            </tr> 
         
          <%
  
    
    
  
for (int i=0;i<tablaexistencias.size();i++)
{ 
   
    
   out.println("<tr>");
   out.println("<td>"+tablaexistencias.get(i).obtenercodigoproducto()+"</td>");
   out.println("<td>"+tablaexistencias.get(i).obtenerubicacion()+"</td>"  );
   out.println("<td>"+tablaexistencias.get(i).obtenercantidadproducto()+"</td>");
   out.println("<td>"+tablaexistencias.get(i).obtenerdescripcion()+"</td>");
   
   
  
   
   out.println("</tr>");
}
%>       
  
           </table>

<BR/><a href="consultaporbodegass.jsp">NUEVA CONSULTA POR BODEGA</a> 
    </body>
</html>
