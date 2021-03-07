<%-- 
    Document   : inventario
    Created on : 10/05/2016, 10:16:14 AM
    Author     : Administrador
--%>

<%@page import="pconexion.grupoinventario"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventario</title>
    </head>
    <body>
        <h1>Inventario de Productos</h1>
        
      <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
        <%
            
      // datos.inventario();
     //  datos.grupoInventario();
     //datos.proveedores();
     
       //BORRA DE LA TABLA EXISTENCIAINVENTARIO
     datos.borratablaexistenciasinventario();  
      LinkedList <grupoinventario> inventario = datos.grupoInventario(); 
     
%>     
        
        <BR/><a href="indexORIGINAL.html">INICIO</a>
        <BR/><BR/>
     
     <%-- 
    
 
        <form name="frminventario" action="inventarioRECIBE.jsp">
            <input type="submit" value="Consultar" name="btnconsultar" />
        </form>
--%>          
    <table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="100">Codigo</td>    
                <td WIDTH="500">Descripcion</td>    
                <td WIDTH="100">Total</td> 
                
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

   
      for (int i=0;i<inventario.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+inventario.get(i).getcodigoproducto() +"</td>");
   out.println("<td>"+inventario.get(i).getdescripcionproducto() +"</td>");
   out.println("<td>"+inventario.get(i).getcantidad()+"</td>");
   
}//for
      
%>       
          
 
           </table>  


        
      
        
        
    </body>
</html>
