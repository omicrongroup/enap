<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<%@include file="conectar.jsp" %>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/funcioneslogin.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<%
        String usuario  = request.getParameter("usr");
        String clave    = request.getParameter("pwd");
        String nombre   = "";
        String apellido = "";
        String nivel    = "";
        String sql = "";
        try{
        Connection conn = Conectar();
        Statement st = conn.createStatement();
        sql="SELECT * FROM t_usuarios WHERE usu_rut = '"+usuario+"' AND usu_clave='"+clave+"'";
        ResultSet rs =st.executeQuery(sql);
        if (rs.next()){
            session.setAttribute("usersession",usuario);
            session.setAttribute("passsession",clave);
            session.setAttribute("nombresession", rs.getString("usu_nombre"));
            session.setAttribute("apellidosession", rs.getString("usu_apellido"));
            session.setAttribute("nivelsession", rs.getString("usu_nivel"));
            response.sendRedirect("bienvenido.jsp");
            conn.close();
        }else{
            response.sendRedirect("error_login.html");
            //out.write("<script>alert('Error al ingresar usuario/contraseña');</script>");
            conn.close();
        }
        }catch(Exception e){
            out.write("ERROR AL CONECTARSE A LA BASE DE DATOS "+e.toString());
        }
%>
 