package Controlador;

import DTO.CRUDcompra;
import DTO.CRUDproducto;
import Modelo.Compra;
import Modelo.Producto;
import Modelo.DetalleCompras;
import Modelo.ItemCarrito;
import Modelo.Usuario;
import Validator.CarritoValidator;
import Validator.RedondeoValidator;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Ctrlindex", urlPatterns = {"/Ctrlindex"})
public class ServletIndex extends HttpServlet {

    CRUDproducto crudp = new CRUDproducto();
    CRUDcompra crudc = new CRUDcompra();
    List<Producto> listaproductos = new ArrayList<>();
    Producto p = new Producto();
    ItemCarrito ic = new ItemCarrito();
    List<ItemCarrito> carrito = new ArrayList<>();
    int item;
    double totalapagar = 0.0;
    double IGV = 0.0;
    int cantidad = 1;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mensaje = null;
        String accion = request.getParameter("accion");
        String target = "vistas/productos.jsp";
        CarritoValidator validator = new CarritoValidator(request);
        listaproductos = crudp.listarproductos();

        switch (accion) {
            case "Principal" -> //Mandamos el atributo (listaproductos) con el nombre "listaproductos"
                request.setAttribute("listaproductos", listaproductos);

            case "AgregarCarrito" -> {
                int pos = 0;
                cantidad = 1;
                int id = Integer.parseInt(request.getParameter("id"));
                p = validator.obtenerProductoPorID();
                if (!carrito.isEmpty()) {
                    for (int i = 0; i < carrito.size(); i++) {
                        if (id == carrito.get(i).getId_producto()) {
                            pos = i;
                        }
                    }
                    if (id == carrito.get(pos).getId_producto()) {
                        cantidad = carrito.get(pos).getCantidad() + cantidad;
                        double subtotal = carrito.get(pos).getPrecio() * cantidad;
                        carrito.get(pos).setCantidad(cantidad);
                        carrito.get(pos).setSubtotal(subtotal);
                    } else {
                        ic = new ItemCarrito();
                        item++;
                        ic.setItem(item);
                        ic.setImagen(p.getImagen());
                        ic.setNombre(p.getNombre());
                        ic.setDescripcion(p.getDescripcion());
                        ic.setId_producto(p.getID());
                        ic.setCantidad(cantidad);
                        ic.setPrecio(Double.parseDouble(p.getPrecio()));
                        ic.setSubtotal(cantidad * Double.parseDouble(p.getPrecio()));
                        carrito.add(ic);
                    }
                } else {
                    ic = new ItemCarrito();
                    item++;
                    ic.setItem(item);
                    ic.setImagen(p.getImagen());
                    ic.setNombre(p.getNombre());
                    ic.setDescripcion(p.getDescripcion());
                    ic.setId_producto(p.getID());
                    ic.setCantidad(cantidad);
                    ic.setPrecio(Double.parseDouble(p.getPrecio()));
                    ic.setSubtotal(cantidad * Double.parseDouble(p.getPrecio()));
                    carrito.add(ic);
                }
            }

            case "Carrito" -> {
                if (!carrito.isEmpty()) {
                    IGV = 0;
                    totalapagar = 0;
                    for (ItemCarrito itemCarrito : carrito) {
                        totalapagar += itemCarrito.getSubtotal();
                    }

                    IGV = (totalapagar * 0.18);

                    //Mandamos el atributo (carrito) con el nombre "carrito"
                    request.setAttribute("carrito", carrito);
                    request.setAttribute("totalapagar", RedondeoValidator.round(totalapagar, 2));
                    request.setAttribute("totalIGV", RedondeoValidator.round(IGV, 2));

                    target = "vistas/carrito.jsp";
                } else {
                    target = "vistas/carritoVacio.jsp";
                }
            }

            case "Delete" -> {
                int idp = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < carrito.size(); i++) {
                    if (carrito.get(i).getId_producto() == idp) {
                        carrito.remove(i);
                    }
                }
            }
            case "ActualizarCantidad" -> {
                int stock = 0;
                int idpro = Integer.parseInt(request.getParameter("idp"));
                int cant = Integer.parseInt(request.getParameter("cantidad"));

                // Obtener el stock actual del producto desde la base de datos
                int stockDisponible = crudp.cantidadProductoByID(idpro);

                // Verificar si la cantidad seleccionada supera el stock disponible
                if (cant > stockDisponible) {
                    cant = stockDisponible; // Ajustar la cantidad al stock disponible
                }
                for (int i = 0; i < carrito.size(); i++) {
                    if (carrito.get(i).getId_producto() == idpro) {
                        carrito.get(i).setCantidad(cant);
                        stock = stockDisponible;
                        double st = carrito.get(i).getPrecio() * cant;
                        carrito.get(i).setSubtotal(st);
                    }
                }

            }
            case "Comprar" -> {
                int pos = 0;
                cantidad = 1;
                int id = Integer.parseInt(request.getParameter("id"));
                p = validator.obtenerProductoPorID();
                if (!carrito.isEmpty()) {
                    for (int i = 0; i < carrito.size(); i++) {
                        if (id == carrito.get(i).getId_producto()) {
                            pos = i;
                        }
                    }
                    if (id == carrito.get(pos).getId_producto()) {
                        cantidad = carrito.get(pos).getCantidad() + cantidad;
                        double subtotal = carrito.get(pos).getPrecio() * cantidad;
                        carrito.get(pos).setCantidad(cantidad);
                        carrito.get(pos).setSubtotal(subtotal);
                    } else {
                        ic = new ItemCarrito();
                        item++;
                        ic.setItem(item);
                        ic.setImagen(p.getImagen());
                        ic.setNombre(p.getNombre());
                        ic.setDescripcion(p.getDescripcion());
                        ic.setId_producto(p.getID());
                        ic.setCantidad(cantidad);
                        ic.setPrecio(Double.parseDouble(p.getPrecio()));
                        ic.setSubtotal(cantidad * Double.parseDouble(p.getPrecio()));
                        carrito.add(ic);
                    }
                } else {
                    ic = new ItemCarrito();
                    item++;
                    ic.setItem(item);
                    ic.setImagen(p.getImagen());
                    ic.setNombre(p.getNombre());
                    ic.setDescripcion(p.getDescripcion());
                    ic.setId_producto(p.getID());
                    ic.setCantidad(cantidad);
                    ic.setPrecio(Double.parseDouble(p.getPrecio()));
                    ic.setSubtotal(cantidad * Double.parseDouble(p.getPrecio()));
                    carrito.add(ic);
                }
                totalapagar = 0;
                for (ItemCarrito itemCarrito : carrito) {
                    totalapagar += itemCarrito.getSubtotal();
                }
                IGV = (totalapagar * 0.18);
                //Mandamos el atributo (carrito) con el nombre "carrito"
                request.setAttribute("carrito", carrito);
                request.setAttribute("totalapagar", RedondeoValidator.round(totalapagar, 2));
                request.setAttribute("totalIGV", RedondeoValidator.round(IGV, 2));
                target = "vistas/carrito.jsp";
            }
            case "GenerarCompra" -> {
                LocalDateTime fechaActual = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
                String fechaHoraFormateada = fechaActual.format(formatter);

                HttpSession session = request.getSession(false);

                String rol = (String) session.getAttribute("rol");

                int idMetodoPago = (int) session.getAttribute("idMetodoPago");

                int idUsuarioCliente = (int) session.getAttribute("idUsuarioCliente");

                Compra compra = new Compra(fechaHoraFormateada, totalapagar, "CANCELADO", idUsuarioCliente, idMetodoPago, carrito);
                crudc.generarCompra(compra);
                int ultimoid = crudc.ultimoID();
                crudc.generarDetalles(carrito, ultimoid);
                crudp.restarCantidadDelStock(carrito);
                carrito.clear();

                request.setAttribute("rol", rol);
                request.setAttribute("idMetodoPago", idMetodoPago);

                target = "vistas/carrito.jsp";
            }

        }

        if (mensaje != null) {
            request.setAttribute("mensaje", mensaje);
        }

        request.setAttribute("contador", carrito.size());
        request.setAttribute("listaproductos", listaproductos);
        RequestDispatcher dispatcher = request.getRequestDispatcher(target);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
