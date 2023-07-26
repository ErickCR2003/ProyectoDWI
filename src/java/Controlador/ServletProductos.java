/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

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
import Validator.CategoriasValidator;
import Validator.ColorValidator;
import Validator.MarcaValidator;
import Validator.ProductosValidator;
import Validator.TallaValidator;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@MultipartConfig
@WebServlet(name = "ServletProductos", urlPatterns = {"/ServletProductos"})
public class ServletProductos extends HttpServlet {

    private CRUDproducto crudp = new CRUDproducto();
    private CRUDcategoria crudc = new CRUDcategoria();
    private CRUDcolor crudco = new CRUDcolor();
    private CRUDtalla crudt = new CRUDtalla();
    private CRUDmarca crudm = new CRUDmarca();

    private String pathFiles = "C:\\Users\\carra\\OneDrive\\Escritorio\\GIT\\ProyectoDWI\\web\\img\\";
    private File uploads = new File(pathFiles);
    private String[] extens = {".ico", ".png", ".jpg", ".jpeg", ".svg"};

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        String mensaje = null;
        accion = (accion == null) ? "" : accion;
        String target = "intranet/productos.jsp";

        Producto p = new Producto();

        HttpSession session = request.getSession(false);
        boolean rpta = session != null && session.getAttribute("rol").equals("ADMINISTRADOR");

        ProductosValidator validator = new ProductosValidator(request);
        CategoriasValidator validatorC = new CategoriasValidator(request);
        ColorValidator validatorColor = new ColorValidator(request);
        TallaValidator validatorT = new TallaValidator(request);
        MarcaValidator validatorM = new MarcaValidator(request);

        if (rpta) {
            switch (accion) {
                case "Inventario" -> {
                    validator.productosInventario();
                    validatorC.listaCategorias();
                    validatorColor.listaColor();
                    validatorT.listaTalla();
                    validatorM.listaMarca();
                }
                case "INS" -> {
                    mensaje = validator.insertProductos();
                }
            }
        } else {
            target = "loginAdmin.jsp";
        }

        if (mensaje != null) {
            request.setAttribute("mensaje", mensaje);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(target);
        dispatcher.forward(request, response);

    }

//    public void insertProductos(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        HttpSession session = request.getSession(false);
//
//        String name = request.getParameter("name");
//        String precio = request.getParameter("price");
//        Integer stock = Integer.valueOf(request.getParameter("stock"));
//        Part part = request.getPart("image");
//        String genero = request.getParameter("genero");
//        String descripcion = request.getParameter("descripcion");
//
//        String categoria = request.getParameter("category");
//        Categoria c = crudc.categoriabyID(Integer.parseInt(categoria));
//
//        String color = request.getParameter("color");
//        Color co = crudco.colorByID(Integer.parseInt(color));
//
//        String talla = request.getParameter("size");
//        Talla t = crudt.tallaByID(Integer.parseInt(talla));
//
//        String marca = request.getParameter("marca");
//        Marca m = crudm.marcaByID(Integer.parseInt(marca));
//
//        if (part == null) {
//            System.out.println("No ha seleccionado ningun archivo.");
//            return;
//        }
//
//        if (isExtension(part.getSubmittedFileName(), extens)) {
//            String imagen = saveFile(part, uploads);
//            Producto p = new Producto();
//            p.setNombre(name);
//            p.setGenero(genero);
//            p.setDescripcion(descripcion);
//            p.setPrecio(Double.parseDouble(precio));
//            p.setStock(stock);
//            p.setImagen(imagen);
//            p.setCategoria(c.getNombre());
//            p.setColor(co.getColor());
//            p.setTalla(Integer.parseInt(t.getNumeroCalzado()));
//            p.setMarca(m.getMarca());
//            p.setId_categoria(c.getID());
//            p.setId_color(co.getID());
//            p.setId_talla(t.getID());
//            p.setId_marca(m.getID());
//            p.setId_empleado((int) session.getAttribute("idUsuarioAdmin"));
//            crudp.insertProducto(p);
//        }
//        response.sendRedirect("intranet/productos.jsp");
//        
//    }
//
//    private String saveFile(Part part, File pathUploads) {
//        String pathAbsolute = "";
//        try {
//            Path path = Paths.get(part.getSubmittedFileName());
//            String fileName = path.getFileName().toString();
//            InputStream input = part.getInputStream();
//
//            if (input != null) {
//                File file = new File(pathUploads, fileName);
//                pathAbsolute = file.getAbsolutePath();
//                Files.copy(input, file.toPath());
//
//            }
//
//        } catch (IOException e) {
//        }
//        return pathAbsolute;
//    }
//
//    private boolean isExtension(String fileName, String[] extensions) {
//        for (String et : extensions) {
//            if (fileName.toLowerCase().endsWith(et)) {
//                return true;
//            }
//        }
//        return false;
//    }
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
    }// </editor-fold>

}
