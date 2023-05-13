package config;

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

    public Connection obtenerconexion(){
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(RUTA, USUARIO, CLAVE);
            st = conexion.createStatement();
        } catch (Exception e) {
            System.out.println("ERROR! No se pudo cerrar la BD..." + e);
        }
        return conexion;
    }

    public void cerrarconexion(){
        try {
            conexion.close();
        } catch (Exception e) {
            System.out.println("ERROR! No se pudo cerrar la BD..." + e);
        }
    }

}
