package Validator;

import DTO.CRUDproducto;
import Modelo.DetalleCompras;
import Modelo.ItemCarrito;
import Modelo.Producto;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class CarritoValidator {

    private HttpServletRequest request;
    private CRUDproducto crudp;

    public CarritoValidator(HttpServletRequest request) {
        this.request = request;
        this.crudp = new CRUDproducto();
    }

    public Producto obtenerProductoPorID() {
        Producto p = null;
        int id = Integer.parseInt(request.getParameter("id"));
        p = crudp.listarporID(id);
        return p;
    }

    public ItemCarrito itemsCarrito(Producto p) {

        ItemCarrito ic = new ItemCarrito();

        ic.setImagen(p.getImagen());
        ic.setNombre(p.getNombre());
        ic.setDescripcion(p.getDescripcion());
        ic.setId_producto(p.getID());
        ic.setCantidad(1);
        ic.setPrecio(Double.parseDouble(p.getPrecio()));
        ic.setSubtotal(1 * Double.parseDouble(p.getPrecio()));
        
        return ic;
    }
    
}
