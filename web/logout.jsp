<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate(); //Destruir sesión
    response.sendRedirect("index.html");
%>
