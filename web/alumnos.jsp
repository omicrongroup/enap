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
        <script src="js/jquery.Rut.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
<body>
<div class="container">
  <h3>Datos de alumnos:</h3>    
    <!-- RUT DEL ALUMNO -->
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span>
          <input id="txtRut" name="txtRut" type="text" class="form-control" placeholder="Ingrese RUT...">
          <span class="input-group-btn">
            <button id="btnBuscar" name="btnBuscar" class="btn btn-primary" type="button" value="Buscar">Buscar</button>
          </span>
        </div>
      </div>
    </div>
    <br>
    <!-- NOMBRE DEL ALUMNO -->    
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
          <input id="txtNombre" name="txtNombre" type="text" class="form-control" placeholder="Nombre..." required="">
        </div>
      </div>
    </div>
    <br>
    <!-- APELLIDO DEL ALUMNO -->    
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
          <input id="txtApellido" name="txtApellido" type="text" class="form-control" placeholder="Apellido..." required="">
        </div>
      </div>
    </div>
    <br>
    <!-- FECHA DE NACIMIENTO -->    
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
          <input id="datFnac" name="datFnac"class="form-control" placeholder="Fecha de nacimiento...." type="date" required="">
        </div>
      </div>
    </div>    
    <br>
    <!-- SEXO DEL ALUMNO -->
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-option-horizontal"></i></span>
                <select id="cmbSexo" name="cmbSexo" class="form-control" required="">
                    <option value="0">Sexo...</option>
                    <option value="1">Masculino</option>
                    <option value="2">Femenino</option>
                </select>
        </div>
      </div>
    </div>    
    <br>
    <!-- DIRECCION DEL ALUMNO -->
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-road"></i></span>
          <input id="txtDireccion" name="txtDireccion" type="text" class="form-control" placeholder="Dirección..." required="">
        </div>
      </div>
    </div>
</div>
    <br>     
 
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
<!-- INICIO ACCION DE BOTON BUSCAR    -->        
    <script>

    //Click boton buscar
    $("#btnBuscar").click(function(){
        $('#cmbSexo option:selected').removeAttr('selected');
        $("#cmbSexo").removeProp("selected");
        var accion = $("#btnBuscar").val();
        var rut = $("#txtRut").val();
        $.post("alumnos_accion.jsp",{accion:"Buscar",txtRut:rut},function(d){
            var res = d.split(";");
            $("#txtNombre").val(res[0]);
            $("#txtApellido").val(res[1]);
            $("#datFnac").val(res[2]);
            $('#cmbSexo option[value="'+res[3]+'"]').attr("selected", true);
            $("#txtDireccion").val(res[4]);
            $('#btnGrabar').attr('disabled' , true);
            $('#btnBorrar').attr('disabled' , false);
            $('#btnEditar').attr('disabled' , false);
        });
    });
    </script>
<!-- FIN ACCION DE BOTON BUSCAR    -->   
<!------------------------------------------------------------------------------------------------------------>
<!-- INICIO ACCION DE BOTON GRABAR    -->       
<script>

    $("#btnGrabar").click(function(){
        var accion = $("#btnGrabar").val();
        var txtRut = $("#txtRut").val();
        var txtNombre = $("#txtNombre").val();
        var txtApellido = $("#txtApellido").val();
        var datFnac = $("#datFnac").val();
        var cmbSexo = $("#cmbSexo").val();
        var txtDireccion = $("#txtDireccion").val();
        $.post("alumnos_accion.jsp",{accion:accion,txtRut:txtRut,txtNombre:txtNombre,txtApellido:txtApellido,datFnac:datFnac,cmbSexo:cmbSexo,txtDireccion:txtDireccion},function(d){
            alertt(d);
        //$.post("alumnos_accion.jsp?accion="+accion+"&txtRut="+txtRut+"&txtNombre="+txtNombre+"&txtApellido="+txtApellido+"&datFnac="+datFnac+"&cmbSexo="+cmbSexo+"&txtDireccion="+txtDireccion);
            $("#txtRut").val("");
            $("#txtNombre").val("");
            $("#txtApellido").val("");
            $("#datFnac").val("");
            $("#cmbSexo option:selected").removeAttr("selected");
            $("#cmbSexo").removeProp("selected");
            $("#cmbSexo").val("0");
            $("#txtDireccion").val("");
            $('#btnBorrar').attr('disabled' , true);
            $('#btnEditar').attr('disabled' , true); 
        });
    });
