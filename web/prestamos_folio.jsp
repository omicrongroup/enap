<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<%@include file="conectar.jsp" %>
<%
//Busca último folio utilizado
    String sql = "SELECT MAX(pre_prestamo) as corre ,MAX(pre_prestamo)+1 as CORRELATIVO FROM t_prestamos";
        Connection conn = Conectar();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        if(rs.next()){
            String corr1 = rs.getString("corre");
            String corr2 = rs.getString("CORRELATIVO");
            out.write(corr1+";"+corr2);
        }else{
            out.write("ERROR AL OBTENER FOLIOS.");
        }
        conn.close();
%>
