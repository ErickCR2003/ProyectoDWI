package DAO;

import Modelo.Empleado;
import config.ConexionBD;

public class CRUDempleado extends ConexionBD {

    public CRUDempleado() {
    }

    public boolean ConsultaUsuario(String usuario, String contraseña) {
        boolean rpta = false;
        try {
            this.obtenerconexion();
            rs = st.executeQuery("SELECT * FROM empleado WHERE empleado.usuario = '" + usuario + "' AND empleado.contraseña = '" + contraseña + "';");
            if (rs.next()) {//si tiene consulta
                rpta = true;
            }
        } catch (Exception ex) {
            System.out.println("ERROR! No se pueden mostrar los registros de la tabla empleado..." + ex);
        } finally {
            this.cerrarconexion();
        }
        return rpta;
    }
}
