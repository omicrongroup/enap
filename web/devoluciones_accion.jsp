<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<%@include file="conectar.jsp" %>
<%
String accion = request.getParameter("accion");
    if(accion.equals("BuscarLibro")){
        try{
            String codigo = request.getParameter("txtCodigo");
            String sql = "SELECT lib_descripcion, lib_cantidad FROM t_libros WHERE lib_codigo = '"+codigo+"'";
            Connection conn = Conectar();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
                String des = rs.getString("lib_descripcion");
                String can = rs.getString("lib_cantidad");
                out.write(des+";"+can);
            }else{
                out.write("LIBRO NO ENCONTRADO INTENTE CON OTRO CODIGO...");
            }
            conn.close();
        }catch(Exception e){

        }
    }

    if(accion.equals("BuscarAlumno")){
        try{
            String rut = request.getParameter("txtRut");
            String sql = "SELECT alu_nombre, alu_apellido FROM t_alumnos WHERE alu_rut = '"+rut+"'";
            Connection conn = Conectar();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
                String nom = rs.getString("alu_nombre");
                String ape = rs.getString("alu_apellido");
                out.write(nom+";"+ape);
            }else{
                out.write("ALUMNO NO ENCONTRADO INTENTE CON OTRO RUT...");
            }
            conn.close();
        }catch(Exception e){

        }
    } 

    if(accion.equals("BuscarPrestamo")){
        try{
            String rut = request.getParameter("txtRut");
            String codigo = request.getParameter("txtCodigo");
            String sql = "SELECT pre_prestamo, pre_fec_devo, pre_fec_ent, pre_pendiente FROM t_prestamos WHERE pre_alu_rut = '"+rut+"' AND pre_libro = '"+codigo+"' ORDER BY pre_prestamo DESC";
            Connection conn = Conectar();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
                String pre = rs.getString("pre_prestamo");
                String dev = rs.getString("pre_fec_devo");
                String ent = rs.getString("pre_fec_ent");
                String pen = rs.getString("pre_pendiente");
                out.write(pre+";"+dev+";"+ent+";"+pen);
            }else{
                out.write("NO EXISTE CONCORDANCIA EN PRESTAMO...");
            }
            conn.close();
        }catch(Exception e){

        }
    }
    
    if(accion.equals("Grabar")){
            String corr = request.getParameter("txtCorr");
            String fecentrega = request.getParameter("datFentrega");
            int stock = Integer.parseInt(request.getParameter("txtStock").trim());
            String codigo = request.getParameter("txtCodigo");
            try{
                Connection conn = Conectar();    
                Statement st1 = conn.createStatement();     
                String sql = "UPDATE t_prestamos SET pre_fec_ent = '"+fecentrega+"', pre_pendiente=1 WHERE pre_prestamo = '"+corr+"'";
                try{
                st1.execute(sql);
                out.write("DEVOLUCION REALIZADA SATISFACTORIAMENTE...");
                }
                catch (Exception e){
                //out.write("PRESTAMO NO INSERTADO...");
                out.write(sql);
                }
            }catch (Exception e){
            e.printStackTrace();
            out.write(e.toString());
            }      
            try{
                Connection conn = Conectar(); 
                //int stockint = (Integer.parseInt(stock).trim());
                int stocknuevo = (stock + 1);
                out.write(stocknuevo);
                Statement st2 = conn.createStatement();     
                String sql2 = "UPDATE t_libros SET lib_cantidad='"+stocknuevo+"' WHERE lib_codigo = '"+codigo+"'";
                try{
                    st2.execute(sql2);
                    conn.close();
                }
                catch (Exception e){
                     out.write(sql2);
                }
            }catch (Exception e){
            e.printStackTrace();
            out.write(e.toString());
            }
    }

%>
