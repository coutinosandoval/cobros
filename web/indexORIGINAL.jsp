<%-- 
    Document   : indexORIGINAL
    Created on : 13/08/2020, 12:06:53 PM
    Author     : Dell
--%>


<%@page import="org.apache.coyote.http11.Constants.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style type="text/css">
		.menu{
    list-style:none;
	padding:0px;
	margin:0px;
}
.menu li{
	margin:0px;
	padding:0px;
	float:left;
	position:relative;
	box-shadow: 2px 2px 4px 1px #000;	
}
.menu li a{
	display: block;
	width: 150px;
	height: 45px;
	padding: 6px;
	line-height:30px;
	text-decoration: none;
	text-align: center;
	color: #FFF;
	background-color: #063;
	position: relative;
	border-left: 2px solid #333;
 
}
.menu li a:hover{
	color:#CF3;
	background-color:#603;
}

.menu ul{
    position:absolute;
	left:10px;
	top:36px;
	margin:0px;
	list-style:none;
	padding:0px;
	opacity:0;
	transition:opacity .35s ease .2s;
	-webkit-transition:opacity .35s ease .2s;
	-moz-transition:opacity .35s ease .2s;
	-o-transition:opacity .35s ease .2s;
	visibility:hidden;	
}
.menu ul li a{
	border-bottom:2px solid #333;
	border-left:none;
	display:block;
	text-align:left;
}

.menu li:hover ul{
    opacity:1;
	visibility:visible;
}
			
		</style>
             
                
        
    </head>
    <body>
        <h1>Hello World!</h1>
        
       
        <div id="header">
	<ul class="menu">
				
                                
    <% 
        int creabodega=0;
        int ingresaproducto=0;
        int ingresaproveedor=01;
        int ingresagrupobodegas=0;
        
        //SEGUNDO MENU COMPRA-VENTA
        int ventas=01;
        int compras=01;
                                       
        int bodegas=01;  
        int ventascompras=01;
            
           if (bodegas ==0 )
            {
                %>
                    <li><a style="display: none" href="">Bodegas</a> </li>                                 
                <%   
         
            }//if filas                   
            else 
               {
                %>
                    <li><a href="">Bodegas</a>
                        <ul>
                            <%
                                if (creabodega==0){%>
                                    <li><a style="display: none" href="bodegaENVIA.html">Crear Nueva Bodega</a></li>   
                                    <% }
                                else {%>
                                    <li><a  href="bodegaENVIA.html">Crear Nueva Bodega</a></li>  
                                    <% } 
                            %>                   
                             
		            
                             <%
                                if (ingresaproveedor==0){%>
                                    <li><a style="display: none" href="ingresoPROVEEDORES.html">Ingresar Nuevo Proveedor</a></li>
                                    <% }
                                else {%>
                                    <li><a  href="ingresoPROVEEDORES.html">Ingresar Nuevo Proveedor</a></li> 
                                    <% } 
                            %> 
                                    
                             
                            <%
                                if (ingresaproducto==0){%>
                                    <li><a style="display: none" href="productosnuevos.html">Ingresar Nuevo Producto</a></li>
                                    <% }
                                else {%>
                                   <li><a href="productosnuevos.html">Ingresar Nuevo Producto</a></li>
                                    <% } 
                            %>
                                    
                           
                            <%
                                if (ingresagrupobodegas==0){%>
                                    <li><a style="display: none"  href="ingresagrupobodegas.html">Crear Grupos de Productos</a></li>
                                    <% }
                                else {%>
                                   <li><a  href="ingresagrupobodegas.html">Crear Grupos de Productos</a></li>
                                    <% } 
                             %>    
      
          
                  
                                   
        <% }//else
 
  
        
      
 
  
        

//SEGUNDO GRUPO DE MENU, PARA ACTIVAR O DESACTIVAR, SEGUN ROLES DE LOS USUARIOS


 
            %>  
                                
                                
                     
    <% 
      
        
        //SEGUNDO MENU COMPRA-VENTA
        int venta=01;
        int compra=01;
                                       
       
        int ventacompras=01;
            
           if (ventacompras ==0 )
            {
                %>
                    <li><a style="display: none" href="">Ventas-Compras</a> </li>                                 
                <%   
         
            }//if filas                   
            else 
               {
                %>
                    <li><a href="">Ventas-Compras</a>
                        <ul>
                            <%
                                if (compra==0){%>
                                    <li><a style="display: none" proveeodoresGO.html">Nueva Compra</a></li>   
                                    <% }
                                else {%>
                                    <li><a proveeodoresGO.html">Nueva Compra</a></li>  
                                    <% } 
                            %>                   
                             
		            
                             <%
                                if (venta==0){%>
                                    <li><a style="display: none" href="ventasnueva.html">Ventas</a></li>
                                    <% }
                                else {%>
                                    <li><a  href="ventasnueva.html">Ventas</a></li> 
                                    <% } 
                            %> 
                                    
                             
                           
                                    
                           
                             
      
          
                  
                                   
        <% }//else
 
  
        
      
 
  
        

//SEGUNDO GRUPO DE MENU, PARA ACTIVAR O DESACTIVAR, SEGUN ROLES DE LOS USUARIOS


 
            %>                            
                                
                                
			</ul>
		</div>
        
    </body>
</html>
