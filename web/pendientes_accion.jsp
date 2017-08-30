<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<%@include file="conectar.jsp" %>
<%

    String sql = "SELECT pre_prestamo,pre_libro,lib_descripcion,pre_alu_rut,alu_nombre,alu_apellido,pre_fec_ptmo,pre_fec_devo FROM t_prestamos p,t_libros l,t_alumnos a WHERE pre_pendiente = 0 AND p.pre_libro=l.lib_codigo AND p.pre_alu_rut=a.alu_rut";
    Connection conn = Conectar();
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(sql);
    while(rs.next()){
        String correlativo = rs.getString("pre_prestamo");
        String libro = rs.getString("pre_libro");
        String alumno = rs.getString("pre_alu_rut");
        String prestamo = rs.getString("pre_fec_ptmo");
        String devolucion = rs.getString("pre_fec_devo");
            out.write("<tr>");
            out.write("<td>"+rs.getObject("pre_prestamo")+" </td>");
            out.write("<td>"+rs.getObject("pre_libro")+" - "+rs.getObject("lib_descripcion")+" </td>");
            out.write("<td>"+rs.getObject("pre_alu_rut")+" - "+rs.getObject("alu_nombre")+" "+rs.getObject("alu_apellido")+" </td>");
            out.write("<td>"+rs.getObject("pre_fec_ptmo")+" </td>");
            out.write("<td>"+rs.getObject("pre_fec_devo")+" </td>");               
            out.write("</tr>"); 
    }
    conn.close();
%>