</script>    
<!-- FIN ACCION DE BOTON GRABAR    -->    
<!------------------------------------------------------------------------------------------------------------>
<!-- INICIO ACCION DE BOTON BORRAR    -->       
<script>

    $("#btnBorrar").click(function(){
        var accion = $("#btnBorrar").val();
        var txtRut = $("#txtRut").val();
        var txtNombre = $("#txtNombre").val();
        var txtApellido = $("#txtApellido").val();
        var datFnac = $("#datFnac").val();
        var cmbSexo = $("#cmbSexo").val();
        var txtDireccion = $("#txtDireccion").val();
        $.post("alumnos_accion.jsp",{accion:accion,txtRut:txtRut},function(d){
            alertt(d);
        //$.post("alumnos_accion.jsp?accion="+accion+"&txtRut="+txtRut+"&txtNombre="+txtNombre+"&txtApellido="+txtApellido+"&datFnac="+datFnac+"&cmbSexo="+cmbSexo+"&txtDireccion="+txtDireccion);
            $("#txtRut").val("");
            $("#txtNombre").val("");
            $("#txtApellido").val("");
            $("#datFnac").val("");
            $('#cmbSexo option:selected').removeAttr('selected');
            $("#cmbSexo").removeProp("selected");
            $("#txtDireccion").val("");
            $('#btnBorrar').attr('disabled' , true);
            $('#btnEditar').attr('disabled' , true);            
        });
    });
</script>    
<!-- FIN ACCION DE BOTON BORRAR    -->    
<!------------------------------------------------------------------------------------------------------------>
<!-- INICIO ACCION DE BOTON EDITAR    -->       
<script>

    $("#btnEditar").click(function(){
        var accion = $("#btnEditar").val();
        var txtRut = $("#txtRut").val();
        var txtNombre = $("#txtNombre").val();
        var txtApellido = $("#txtApellido").val();
        var datFnac = $("#datFnac").val();
        var cmbSexo = $("#cmbSexo").val();
        var txtDireccion = $("#txtDireccion").val();
        $.post("alumnos_accion.jsp",{accion:accion,txtRut:txtRut,txtNombre:txtNombre,txtApellido:txtApellido,datFnac:datFnac,cmbSexo:cmbSexo,txtDireccion:txtDireccion},function(d){
            alertt(d);
        //$.post("alumnos_accion.jsp?accion="+accion+"&txtRut="+txtRut+"&txtNombre="+txtNombre+"&txtApellido="+txtApellido+"&datFnac="+datFnac+"&cmbSexo="+cmbSexo+"&txtDireccion="+txtDireccion);
            $("#txtRut").val("");
            $("#txtNombre").val("");
            $("#txtApellido").val("");
            $("#datFnac").val("");
            $('#cmbSexo option:selected').removeAttr('selected');
            $("#cmbSexo").removeProp("selected");
            $("#txtDireccion").val("");
            $('#btnBorrar').attr('disabled' , true);
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
    $('#txtRut').on('keyup',function() {
        if($(this).val() != '') {
            $('#btnGrabar').attr('disabled' , false);
        }else{
            $('#btnGrabar').attr('disabled' , true);
        }
    });
});
</script>   
<!------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------>
<script>  
$('#txtRut').Rut({
  on_error: function(){ alert("Rut incorrecto");$("#txtRut").val("");$("#txtRut").focus(); },
  format_on: 'keyup'
});
</script>   

</body>
</html>
