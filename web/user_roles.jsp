<%-- 
    Document   : user_roles
    Created on : 27/04/2016, 02:38:20 PM
    Author     : Administrador
--%>

<%@page import="pconexion.grupousuarios"%>
<%@page import="pconexion.gruporoles"%>
<%@page import="pconexion.grupopaginas"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Asignacion de Roles a Usuarios</h1>
        
     <BR/><a href="indexORIGINAL.html">INICIO</a>  <BR/><BR/><BR/>
        
     
        <jsp:useBean id="datos" scope="session"  class="pconexion.conexion" />
            <%
     datos.proveedores();
     
     LinkedList <gruporoles> roles = datos.grupoRoles();
    // LinkedList <grupopaginas> paginas = datos.grupoPaginas();
     LinkedList <grupousuarios> paginas = datos.grupoUsuarios();
     
     
     
%>     
        
        <form name="frmuserroles" action="user_rolesRECIBE.jsp">
            
       
     

 Usuario <select required="true" name="cbogrupopaginas" id="cbogrupopaginas" 
         onchange="document.frmuserroles.txtuser.value=document.frmuserroles.cbogrupopaginas.options[frmuserroles.cbogrupopaginas.selectedIndex].text;"> 
    
       <option value="0" selected>...Seleccione Pagina...</option>
   <%
for (int m=0;m<paginas.size();m++)
{
 %>
 <option value="<%=m%>"><%=paginas.get(m).getusuario() %></option>

<%                   
}
%> 
   
   </select>

    Rol: <select required="true" name="cbogrupoproductos" id="cbogrupoproductos" onchange="document.frmuserroles.txtrol.value=document.frmuserroles.cbogrupoproductos.options[frmuserroles.cbogrupoproductos.selectedIndex].text;"> 
    
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

 


 <BR/>
           
 <input type="text" name="txtrol" hidden="true"  value="" size="15" required="true" />
 <input type="text" name="txtuser" hidden="true" value="" size="25" required="true" />
            
            <br>
            <input type="submit" value="Guardad" name="btnguardarempleado" />
          
            
        </form>
        
    </body>
</html>
