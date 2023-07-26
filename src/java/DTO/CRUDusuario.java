package DTO;

import Modelo.Usuario;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import DAO.DAOusuario;
import java.util.ArrayList;
import java.util.List;

public class CRUDusuario implements DAOusuario {

    private final Conexion conexion;
    private String mensaje;

    public CRUDusuario() {
        conexion = new Conexion();
    }

    @Override
    public Usuario ConsultaUsuario(String email, String contraseña) {
        mensaje = null;
        //creamos e inicializamos la variable a usar
        Usuario emp = null;
        //creamos un String Builder
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM usuario WHERE email = ? AND contraseña = ?");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Establecemos los valores dentro de la consulta
            ps.setString(1, email);
            ps.setString(2, contraseña);
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            if (rs.next()) {
                emp = new Usuario();
                emp.setID(rs.getInt(1));
                emp.setEmail(rs.getString(2));
                emp.setContraseña(rs.getString(3));
                emp.setNombre(rs.getString(4));
                emp.setApellido(rs.getString(5));
                emp.setFecNacimiento(rs.getString(6));
                emp.setRol(rs.getString(7));
                emp.setDni(rs.getString(8));
                emp.setId_metodoPago(rs.getInt(9));
            } else {
                mensaje = "Usuario o contraseña incorrectos";
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return emp;
    }

    @Override
    public String getMensaje() {
        return mensaje;
    }

    @Override
    public List<Usuario> listaUsuarios() {
        List<Usuario> listausuarios = new ArrayList<>();
        //creamos e inicializamos la variable a usar
        Usuario emp = null;
        //creamos un String Builder
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM usuario WHERE rol = 'CLIENTE' ");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                emp = new Usuario();
                emp.setID(rs.getInt(1));
                emp.setEmail(rs.getString(2));
                emp.setContraseña(rs.getString(3));
                emp.setNombre(rs.getString(4));
                emp.setApellido(rs.getString(5));
                emp.setFecNacimiento(rs.getString(6));
                emp.setRol(rs.getString(7));
                emp.setDni(rs.getString(8));
                emp.setId_metodoPago(rs.getInt(9));
                listausuarios.add(emp);
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return listausuarios;
    }

    @Override
    public Usuario ConsultaUsuarioByID(int id) {
        mensaje = null;
        //creamos e inicializamos la variable a usar
        Usuario emp = null;
        //creamos un String Builder
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM usuario WHERE ID = " + id);
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            if (rs.next()) {
                emp = new Usuario();
                emp.setID(rs.getInt(1));
                emp.setEmail(rs.getString(2));
                emp.setContraseña(rs.getString(3));
                emp.setNombre(rs.getString(4));
                emp.setApellido(rs.getString(5));
                emp.setFecNacimiento(rs.getString(6));
                emp.setRol(rs.getString(7));
                emp.setDni(rs.getString(8));
                emp.setId_metodoPago(rs.getInt(9));
            } else {
                mensaje = "Usuario o contraseña incorrectos";
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return emp;
    }

    @Override
    public String actualizarUsuarioByID(Usuario user, int id) {
        mensaje = null;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE `usuario` SET `nombre`= ?,`apellido`= ?, `email`= ?, `dni`= ?, `fecNacimiento`= ? WHERE `ID`= ?");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            ps.setString(1, user.getNombre());
            ps.setString(2, user.getApellido());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getDni());
            ps.setString(5, user.getFecNacimiento());
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return mensaje;
    }
}
