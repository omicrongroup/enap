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
<!-- Inicio Barra de navegación superior-->    
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="bienvenido.jsp"><span class="glyphicon glyphicon-home"></span> Sistema de Bblioteca</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
        <div id="vinculos">
      <ul class="nav navbar-nav">
          
            <li><a href="alumnos.jsp" ><span class="glyphicon glyphicon-education"></span> Alumnos</a></li>
            <li><a href="libros.jsp"><span class="glyphicon glyphicon-book"></span> Libros</a></li>
            <li><a href="prestamos.jsp"><span class="glyphicon glyphicon-share"></span> Préstamo</a></li>
            <li><a href="devoluciones.jsp"><span class="glyphicon glyphicon-check"></span> Devolución</a></li>
            <li><a href="pendientes.jsp"><span class="glyphicon glyphicon-search"></span> Pendientes</a></li>
            
      </ul>
            </div>
      <ul class="nav navbar-nav navbar-right">
            <li align="center"><a href="#" data-toggle="modal" data-target="#myModalUsuario"><span class="glyphicon glyphicon-user"></span><br> <% out.write( nombre +" "+ apellido  ); %> </a></li>  
            <li align="center"><a href="#" data-toggle="modal" data-target="#myModalCredito"><span class="glyphicon glyphicon-copyright-mark"></span><br> Créditos</a></li>
            <li align="center"><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span><br> Cerrar Sesión</a></li>
      </ul>
    </div>
  </div>
</nav>
<!-- Fin Barra de navegación superior-->          

<!-- INICIO CUERPO PRINCIPAL -->
<div id="div1"></div>



<!-- FIN CUERPO PRINCIPAL -->
      


<!--INICIO SCRIPT QUE CARGA PAGINAS EN DIV1-->
<script type="text/javascript">
    $(document).ready(function()
    {
        $("#vinculos a").on("click", function(event)
        {
            //Cancela el evento del href, por defecto al pinchar en un link
            // te envia a este, con esto evitamos que ejecute el link
            event.preventDefault();            
           //Cargamos el contenido del enlace
            $('#div1').load(this.href);
        });
    });

</script>
<!--FIN SCRIPT QUE CARGA PAGINAS EN DIV1-->


<!-- Inicio NavBar Pie de Página -->
<nav class="navbar fixed-bottom navbar-default bg-faded">
<div class="footer">
  <p>Hora y fecha: <%=new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format( new java.util.Date())%></p>
</div>
</nav>
<!-- Fin de NavBar Pie de Página -->

<!-- Inicio Modal Usuario Activo-->
<div class="modal fade" id="myModalUsuario" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Usuario Activo</h4>
      </div>
      <div class="modal-body">
        <p>Rut Usuario : <% out.write( usuario );  %> </p>
        <p>Nombre      : <% out.write( nombre );   %> </p>
        <p>Apellido    : <% out.write( apellido ); %> </p>
        <p>Nivel       : <% out.write( nivel );  %></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar Ventana</button>
      </div>
    </div>
  </div>
</div>
<!-- Fin Modal Usuario Activo-->

<!-- Inicio Modal Creditos-->
<div class="modal fade" id="myModalCredito" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Créditos - Acerca de...</h4>
      </div>
      <div class="modal-body">
        <p>Alumno      : Alfredo Osorio Leiva </p>
        <p>Módulo      : Taller de aplicaciones para internet JAVA</p>
        <p>Docente     : Luis Soto S. </p>
        <p>Fecha       : <%=new java.text.SimpleDateFormat("MMMMM/yyyy").format( new java.util.Date())%></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar Ventana</button>
      </div>
    </div>
  </div>
</div>
<!-- Fin Modal Usuario Activo-->
</body>
</html>
