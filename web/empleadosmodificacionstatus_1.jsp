<%-- 
    Document   : empleadosmodificacionstatus
    Created on : 21/01/2016, 09:00:03 AM
    Author     : dcoutino
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Modificacion de Status del empleado</h1>
        
        <%    
       
        String codempleado = request.getParameter("codigo");
        
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventario", "root", "987565");
Statement s1=con.createStatement(); 
Statement st1=con.createStatement();
ResultSet rs=st1.executeQuery("select * from empleados WHERE codigoempleado ='"+codempleado+"'");
 
rs.first();
        
     %>  
     <form name="pruebas" id="pruebas"  action="empleadosstatusRecibe.jsp">
         Codigo:<input type="text" readonly="true" name="codigo" value="<%= rs.getString(1) %>" size="10" maxlength="10">
    Nombre: <input type="text" disabled="true" name="nombre" value="<%= rs.getString(2) %>" size="45">
    <Br/>
    
    Tipo Trabajo:  <input type="text" disabled="true" name="tipotrabajo" value="<%= rs.getString(3) %>" size="15" maxlength="15">
    Finca Asignada:<input type="text" disabled="true" name="fincaasignada" value="<%= rs.getString(5) %>" size="15" maxlength="15">
    Fecha de Ingreso: <input type="text" disabled="true" name="fechaingreso" value="<%= rs.getString(4) %>" size="10" maxlength="10">
    <BR/> Status: <select required="true" name="cbostatus" id="cbostatus" onchange="document.pruebas.status.value=document.pruebas.cbostatus.options[pruebas.cbostatus.selectedIndex].text;"> 
    
       <option value="0" selected>ACTIVO</option>
       <option value="1" selected> BAJA</option>
   
   
   </select>
    <input type="text" readonly="true"  id="status" name="status" value="<%= rs.getString(6) %>" size="6"maxlength="6">
    <input type="submit" value="Modificar" name="btnmodificar" />
    
     </form>
     
     
     
     
    </body>
</html>
