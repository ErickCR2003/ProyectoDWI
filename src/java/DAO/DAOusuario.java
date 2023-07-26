
package DAO;

import Modelo.Usuario;
import java.util.List;

public interface DAOusuario {
    
    List<Usuario> listaUsuarios();
    Usuario ConsultaUsuario(String usuario, String contraseña);
    Usuario ConsultaUsuarioByID(int id);
    String actualizarUsuarioByID(Usuario user, int id);
    String getMensaje();
    
}
