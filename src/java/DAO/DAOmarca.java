
package DAO;

import Modelo.Marca;
import java.util.List;

public interface DAOmarca {
    
    List<Marca> listarMarca();
    Marca marcaByID(int id);
    public String getMensaje();
    
    
}
