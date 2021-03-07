<%-- 
    Document   : empleadosstatusrecibe
    Created on : 20/01/2016, 08:38:19 AM
    Author     : dcoutino
--%>

<%@page import="pconexion.listaempleadosexistentes"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Status Empleado</h1>
        
        <BR/><a href="indexORIGINAL.html">INICIO</a>     
        <BR/><BR/>
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
   <%
     datos.proveedores();
      
      LinkedList <listaempleadosexistentes> infoproveedor = datos.empleadosstatus(request.getParameter("txtempleado")); 
      datos.borrainformacionproveeores();
     
              
      
   //   float totales = datos.preciototal();
  //   int k = kardex.size();
  //   double precio=0.00;
  //   DecimalFormat format = new DecimalFormat("0.00");
  
  if (infoproveedor.size()>0)    
  {  
   out.println("<td>"+infoproveedor.get(0).obtenerempleado() +"</td>");
   
   
 }//Fin if 
%>      
 

<table id="mytable" BORDER="1">
            <tr>
                <td WIDTH="18">Codigo</td>    
                <td WIDTH="100">Tipo de Trabajo</td>    
                <td WIDTH="70">Fecha de Ingreso</td>    
                <td WIDTH="70">Finca</td>   
                <td WIDTH="70">Status</td>   
                
                
            </tr> 
         
          <%
   
    
  //LinkedList <listatablatemporal> tablatemporal = datos.listatablatemporal(); 

   
      for (int i=0;i<infoproveedor.size();i++)
  { 
 
    
   out.println("<tr>");
   out.println("<td>"+infoproveedor.get(i).obtenercodigoempleado() +"</td>");
   out.println("<td>"+infoproveedor.get(i).obtenertipotrabajo() +"</td>");
   out.println("<td>"+infoproveedor.get(i).obtenerfechaingreso() +"</td>");
   out.println("<td>"+infoproveedor.get(i).obtenernombrefinca() +"</td>");
   out.println("<td>"+infoproveedor.get(i).obtenerstatus() +"</td>");
   out.println("<td>" + "<a href=empleadosmodificacionstatus.jsp?codigo="+ infoproveedor.get(i).obtenercodigoempleado() +">"+"Modificar Status"+"</a>"+"</td>");
   
   out.println("</tr>");
}//for

%>       
          
 
           </table>  

        
    </body>
</html>
