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
        <script src="js/funciones.js" type="text/javascript"></script>
        <script src="js/jquery.Rut.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
<body>
<!-----------------------------------------------------------------------------------------------------
<!-- INICIO ACCION BUSCAR FOLIO PRESTAMO    -->        
    <script>
    $(document).ready(function(){
        $('#btnGrabar').attr('disabled' , true);
        $('#datFentrega').change(function(){
            $('#btnGrabar').attr('disabled' , false);
        });
    });

    $('#txtRut').Rut({
        on_error: function(){ alert("Rut incorrecto");$("#txtRut").val("");$("#txtRut").focus(); },
        format_on: 'keyup'
    });
    </script>
<!-- FIN ACCION BUSCAR FOLIO PRESTAMO    -->        
<div class="container">
  <h3>Devolución de libros:</h3>    
  <div class="row">
    <div class="col-xs-6">
        <div class="input-group">
        <span class="input-group-addon"><label class="control-label col-xs-6">ID Préstamo :</label></span>
        <input class="form-control" id="txtCorr" name="txtCorr" type="text" readonly>
        </div>
    </div>
  </div> 
  <h4>Datos libro:</h4>   
    <!-- CODIGO DEL LIBRO -->
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
          <input id="txtCodigo" name="txtCodigo" type="text" class="form-control" placeholder="Ingrese código libro...">
          <span class="input-group-btn">
            <button id="btnBuscarLibro" name="btnBuscarLibro" class="btn btn-primary" type="button" value="BuscarLibro">Buscar</button>
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
          <input id="txtTitulo" name="txtTitulo" type="text" class="form-control" placeholder="Título..." readonly>
          <input id="txtStock" name="txtStock" type="hidden" class="form-control" value="hiddenValue">
          <input id="txtPendiente" name="txtPendiente" type="hidden" class="form-control">
        </div>
      </div>
    </div>
    <br>
   <h4>Datos alumno:</h4>      
    <!-- RUT DEL ALUMNO -->
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span>
          <input id="txtRut" name="txtRut" type="text" class="form-control" placeholder="Ingrese RUT del alumno...">
          <span class="input-group-btn">
            <button id="btnBuscarAlumno" name="btnBuscarAlumno" class="btn btn-primary" type="button" value="BuscarAlumno">Buscar</button>
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
          <input id="txtNombre" name="txtNombre"  type="text" class="form-control" placeholder="Nombre..." readonly>
        </div>
      </div>
    </div>
    <br>
    <!-- APELLIDO DEL ALUMNO -->    
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
          <input id="txtApellido" name="txtApellido" type="text" class="form-control" placeholder="Apellido..." readonly>
        </div>
      </div>
    </div>
    <br>
    <h4>Buscar Préstamo:</h4>  
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-2">
                <button id="btnBuscarPrestamo" name="btnBuscarPrestamo" class="btn btn-success btn-block" type="button" value="BuscarPrestamo" >BUSCAR PRESTAMO</button>
            </div>
          </div>
      </div>
    </div>    
    <br>
    <!-- FECHA DE DEVOLUCION COMPROMETIDA-->    
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon">Fecha Comprometida</span>
          <input id="datFdevol" name="datFdevol"class="form-control" type="date" readonly>
        </div>
      </div>
    </div>      
    <br>
    <!-- FECHA DE DEVOLUCION -->    
    <div class="row">
      <div class="col-lg-6">
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
          <input id="datFentrega" name="datFentrega"class="form-control" type="date">
        </div>
      </div>
    </div>    
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
                <button id="btnLimpiar" name="btnLimpiar" class="btn btn-success btn-block" type="button" value="Limpiar">LIMPIAR</button>
            </div>
          </div>
      </div>
    </div>
    <br>       
    </div>    
<!-- Inicio de acciones -->
<!------------------------------------------------------------------------------------------------------------>    
<!-- INICIO ACCION DE BOTON BUSCAR LIBRO   -->        
    <script>
        $(document).ready(function(){
            //Click boton buscar
            $("#btnBuscarLibro").click(function(){
                var accion = $("#btnBuscarLibro").val();
                var codigo = $("#txtCodigo").val();
                $.post("devoluciones_accion.jsp",{accion:"BuscarLibro",txtCodigo:codigo},function(d){
                    var res = d.split(";");
                    $("#txtTitulo").val(res[0]);
                    $("#txtStock").val(res[1]);
                    $('#btnGrabar').attr('disabled' , true);
                });
            });
        });
    </script>
