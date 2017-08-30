<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
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
        <script src="js/funciones.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
<body>
<div class="container">
  <h3>Datos de libros:</h3>    
    <!-- CODIGO DEL LIBRO -->
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
          <input type="text" id="txtCodigo" name="txtCodigo" class="form-control" placeholder="Ingrese código libro...">
          <span class="input-group-btn">
            <button class="btn btn-primary" type="button" id="btnBuscar" name="btnBuscar">Buscar</button>
          </span>
        </div>
      </div>
    </div>
    <br>
    <!-- TITULO DEL LIBRO -->    
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-bookmark"></i></span>
          <input type="text" id="txtTitulo" name="txtTitulo" class="form-control" value="" placeholder="Título...">
        </div>
      </div>
    </div>
    <!-- GENERO DEL LIBRO -->
    <br>
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-option-horizontal"></i></span>
                <select id="cmbGenero" name="cmbGenero" class="form-control">
                    <option value="0">Genero...</option>
                    <option value="1">Epico</option>
                    <option value="2">Dramatico</option>
                    <option value="3">Lirico</option>
                </select>
        </div>
      </div>
    </div>    
    <br>  
    <!-- FECHA DE REGISTRO -->    
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
          <input id="datRegistro" name="datRegistro"class="form-control" placeholder="Fecha de registro...." type="date">
        </div>
      </div>
    </div> 
    <br>
    <!-- STOCK DEL LIBRO -->    
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-list-alt"></i></span>
          <input type="text" id="txtStock" name="txtStock" class="form-control" placeholder="Stock inicial...">
        </div>
      </div>
    </div>
    <br>    
</div>    
    <!--BOTONERA DE ACCIONES -->
    <div class="container">
      <h4>Seleccione una opción</h4>
      <div class="row">
          <div class="col-lg-12">
              <div class="col-lg-2">
                <button id="btnGrabar" name="btnGrabar" class="btn btn-success btn-block" type="button" value="Grabar" >GRABAR</button>
              </div>
              <div class="col-lg-2">
                <button id="btnEditar" name="btnEditar" class="btn btn-success btn-block" type="button" value="Editar">EDITAR</button>
                </div>
              <div class="col-lg-2">
                <button id="btnBorrar" name="btnBorrar" class="btn btn-success btn-block" type="button" value="Borrar">BORRAR</button>
              </div>
          </div>
      </div>
    </div>
    <br>  


<!------------------------------------------------------------------------------------------------------------>    
<!-- INICIO ACCION DE BOTON BUSCAR    -->        
    <script>
    //Click boton buscar
    $("#btnBuscar").click(function(){
        $('#cmbGenero option:selected').removeAttr('selected');
        $("#cmbGenero").removeProp("selected");
        var accion = $("#btnBuscar").val();
        var codigo = $("#txtCodigo").val();
        $.post("libros_accion.jsp",{accion:"Buscar",txtCodigo:codigo},function(d){
            var res = d.split(";");
            $("#txtTitulo").val(res[0]);
            $('#cmbGenero option[value="'+res[1]+'"]').attr("selected", true);       
            $("#datRegistro").val(res[2]);
            $("#txtStock").val(res[3]);
            $('#btnGrabar').attr('disabled' , true);
            $('#btnBorrar').attr('disabled' , false);
            $('#btnEditar').attr('disabled' , false);
        });
    });
    </script>
<!-- FIN ACCION DE BOTON BUSCAR    -->   
<!------------------------------------------------------------------------------------------------------------>    
<!-- INICIO ACCION DE BOTON BORRAR    -->       
<script>
    $("#btnBorrar").click(function(){
        var accion = $("#btnBorrar").val();
        var codigo = $("#txtCodigo").val();
        $.post("libros_accion.jsp",{accion:accion,txtCodigo:codigo},function(d){
            alertt(d);
            $("#txtCodigo").val("");
            $("#txtTitulo").val("");
            $("#txtStock").val("");
            $("#datRegistro").val("");
            $('#cmbGenero option:selected').removeAttr('selected');
            $("#cmbGenero").removeProp("selected");
            $('#btnBorrar').attr('disabled' , true);
            $('#btnEditar').attr('disabled' , true);            
        });
    });
</script>    
<!-- FIN ACCION DE BOTON BORRAR -->    
<!------------------------------------------------------------------------------------------------------------>    
<!-- ACCION DE BOTON GRABAR   -->
<script>
    $("#btnGrabar").click(function(){
        var accion = $("#btnGrabar").val();
        var txtCodigo = $("#txtCodigo").val();
        var txtTitulo = $("#txtTitulo").val();
        var txtStock = $("#txtStock").val();
        var datRegistro = $("#datRegistro").val();
        var cmbGenero = $("#cmbGenero").val();
        $.post("libros_accion.jsp",{accion:accion,txtCodigo:txtCodigo,txtTitulo:txtTitulo,txtStock:txtStock,datRegistro:datRegistro,cmbGenero:cmbGenero},function(d){
                alertt(d);
        $("#txtCodigo").val("");
        $("#txtTitulo").val("");
        $("#cmbGenero option:selected").removeAttr("selected");
        $("#cmbGenero").removeProp("selected");
        $("#cmbGenero").val("0");        
        $("#datRegistro").val("");
        $("#txtStock").val("");
        });
    });
</script>    
<!-- ACCION DE BOTON GRABAR    -->
<!------------------------------------------------------------------------------------------------------------>
<!-- INICIO ACCION DE BOTON EDITAR    -->       
<script>

    $("#btnEditar").click(function(){
        var accion = $("#btnEditar").val();
        var txtCodigo = $("#txtCodigo").val();
        var txtTitulo = $("#txtTitulo").val();
        var cmbGenero = $("#cmbGenero").val();   
        var datRegistro = $("#datRegistro").val();        
        var txtStock = $("#txtStock").val();
        $.post("libros_accion.jsp",{accion:accion,txtCodigo:txtCodigo,txtTitulo:txtTitulo,cmbGenero:cmbGenero,datRegistro:datRegistro,txtStock:txtStock},function(d){
            alertt(d);
        //$.post("alumnos_accion.jsp?accion="+accion+"&txtRut="+txtRut+"&txtNombre="+txtNombre+"&txtApellido="+txtApellido+"&datFnac="+datFnac+"&cmbSexo="+cmbSexo+"&txtDireccion="+txtDireccion);
            $("#txtCodigo").val("");
            $("#txtTitulo").val("");
            $('#cmbGenero option:selected').removeAttr('selected');            
            $("#datRegistro").val("");            
            $("#txtStock").val("");
            $("#cmbGenero option:selected").removeAttr("selected");
            $("#cmbGenero").removeProp("selected");
            $("#cmbGenero").val("0");           $('#btnBorrar').attr('disabled' , true);
            $('#btnEditar').attr('disabled' , true);            
        });
    });
</script>    
<!-- FIN ACCION DE BOTON EDITAR    -->    
<!------------------------------------------------------------------------------------------------------------>


<!-- ACCIONES DEL FORMULARIOS   -->    
<script>   
$(document).ready(function() {
    $('#btnGrabar').attr('disabled', true);
    $('#btnBorrar').attr('disabled', true);
    $('#btnEditar').attr('disabled', true);
    $('#txtCodigo').on('keyup',function() {
        if($(this).val() != '') {
            $('#btnGrabar').attr('disabled' , false);
        }else{
            $('#btnGrabar').attr('disabled' , true);
        }
    });
});
</script>   
<!------------------------------------------------------------------------------------------------------------>
</body>
</html>
