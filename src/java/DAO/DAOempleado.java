
package DAO;

import Modelo.Empleado;

public interface DAOempleado {
    Empleado ConsultaUsuario(String usuario, String contraseña);
    String getMensaje();
    
}
