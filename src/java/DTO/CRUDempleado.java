package DTO;

import Modelo.Empleado;
import config.Conexion;
import DAO.DAOempleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class CRUDempleado implements DAOempleado {

    private final Conexion conexion;
    private String mensaje;

    public CRUDempleado() {
        conexion = new Conexion();
    }

    @Override
    public Empleado ConsultaUsuario(String usuario, String contraseña) {
        //creamos e inicializamos la variable a usar
        Empleado emp = null;
        //creamos un String Builder
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM empleado WHERE usuario = ? AND contraseña = ?");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Establecemos los valores dentro de la consulta
            ps.setString(1, usuario);
            ps.setString(2, contraseña);
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            if (rs.next()) {
                emp = new Empleado();
                emp.setID(rs.getInt(1));
                emp.setUsuario(rs.getString(2));
                emp.setContraseña(rs.getString(3));
                emp.setNombre(rs.getString(4));
                emp.setApellido(rs.getString(5));
                emp.setTelefono(rs.getString(6));
                emp.setEmail(rs.getString(7));
                emp.setFecNacimiento(rs.getString(8));
                emp.setEstado(rs.getBoolean(9));
                emp.setDni(rs.getString(10));
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
}
