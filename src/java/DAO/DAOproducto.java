
package DAO;

import Modelo.Producto;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public interface DAOproducto {
    List<Producto> listarproductos();
    String getMensaje();
//    void listarIMG(int id, HttpServletResponse response);
    
}
