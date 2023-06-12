package Controlador;

import DTO.CRUDproducto;
import Modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Ctrlindex", urlPatterns = {"/Ctrlindex"})
public class ControladorIndex extends HttpServlet {

    CRUDproducto crudp = new CRUDproducto();
    List<Producto> listaproductos = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        listaproductos = crudp.listarproductos();

        switch (accion) {
            case "AgregarCarrito":
                int id = Integer.parseInt(request.getParameter("id"));

                break;
            case "Carrito":

                break;
            default:
                request.setAttribute("listaproductos", listaproductos);
                request.getRequestDispatcher("productos/Productos.jsp").forward(request, response);
        }
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
