<%-- 
    Document   : comprasrealizadasrecibe2
    Created on : 11/12/2014, 11:02:22 PM
    Author     : Administrador
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1></h1>
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
        
        
        <%
             String fechai = request.getParameter("txtfechai");
            String fechaf = request.getParameter("txtfechaf");

    String codigos = "demsshill";
            String dato ="informacion";
            try 
            {
           
                int filas = datos.comprasrealizadas(codigos,fechai,fechaf);

 if (filas ==1 )
        {
     %>
    
  <script>("Informacion Almacenada");
     
    window.location.href='comprasrealizadast.jsp';

     </script> 
     
     <%   
         
 }//if filas                   
  else 
           {%>
    <script>("Empleado Almacenado");
     
    window.location.href='../validacion.jsp';

     </script>   <% }//else
 
 
            }
            catch (Exception e)
        {
    out.println("Error  "+ e.getMessage());
    
}//fin catch
            
        %> 
  
        <form name="forma">
            <input type="text" name="nombre" value="<%= fechai %>" />  
            <input type="text" name="nombre" value="<%= fechaf %>" />  
            <input type="text" name="nombre" value="<%= codigos %>" />  
            
        </form>
        
    </body>
</html>
