<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<%!
Connection Conectar(){
    String bdd = "omicrong_enap";
    //String ser = "jdbc:mysql://omicrongroup.cl:3306/" + bdd;
    String ser = "jdbc:mysql://localhost:3306/" + bdd;
    String usr = "omicrong_enap";
    String pas = "enap2017";
    String dri = "com.mysql.jdbc.Driver";
    Connection conn;
    try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(ser,usr,pas);  
        }catch(Exception e){
            conn = null;
        }
            return conn;
}
%>