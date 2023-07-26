package Validator;

import DAO.DAOproducto;
import DTO.CRUDcategoria;
import DTO.CRUDcolor;
import DTO.CRUDmarca;
import DTO.CRUDproducto;
import DTO.CRUDtalla;
import Modelo.Categoria;
import Modelo.Color;
import Modelo.Marca;
import Modelo.Producto;
import Modelo.Talla;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

public class ProductosValidator {

    private HttpServletRequest request;
    private DAOproducto dao;

    private CRUDproducto crudp = new CRUDproducto();
    private CRUDcategoria crudc = new CRUDcategoria();
    private CRUDcolor crudco = new CRUDcolor();
    private CRUDtalla crudt = new CRUDtalla();
    private CRUDmarca crudm = new CRUDmarca();

    public ProductosValidator(HttpServletRequest request) {
        this.request = request;
        this.dao = new CRUDproducto();
    }

    public String productosInventario() {
        String msj = null;
        List<Producto> lista = dao.listarproductos();
        if (lista != null) {
            request.setAttribute("listaproductos", lista);
        } else {
            msj = dao.getMensaje();
        }
        return msj;
    }

    public String insertProductos() {

        HttpSession session = request.getSession(false);
        String name = request.getParameter("nombre");
        String precio = request.getParameter("precio");
        Integer stock = Integer.valueOf(request.getParameter("stock"));
        String genero = request.getParameter("genero");
        String descripcion = request.getParameter("descripcion");
        String image = request.getParameter("image");

        String categoria = request.getParameter("category");
        Categoria c = crudc.categoriabyID(Integer.parseInt(categoria));

        String color = request.getParameter("color");
        Color co = crudco.colorByID(Integer.parseInt(color));

        String talla = request.getParameter("size");
        Talla t = crudt.tallaByID(Integer.parseInt(talla));

        String marca = request.getParameter("marca");
        Marca m = crudm.marcaByID(Integer.parseInt(marca));

        Producto p = new Producto();
        p.setNombre(name);
        p.setGenero(genero);
        p.setDescripcion(descripcion);
        p.setPrecio(Double.parseDouble(precio));
        p.setStock(stock);
        p.setImagen(image);
        p.setCategoria(c.getNombre());
        p.setColor(co.getColor());
        p.setTalla(Integer.parseInt(t.getNumeroCalzado()));
        p.setMarca(m.getMarca());
        p.setId_categoria(c.getID());
        p.setId_color(co.getID());
        p.setId_talla(t.getID());
        p.setId_marca(m.getID());
        p.setId_empleado((int) session.getAttribute("idUsuarioAdmin"));
        
        String msj = crudp.insertProducto(p);

        return msj;
    }
}
