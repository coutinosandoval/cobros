<%-- 
    Document   : planillainformacion
    Created on : 23/11/2015, 01:22:20 PM
    Author     : Administrador
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
        <h1>Ingresar Horas Extras, Dias faltados!</h1>
       <%    
       
        String nombre = request.getParameter("nombre");
        
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventario", "root", "987565");
Statement s1=con.createStatement(); 
Statement st1=con.createStatement();
ResultSet rs=st1.executeQuery("select * from planillasub WHERE codigoempleado ='"+nombre+"'");
 
rs.first();
        
     %>       
     <form name="frmplanillainformacionrecibe" action="plnaillainformacionRECIBE.jsp">
     
        
         <input type="text" readonly="true" name="codigo" value="<%= nombre %>" size="15">
     <input type="text" readonly="true" name="txtempleado" value="<% out.println(rs.getString(2));   %>" size="50" />
     <input type="text" readonly="true" name="txtfinca" value="<%out.println(rs.getString(3)); %>" size="20" />
     <input type="text" readonly="true" name="txtfecha" value="<%out.println(rs.getString(4)); %>" size="20" />
     <Br></Br> Horas Extras:  <input type="text" name="txthorasextras" value="" size="5" />
   Dias Faltados:  <input type="text" name="txtdiasfaltados" value="" size="15" />
    <Br></Br> <input type="submit" value="Guardar" name="btnguardar" />
     </form>
     
        
           
         
      
    </body>
</html>
