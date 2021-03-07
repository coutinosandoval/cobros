<%-- 
    Document   : Reportes
    Created on : 3/12/2015, 10:48:49 AM
    Author     : Administrador
--%>





<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager "%>
<%@page import="net.sf.jasperreports.engine.util.JRLoader"%>
<!DOCTYPE html>


 <%@ page import="net.sf.jasperreports.engine.*" %> <%@ page import="net.sf.jasperreports.engine.util.*" %> <%@ page import="net.sf.jasperreports.engine.export.*" %> <%@ page import="java.util.*" %> <%@ page import="java.io.*" %> <%@ page import="java.sql.*" %> <%@ page import="javax.naming.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import = "java.sql.Connection" %>
<%@page import="pconexion.conexion"%>
<%@page import="net.sf.jasperreports.*" %>
<%@page import="net.sf.jasperreports.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="net.sf.jasperreports.*"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
         
      <% 
 
          Connection conexion; Class.forName("com.mysql.jdbc.Driver").newInstance(); conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pvdb","root","987565");

        
//Cargamos la definicion del reporte *.jasper
File reportFile = new File(application.getRealPath("/reportes/misproductos.jasper"));

//cargamos parametros del reporte (si tiene).
Map parametros = new HashMap();

//Generar XLS.
//Preparacion del reporte (en esta etapa se inserta el valor del query en el reporte).

JasperPrint jasperPrint=JasperFillManager.fillReport(reportFile.getPath(), new HashMap(), conexion);

byte bytes [] = JasperRunManager.runReportToPdf(reportFile.getPath(),parametros,conexion);

response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream ouputStream  = response.getOutputStream();
ouputStream.write(bytes,0,bytes.length);
ouputStream.flush();
ouputStream.close();
//En este punto ya esta Creado el XLS

//Ahora lo Voy a Leer Y A forzar al Navegador Muestre Dialogo Para descargar el archivo
//Funciona En IE y Firefox

//Leer el archivo.

%>
         
    </body>
</html>
