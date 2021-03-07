<%-- 
    Document   : llenatabla
    Created on : 1/09/2015, 09:29:45 PM
    Author     : Administrador
--%>
<%@page import="pconexion.conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        
      <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
        
        
        <%
            
       
try
{   
String descripcionproducto=request.getParameter("txtcodigoproducto") ;
String fechainicial=request.getParameter("fechainicio");
String fechafinal=request.getParameter("fechafinal");
String ubicacion=request.getParameter("txtubicacion");

int filas2 = datos.depurakardex2(); 
int filas = datos.pruebasllenado3(descripcionproducto,fechainicial,fechafinal,ubicacion) ;
 
  //filas =1;
 if (filas ==1 )
        {
            response.sendRedirect("kardexconsultas.jsp");
     
         
 }//if filas                   
  else 
           {%>
     <script>alert("Codigo de Producto No Existe");
     
    window.location.href='kardexconsultas.jsp';

     </script> 
        <% }//else
 
 
         
}//try                     
      
catch (Exception e)
        {
    out.println("Error  "+ e.getMessage());
    
}//fin catch
        
        %>  
        
        
        
        
    </body>
</html>