<!-- FIN ACCION DE BOTON BUSCAR LIBRO   -->   
<!------------------------------------------------------------------------------------------------------------>    
<!-- INICIO ACCION DE BOTON BUSCAR ALUMNO   -->        
    <script>
        $(document).ready(function(){
            //Click boton buscar
            $("#btnBuscarAlumno").click(function(){
                var accion = $("#btnBuscarAlumno").val();
                var rut = $("#txtRut").val();
                $.post("devoluciones_accion.jsp",{accion:"BuscarAlumno",txtRut:rut},function(e){
                    var res = e.split(";");
                    $("#txtNombre").val(res[0]);
                    $("#txtApellido").val(res[1]);
                    $('#btnGrabar').attr('disabled' , true);
                });
            });
        });
    </script>
<!-- FIN ACCION DE BOTON BUSCAR ALUMNO   -->  
<!------------------------------------------------------------------------------------------------------------>    
<!-- INICIO ACCION DE BOTON BUSCAR PRESTAMO   -->        
    <script>
        $(document).ready(function(){
            //Click boton buscar
            $("#btnBuscarPrestamo").click(function(){
                var accion = $("#btnBuscarPrestamo").val();
                var codigo = $("#txtCodigo").val();                
                var rut = $("#txtRut").val();
                $.post("devoluciones_accion.jsp",{accion:"BuscarPrestamo",txtCodigo:codigo,txtRut:rut},function(e){
                    var res = e.split(";");
                    $("#txtCorr").val(res[0]);
                    $("#datFdevol").val(res[1]);
                    $("#txtPendiente").val(res[3]);
                    $('#btnGrabar').attr('disabled' , true);
                    var pendiente = $("#txtPendiente").val();
                    if(pendiente == 1){
                        $("#datFentrega").val(res[2]);
                        $("#datFentrega").prop('disabled', true);
                        $('#btnGrabar').attr('disabled' , true);
                        }
                });
            });
        });
    </script>
<!-- FIN ACCION DE BOTON BUSCAR PRESTAMO   -->  
<!------------------------------------------------------------------------------------------------------------>    
<!-- INICIO ACCION DE BOTON GRABAR FORMULARIO   -->        
    <script>
        $(document).ready(function(){
            //Click boton buscar
            $("#btnGrabar").click(function(){
                var accion = $("#btnGrabar").val();
                var codigo = $("#txtCodigo").val();
                var rut = $("#txtRut").val();
                var fecentrega = $("#datFentrega").val();
                var stock = $("#txtStock").val();
                var corr = $("#txtCorr").val();
                $.post("devoluciones_accion.jsp",{accion:"Grabar",txtCorr:corr,datFentrega:fecentrega,txtCodigo:codigo,txtStock:stock,txtCodigo:codigo},function(f){
                    alertt(f);
                    $("#txtCodigo").val("");
                    $("#txtTitulo").val("");
                    $("#txtRut").val("");                    
                    $("#txtNombre").val("");
                    $("#txtApellido").val("");
                    $("#datFdevol").val("");
                    $("#datFentrega").val("");
                    $("#txtStock").val("");
                    $("#txtCorr").val("");
                    $("#txtPendiente").val("");
                });
            });
        });
    </script>
<!-- FIN ACCION DE BOTON GRABAR FORMULARIO   -->  
<!------------------------------------------------------------------------------------------------------------>    
<!-- INICIO ACCION LIMPIAR   -->  
<script>
$("#btnLimpiar").click(function(){
                    $("#txtCodigo").val("");
                    $("#txtTitulo").val("");
                    $("#txtRut").val("");                    
                    $("#txtNombre").val("");
                    $("#txtApellido").val("");
                    $("#datFdevol").val("");
                    $("#datFentrega").val("");
                    $("#txtStock").val("");
                    $("#txtCorr").val("");
                    $("#txtPendiente").val("");
                    $("#datFentrega").prop('disabled', false);
});
</script>
</body>
</html>
