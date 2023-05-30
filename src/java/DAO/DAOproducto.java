
package DAO;

import Modelo.Producto;
import java.util.List;

public interface DAOproducto {
    List<Producto> listarproductos();
    String getMensaje();
    
}
