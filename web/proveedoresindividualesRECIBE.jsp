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
String descripcioncliente=request.getParameter("txtcliente") ;
String fechainicial=request.getParameter("txtfechainicial");
String fechafinal=request.getParameter("txtfechafinal");
//String ubicacion=request.getParameter("txtubicacion");
//descripcioncliente="DELUC";
//int filas2 = datos.depurakardex2(); 
//int filas = datos.acreedoresindividual(descripcioncliente,fechainicial,fechafinal) ;
 int filas = datos.proveedorindividuals(descripcioncliente,fechainicial,fechafinal);
  //filas =1;
 if (filas ==1 )
        {
            response.sendRedirect("proveedoresindividuales.jsp");
     
         
 }//if filas                   
  else 
           {%>
     <script>alert("Cliente No Existe");
     
    window.location.href='proveedoresindividuales.jsp';

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
