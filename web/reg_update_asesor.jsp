<%-- 
    Document   : reg_update
    Created on : 14/10/2015, 02:00:44 PM
    Author     : Administrador
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pvdb", "root", "987565");
Statement s1=con.createStatement(); 
Statement st1=con.createStatement();
ResultSet rs=st1.executeQuery("select * from colaborador");
String product="";
ArrayList aa=new ArrayList();
while(rs.next())
{
aa.add(rs.getString("nombres").trim());
}
int cnt=0;
String query = (String)request.getParameter("q");

for(int i=0;i<aa.size();i++)
{
String temp=(String) aa.get(i);

if(temp.toUpperCase().startsWith(query.toUpperCase()))
{
out.print(temp+"\n");
if(cnt>=10)
break;
cnt++;
}
}

}
catch(Exception ex)
{
System.out.println("error"+ex);
}

%>
