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
    public boolean ConsultaUsuario(String usuario, String contraseña) {
        //creamos e inicializamos la variable a usar
        boolean rpta = false;
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
                rpta = true;
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return rpta;
    }

    @Override
    public String getMensaje() {
        return mensaje;
    }
}
