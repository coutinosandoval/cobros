<%-- 
    Document   : empleadonuevo
    Created on : 10/08/2015, 09:44:12 PM
    Author     : Administrador
--%>

<%@page import="pconexion.grupousuarios"%>
<%@page import="pconexion.grupopaginas"%>
<%@page import="pconexion.gruporoles"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>roles-pagina</title>
    </head>
    <body>
        <BR/><a href="indexORIGINAL.html">INICIO</a>  <BR/><BR/><BR/>
        <h1>Asignacion de Roles a Usuarios</h1>
     
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
            <%
     datos.proveedores();
     
     LinkedList <gruporoles> roles = datos.grupoRoles();
     LinkedList <grupousuarios> usuarios = datos.grupoUsuarios();
     
%> 
  
        
        <BR/><BR/>
        <form name="frmroles" action="rolesausuariosRECIBE.jsp">
       
        <BR/> Rol: <select required="true" name="cbogrupoproductos" id="cbogrupoproductos" 
                   onchange="document.frmroles.txtrol.value=document.frmroles.cbogrupoproductos.options[frmroles.cbogrupoproductos.selectedIndex].text;"> 
    
       <option value="0" selected>...Seleccione el Rol...</option>
   <%
for (int m=0;m<roles.size();m++)
{
 %>
 <option value="<%=m%>"><%=roles.get(m).getrol() %></option>

<%                   
}
%> 
   
   </select>

 Usuario <select required="true" name="cbogrupopaginas" id="cbogrupopaginas" 
         onchange="document.frmroles.txtpagina.value=document.frmroles.cbogrupopaginas.options[frmroles.cbogrupopaginas.selectedIndex].text;"> 
    
       <option value="0" selected>...Seleccione Pagina...</option>
   <%
for (int n=0;n<usuarios.size();n++)
{
 %>
 <option value="<%=n%>"><%=usuarios.get(n).getusuario()%></option>

<%                   
}
%> 
   
   </select>

 <BR/>
           
 <input type="text" hidden="true" name="txtrol" value="" size="15" required="true" />
  <input type="text" hidden="true" name="txtpagina" value="" size="25" required="true" />
           
            <br>
            <input type="submit" value="Guardar" name="btnguardarempleado" />
        </form>
         
    </body>
</html>
