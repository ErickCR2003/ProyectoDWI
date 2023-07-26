
package DAO;

import Modelo.Compra;
import Modelo.ItemCarrito;
import java.util.List;

public interface DAOcompra {
    
    List<Compra> listaCompras();
    String generarCompra(Compra compra);
    int ultimoID();
    String generarDetalles(List<ItemCarrito> detalles, int idcompra);
    String getMensaje();
    
}
