package config;

import java.sql.*;

public class Conexion implements Parametros {

    public Connection conexion;
    public Statement st;
    public ResultSet rs;
    public ResultSetMetaData rsmeta;
    public PreparedStatement ps;

    //Constructor
    public Conexion() {

    }

    public Connection getConexion(){
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(RUTA, USUARIO, CLAVE);
            st = conexion.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("ERROR! No se pudo cerrar la BD..." + e);
        }
        return conexion;
    }

    public void cerrarconexion(){
        try {
            conexion.close();
        } catch (SQLException e) {
            System.out.println("ERROR! No se pudo cerrar la BD..." + e);
        }
    }

}
