<%-- 
    Document   : comprasRECIBE
    Created on : 08-sep-2014, 14:47:49
    Author     : Administrador
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Collection"%>
<%@page import="pconexion.conexion"%>
<%@page import="pconexion.depto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <table id="mytable" BORDER="0">
            <tr>
                <td WIDTH="30">No.</td>    
                 
                <td WIDTH="120">Primer Apellido</td>  
                <td WIDTH="120">Segundo Apellido</td>    
                <td WIDTH="120">Primer Nombre</td>    
                <td WIDTH="120">Segundo Nombre</td>    
                <td WIDTH="30">Nota1</td>    
                <td WIDTH="30">Nota 2</td> 
                <td WIDTH="30">Nota 3</td> 
                <td WIDTH="30">Nota 4</td> 
                <td WIDTH="30">Promedio </td> 
             </tr>   
        <jsp:useBean id="datos" scope="session"  class = "pconexion.conexion" />
    <jsp:useBean id="datos2" scope="session" class = "pconexion.depto" />
 <%
       datos.proveedores();
       
      
            
      LinkedList <depto> listanotas = datos.proveedores();
     int g = listanotas.size();
     
     
  
%>  
     
    </body>
</html>
