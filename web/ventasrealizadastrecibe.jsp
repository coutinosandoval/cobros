<%-- 
    Document   : historialesrecibe
    Created on : 13-oct-2014, 21:22:08
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
            
        if(request.getParameter("txtcodigo") != null)
        { 
try
{  
String codvendedor = request.getParameter("txtcodigo");   
String fechai = request.getParameter("txtfechai");
String fechaf = request.getParameter("txtfechaf");
String codigos = "demsshill";

 //int filas = datos.insertarhistorialescopia2(codvendedor,fechai,fechaf);
//int filas = datos.ventas2(codigos,fechai,fechaf);
 int filas = datos.ventasrealizadas(codigos,fechai,fechaf);

 if (filas ==1 )
        {
     %>
    
  <script>("Empleado Almacenado");
     
    window.location.href='ventasrealizadast.jsp';

     </script> 
     
     <%   
         
 }//if filas                   
  else 
           {%>
    <script>("Empleado Almacenado");
     
    window.location.href='index.html';

     </script>   <% }//else
 
  
         
}//try                     
      
catch (Exception e)
        {
    out.println("Error  "+ e.getMessage());
    
}//fin catch
}   //if            
        
        
  
        
        
        %>
    
    </body>
</html>
