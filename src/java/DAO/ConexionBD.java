package DAO;

import java.sql.*;

public class ConexionBD implements Parametros {

    public Connection conexion;
    public Statement st;
    public ResultSet rs;
    public ResultSetMetaData rsmeta;
    public PreparedStatement ps;

    //Constructor
    public ConexionBD() {

    }

    public Connection obtenerconexion() throws SQLException {
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(RUTA, USUARIO, CLAVE);
            st = conexion.createStatement();
            return conexion;
        } catch (Exception e) {
            throw new SQLException("ERROR! No se puede conectar la BD...", e);
        }
    }

    public void cerrarconexion() throws SQLException {
        try {
            conexion.close();
        } catch (Exception e) {
            throw new SQLException("ERROR! No se pudo cerrar la BD..." + e);
        }
    }

}
