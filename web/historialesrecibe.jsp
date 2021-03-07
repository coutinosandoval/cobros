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
        <title>historiales</title>
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

 int filas = datos.insertarhistorialescopia(codvendedor,fechai,fechaf);
   

 if (filas ==1 )
        {
     %>
  <jsp:forward page="historiales.jsp"/>
    
     <%   
         
 }//if filas                   
  else 
           {%>
     <center>
         <h2><font color="#00d10">NO SE AGREGO INFORMACION A LA TABLA <%=codvendedor%>  </font></h2> 
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
