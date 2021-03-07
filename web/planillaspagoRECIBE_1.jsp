<%-- 
    Document   : planillaspagoRECIBE
    Created on : 24/11/2015, 12:37:01 AM
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
        <title></title>
    </head>
    <body>
        <h1></h1>
        
      <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
       
        
        
        <%
            
       
try
{  
int planilla = datos.borrarplanillatemporal();
//  datos.borrar   .borrarplanillatemporal;
String finca=request.getParameter("txtfinca") ;
String fechainicial=request.getParameter("fechainicio");
String fechafinal=request.getParameter("fechafinal");


 int filas = datos.generaplanilla(finca,fechainicial,fechafinal) ;
 //int filas2 = datos.depurakardex2();
  //filas =1;
 if (filas ==1 )
        {
            response.sendRedirect("planillaspago.jsp");
     
         
 }//if filas                   
  else 
           {%>
     <script>alert("No hay empleados activos en este periodo");
     
    window.location.href='planillaspago.jsp';

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
