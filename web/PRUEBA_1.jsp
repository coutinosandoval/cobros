<%-- 
    Document   : PRUEBA
    Created on : 08-sep-2014, 18:54:55
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
        
        
       </body>
</html>
<html >
<head>
   <form>
<table>
    <thead>
<tr>
      <th scope="col">Pista</th>
      <th scope="col">Album</th>
      <th scope="col">Artista</th>
     </tr>
</thead>
     
    <tbody>
<tr>
      <td><input id="pista1" name="pista1" /></td>
      <td><input id="album1" name="album1" /></td>
      <td><select id="artista1" name="artista1">
        <option value="">Seleccionar</option>
        <option value="1">Artista 1</option>
        <option value="2">Artista 2</option>
        <option value="3">Artista 3</option>        
       </select>
      </td>
     </tr>
</tbody>
   </table>
</form>
<button>Add</button>
   
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script>
  $(document).ready(function($)
  {
   // trigger event cuando el boton es cliqueado
   $("button").click(function()
   {
    // añadir nueva fila usando la funcion addTableRow
    addTableRow($("table"));
    // prevenir que el boton redireccione a una nueva pagina
    return false;
   });
   
   // funcion que añade una nueva fila a la tabla clonando la ultima fila e 
   // incrementando los nombres y los ids en 1 para hacerlos unicos en el documento
   function addTableRow(table)
   {
    // clonar la ultima fila de la tabla
    var $tr = $(table).find("tbody tr:last").clone();
    // obtener el atributo name para los inputs y selects
    $tr.find("input,select").attr("name", function()
    {
     //  separar el campo name y su numero en dos partes
     var parts = this.id.match(/(\D+)(\d+)$/);
     // crear un nombre nuevo para el nuevo campo incrementando el numero para los previos campos en 1
     return parts[1] + ++parts[2];
    // repetir los atributos ids
    }).attr("id", function(){
     var parts = this.id.match(/(\D+)(\d+)$/);
     return parts[1] + ++parts[2];
    });
    // añadir la nueva fila a la tabla
    $(table).find("tbody tr:last").after($tr);
   };
  });
  </script>
    </body>
</html>
