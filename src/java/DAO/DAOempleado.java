
package DAO;

import Modelo.Empleado;

public interface DAOempleado {
    boolean ConsultaUsuario(String usuario, String contraseña);
    String getMensaje();
    
}
