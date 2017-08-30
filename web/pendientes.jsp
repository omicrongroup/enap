<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuario = "";
    String pass = "";
    String nombre = "";
    String apellido = "";
    String nivel = "";
    try{
        usuario = session.getAttribute("usersession").toString();
        pass = session.getAttribute("passsession").toString();
        nombre = session.getAttribute("nombresession").toString();
        apellido = session.getAttribute("apellidosession").toString();
        nivel = session.getAttribute("nivelsession").toString();
    }
    catch(Exception e){
        response.sendRedirect("index.html");
        out.write(e.toString());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>ENAP - Taller de Aplicaciones para Internet con JAVA</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
<body>
<script>
$(document).ready(function(){
    $("#divX").load("pendientes_accion.jsp");
    });
</script>
<div class="container" id="tabla">
  <h2>Devoluciones pendientes</h2>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>ID Préstamo</th>
        <th>Libro</th>
        <th>Rut Alumno</th>
        <th>Fecha Préstamo</th>
        <th>Fecha Devolución</th>
      </tr>
    </thead>
    <tbody id="divX"></tbody>
  </table>
</div>
<br><br>
    <!--BOTONERA DE ACCIONES -->
    <div class="container">
      <div class="row">
          <div class="col-lg-12">
              <div class="col-lg-2">
                <button id="btnExport" name="btnExport" class="btn btn-success btn-block" type="button" value="Exportar" >EXPORTAR A EXCEL</button>
              </div>
          </div>
      </div>
    </div>
    <br>  
<script>
    $(document).ready(function() {
  $("#btnExport").click(function(e) {
    e.preventDefault();

    //getting data from our table
    var data_type = 'data:application/vnd.ms-excel';
    var table_div = document.getElementById('tabla');
    var table_html = table_div.outerHTML.replace(/ /g, '%20');

    var a = document.createElement('a');
    a.href = data_type + ', ' + table_html;
    a.download = 'exported_table_' + Math.floor((Math.random() * 9999999) + 1000000) + '.xls';
    a.click();
  });
});
</script>    
</body>
</html>
