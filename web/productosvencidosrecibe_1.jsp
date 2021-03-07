<%-- 
    Document   : productosvencidosrecibe
    Created on : 12-oct-2014, 12:59:48
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
      
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
        
        
        <%
            
        if(request.getParameter("fechainicial") != null)
        { 
try
{   
String fechai = request.getParameter("fechainicial");
String fechaf = request.getParameter("fechafechafinal");

 int filas = datos.insertarproductosvencidos(fechai,fechaf);
   

 if (filas ==1 )
        {
     %>
  <jsp:forward page="productosvencidos.jsp"/>
    
     <%   
         
 }//if filas                   
  else 
           {%>
     <center>
         <h2><font color="#00d10">NO SE AGREGO INFORMACION A LA TABLA <%=filas%>  </font></h2> 
        <% }//else
 
  
         
}//try                     
      
catch (Exception e)
        {
    out.println("Error  "+ e.getMessage());
    
}//fin catch
}   //if            
        
        
  
        
        
        %>
    
        
    </body>
</html>
