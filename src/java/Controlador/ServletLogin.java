package Controlador;

import Validator.LoginValidator;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControladorLogin", urlPatterns = {"/Login"})
public class ServletLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;cyharset=UTF-8");
        String accion = request.getParameter("accion");
        accion = (accion == null) ? "" : accion;
        String mensaje = null;
        String target = "vistas/loginAdmin.jsp";
        LoginValidator login = new LoginValidator(request);

        switch (accion) {
            case "LOG" -> {
                mensaje = login.login();
                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("usuario") != null) {
                    target = session.getAttribute("rol").equals("ADMINISTRADOR") ? "intranet/tablero.jsp" : "index.jsp";
                } 
            }
            case "OUT" -> {
                mensaje = login.logout();
                target = "index.jsp";
            }
            case "SIGNUP" -> {
                mensaje = login.logout();
                target = "vistas/registrate.jsp";
            }
            default ->
                mensaje = null;
        }

        if (mensaje != null) {
            request.setAttribute("mensaje", mensaje);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(target);
        dispatcher.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
