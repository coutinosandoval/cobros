<%-- 
    Document   : consultaporbodegass
    Created on : 19-oct-2014, 11:34:34
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
        <title>consulta</title>
    </head>
    <body>
        <h1>Consulta de Existencia de Productos por Bodega!</h1>
        
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
         
        <%
     datos.proveedores();
       
      LinkedList <grupobodegas> listabodegas = datos.grupoBodegas();
 
%> 
<form name="FRMcompras" action="consultaporbodegasrecibe.jsp" method="POST">

    Bodega a Consultar:<select  id="cbobodegas" name="cbobodegas" 
              onchange="document.FRMcompras.txtbodega.value=document.FRMcompras.cbobodegas.options[FRMcompras.cbobodegas.selectedIndex].text;">
    <option value="0" selected>...Seleccione la bodega...</option>    
    <%
for (int m=0;m<listabodegas.size();m++)
{
 %>
 <option value="<%=m%>"><%=listabodegas.get(m).getsetdescripcion()%></option>

<%                   
}
%>  
  </select>
<BR/>

       
<BR/>
<BR/>

<input type="text" name="txtbodega" hidden="true" value=""  />           
        

<BR/><input type="submit" value="Consultar" id ="btnguardar" name="btnguardar" />

</form>
<BR/><a href="consultas.html">REGRESAR</a>      
    </body>
</html>
