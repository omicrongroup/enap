<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<%@include file="conectar.jsp" %>
<%
    String rut = request.getParameter("txtRut");
    String nombre = request.getParameter("txtNombre");
    String apellido = request.getParameter("txtApellido");
    String clave = request.getParameter("txtPasswd");
    try{
        Connection conn = Conectar();    
        Statement st1 = conn.createStatement();     
        String sql = "INSERT INTO t_usuarios (usu_rut, usu_clave, usu_nombre, usu_apellido) VALUES ('"+rut+"','"+clave+"','"+nombre+"','"+apellido+"')";
        st1.execute(sql);
        conn.close();
        response.sendRedirect("index.html");
    }catch (Exception e){
    }     

%>