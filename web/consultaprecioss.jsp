<%-- 
    Document   : consultaprecioss
    Created on : 21-oct-2014, 22:29:55
    Author     : Administrador
--%>
 <%@page import="java.text.DecimalFormat" %>
 
<%@page import="pconexion.precioproducto"%>
<%@page import="pconexion.listaproductos"%>
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
        <title>precio</title>
    </head>
    <body>
        <h1>Consulta de precios unitarios de productos!</h1>
      
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
     
         <%
     datos.proveedores();
       
      LinkedList <listaproductos> listaproductos = datos.listadoproductos();
      LinkedList <precioproducto> preciodeproductos = datos.precioproducto();
      datos.borrapreciosconsulta();
      DecimalFormat format = new DecimalFormat("0.00");
%> 
<form name="frmproductoaconsultar" action="consultapreciosrecibe.jsp" method="POST"> 
 Bodega a Consultar:<select  id="cbobodegas" name="cbobodegas"                                                                                      
              onchange=
  "document.frmproductoaconsultar.txtcodigoproducto.value=document.frmproductoaconsultar.cbobodegas.selectedIndex  ;
  document.frmproductoaconsultar.txtdescripcion.value=document.frmproductoaconsultar.cbobodegas.options[frmproductoaconsultar.cbobodegas.selectedIndex].text;      ">
  <option value="0" selected>...Seleccione el Producto...</option>   
    <%
for (int m=0;m<listaproductos.size();m++)
{
 %>
 <option value="<%=listaproductos.get(m).getcodigo()%>"><%=listaproductos.get(m).getnombreproducto() %></option>

<%                   
}
%>  
  </select>
<BR/>

       
<BR/>
<BR/>

<input type="text" name="txtcodigoproducto"  value="" hidden="true"  />           
<input type="text" name="txtdescripcion"  value="" hidden="true"  />    
        

<BR/><input type="submit" value="Consultar" id ="btnguardar" name="btnguardar" />



</form>

 %> 
     <table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="16">Codigo</td>  
                <td WIDTH="85">Descripcion</td>  
                 <td WIDTH="5">Existencia</td>  
                 <td WIDTH="5">Precio de Compra</td>  
                <td WIDTH="45">Ubicacion</td>    
                  
                
            </tr> 
         
          <%
  
    
    
  
for (int i=0;i<preciodeproductos.size();i++)
{ 
    
   out.println("<tr>");
   out.println("<td>"+preciodeproductos.get(i).obtenercodigoproducto()+"</td>");
   out.println("<td>"+preciodeproductos.get(i).obtenerdescripcion()+"</td>");
   out.println("<td>"+preciodeproductos.get(i).obtenercantidadproducto()+"</td>");
   out.println("<td>"+(format.format(preciodeproductos.get(i).obtenerprecio())) +"</td>");
   out.println("<td>"+preciodeproductos.get(i).obtenerubicacion()+"</td>"  );
   
   out.println("</tr>");
}
%>     
  
           </table>       
  
  <BR/><a href="consultas.html">REGRESAR</a>    
    </body>
</html>
