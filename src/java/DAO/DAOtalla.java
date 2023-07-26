
package DAO;

import Modelo.Talla;
import java.util.List;


public interface DAOtalla {
        
    List<Talla> listarTalla();
    Talla tallaByID(int id);
    public String getMensaje();
    
}
