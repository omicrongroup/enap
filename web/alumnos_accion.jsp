<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<%@include file="conectar.jsp" %>
<%
    String accion = request.getParameter("accion");
    //--------------------------------------------
    //Inicio de accion buscar
    if(accion.equals("Buscar")){
        try{
            String rut = request.getParameter("txtRut");
            String sql = "SELECT alu_nombre,alu_apellido,alu_fnac,alu_sexo,alu_direccion FROM t_alumnos WHERE alu_rut = '"+rut+"'";
            Connection conn = Conectar();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
                String nom = rs.getString("alu_nombre");
                String alu = rs.getString("alu_apellido");
                String fna = rs.getString("alu_fnac");
                String sex = rs.getString("alu_sexo");
                String dir = rs.getString("alu_direccion");
                out.write(nom+";"+alu+";"+fna+";"+sex+";"+dir);
            }else{
                out.write("ALUMNO NO ENCONTRADO INTENTE CON OTRO RUT...");
            }
            conn.close();
        }catch(Exception e){
            
        }
        
    }
    //Fin de accion buscar
    //--------------------------------------------
    //Accion de Ingresar
    if(accion.equals("Grabar")){
            String rut = request.getParameter("txtRut");
            String nombre = request.getParameter("txtNombre");
            String apellido = request.getParameter("txtApellido");
            String fnac = request.getParameter("datFnac");
            String sexo = request.getParameter("cmbSexo");
            String direccion = request.getParameter("txtDireccion");
            try{
                Connection conn = Conectar();    
                Statement st1 = conn.createStatement();     
                String sql = "INSERT INTO t_alumnos (alu_rut, alu_nombre, alu_apellido, alu_fnac, alu_sexo, alu_direccion) VALUES ('"+rut+"','"+nombre+"','"+apellido+"','"+fnac+"','"+sexo+"','"+direccion+"')";
                try{
                st1.execute(sql);
                out.write("ALUMNO INSERTADO SATISFACTORIAMENTE...");
                conn.close();
                }
                catch (Exception e){
                out.write("ALUMNO NO INSERTADO...");
                }
            }catch (Exception e){
            e.printStackTrace();
            out.write(e.toString());
            }             
    }
    //Fin de accion ingresar
    
 
    //--------------------------------------------
    //Accion de Modificar
    if(accion.equals("Editar")){
            String rut = request.getParameter("txtRut");
            String nombre = request.getParameter("txtNombre");
            String apellido = request.getParameter("txtApellido");
            String fnac = request.getParameter("datFnac");
            String sexo = request.getParameter("cmbSexo");
            String direccion = request.getParameter("txtDireccion");
            try{
                Connection conn = Conectar();    
                Statement st1 = conn.createStatement();     
                String sql = "UPDATE t_alumnos SET alu_nombre='"+nombre+"', alu_apellido='"+apellido+"', alu_fnac='"+fnac+"', alu_sexo='"+sexo+"', alu_direccion='"+direccion+"'WHERE alu_rut = '"+rut+"'";
                try{
                st1.execute(sql);
                out.write("ALUMNO ACTUALIZADO SATISFACTORIAMENTE...");
                conn.close();}
                catch (Exception e){
                    out.write("ALUMNO NO ACTUALIZADO...");
                }
            }catch (Exception e){
            e.printStackTrace();
            out.write(e.toString());
            }          
    }    
    //--------------------------------------------
    //Accion de Eliminar
    if(accion.equals("Borrar")){
            String rut = request.getParameter("txtRut");
            try{
                Connection conn = Conectar();    
                Statement st1 = conn.createStatement();     
                String sql = "DELETE FROM t_alumnos WHERE alu_rut = '"+rut+"'";
                try{
                st1.execute(sql);
                out.write("ALUMNO ELIMINADO SATISFACTORIAMENTE...");
                conn.close();}
                catch (Exception e){
                    out.write("NO HA SIDO POSIBLE ELIMINAR EL ALUMNO...");
                }
            }catch (Exception e){
            e.printStackTrace();
            out.write(e.toString());
            }           
    }     
%>
