<%-- 
    Document   : cancelarfacturacliente
    Created on : 29/02/2016, 11:35:53 AM
    Author     : dcoutino

    ESTA PAGINA RECIBE EL NUMERO DE LA FACTURA DE LA CUAL SE HARAN DEVOLUCIONES
POR PARTE DEL CLIENTE, PARA LUEGO INVOCAR UNA CLASE QUE TOME TODOS LOS PRODUCTOS
DE LA TABLA VENTAS, LA INTRODUCE A OTRA LLAMADA DEVOLUCIONCLIENTES, PARA SEGUIDAMENTE
INVOCAR OTRA PAGINA, DONDE SE MOSTRARAN TODOS LOS DATOS DE LA FACTURA
--%>

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
            
       String codigo = request.getParameter("codigo");
       String factura = request.getParameter("factura");
try
{   


 int filas = datos.retornadevolucionaproveedores(codigo,factura);
// String bandera ="verdadero";      
 
 %>
    
     <%
 if (filas ==1 )
        {
     %>
         
    <script>alert("Producto ha salido de Inventario");
     
    window.location.href='devolucionesclientesMuestra.jsp';

     </script> 
     <%
         
 }//if filas                   
  else 
           {%>
     <script>alert("Ha ocurrido un error");
     
    window.location.href='index.html';

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
