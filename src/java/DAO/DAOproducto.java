
package DAO;

import Modelo.ItemCarrito;
import Modelo.Producto;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public interface DAOproducto {
    List<Producto> listarproductos();
    String getMensaje();
    Producto listarporID(int ID);
    int cantidadProductoByID(int ID);
    String restarCantidadDelStock(List<ItemCarrito> carrito);
    String insertProducto(Producto p);
//    void listarIMG(int id, HttpServletResponse response);
    
}
