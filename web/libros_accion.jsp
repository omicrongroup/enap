<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<%@include file="conectar.jsp" %>
<%
String accion = request.getParameter("accion");
    if(accion.equals("Grabar")){
        //String codigo = request.getParameter("txtCodigo");
        int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
        String titulo = request.getParameter("txtTitulo");
        String stock = request.getParameter("txtStock");
        String registro = request.getParameter("datRegistro");
        String genero = request.getParameter("cmbGenero");
            try{
                Connection conn = Conectar();    
                Statement st1 = conn.createStatement();     
                String sql = "INSERT INTO t_libros (lib_codigo, lib_descripcion, lib_genero, lib_fingreso, lib_cantidad) VALUES ('"+codigo+"','"+titulo+"','"+genero+"','"+registro+"',"+stock+")";
                try{
                    st1.execute(sql);
                    out.write("LIBRO INSERTADO SATISFACTORIAMENTE...");
                    conn.close();}
                catch (Exception e){
            e.printStackTrace();
            out.write(e.toString());
                }
            }catch (Exception e){
            e.printStackTrace();
            out.write(e.toString());
            } 
    }
    
    
    if(accion.equals("Borrar")){
        String codigo = request.getParameter("txtCodigo");
            try{
                Connection conn = Conectar();   
                Statement st1 = conn.createStatement();     
                String sql = "DELETE FROM t_libros WHERE lib_codigo = "+codigo+"";
                try{
                        st1.execute(sql);
                        out.write("LIBRO ELIMINADO SATISFACTORIAMENTE...");
                        conn.close();}
                catch (Exception e){
                    out.write("LIBRO NO EXISTENTE...");
                    }
            }catch (Exception e){
            e.printStackTrace();
            out.write(e.toString());
            }       
    }
    
if(accion.equals("Buscar")){
        try{
            String codigo = request.getParameter("txtCodigo");
            String sql = "SELECT lib_descripcion, lib_genero, lib_fingreso, lib_cantidad FROM t_libros WHERE lib_codigo = '"+codigo+"'";
            Connection conn = Conectar();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
                String des = rs.getString("lib_descripcion");
                String gen = rs.getString("lib_genero");                
                String can = rs.getString("lib_cantidad");
                String ing = rs.getString("lib_fingreso");
                out.write(des+";"+gen+";"+ing+";"+can);
            }else{
                out.write("LIBRO NO ENCONTRADO INTENTE CON OTRO CODIGO...");
            }
            conn.close();
        }catch(Exception e){
            
        }
}  
if(accion.equals("Editar")){
        String codigo = request.getParameter("txtCodigo");
        String titulo = request.getParameter("txtTitulo");
        String tipo = request.getParameter("cmbGenero");    
        String fregistro = request.getParameter("datRegistro");
        String stock = request.getParameter("txtStock");
        try{
            Connection conn = Conectar();    
            Statement st1 = conn.createStatement();     
            String sql = "UPDATE t_libros SET lib_descripcion='"+titulo+"', lib_genero='"+tipo+"', lib_fingreso='"+fregistro+"', lib_cantidad='"+stock+"' WHERE lib_codigo = '"+codigo+"'";
            try{
            st1.execute(sql);
            out.write("Libro actualizado satisfactoriamente...");
            conn.close();}
            catch (Exception e){
                out.write("Libro no actualizado...");
            }
        }catch (Exception e){
        e.printStackTrace();
        out.write(e.toString());
        }          
} 
%>

