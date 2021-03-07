<%-- 
    Document   : facturamuestraejemplo
    Created on : 25/03/2016, 12:21:22 PM
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
        <%
            String factura = request.getParameter("factura");
            out.println(factura);
            %>
    </body>
</html>
