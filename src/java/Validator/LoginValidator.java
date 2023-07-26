/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Validator;

import DTO.CRUDusuario;
import Modelo.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author carra
 */
public class LoginValidator {

    private HttpServletRequest request;
    private CRUDusuario crudu;

    public LoginValidator(HttpServletRequest request) {
        this.request = request;
        this.crudu = new CRUDusuario();
    }

    public String login() {
        String msj = null;
        String user = request.getParameter("txtUsuario");
        String password = request.getParameter("txtContrasenia");
        Usuario usu = crudu.ConsultaUsuario(user, password);
        if (usu != null) {
            HttpSession session = request.getSession();
            if (usu.getRol().equals("ADMINISTRADOR")) {
                session.setAttribute("usuario", usu.getNombre());
                session.setAttribute("rol", usu.getRol());
                session.setAttribute("idUsuarioAdmin", usu.getID());
            } else {
                session.setAttribute("idMetodoPago", usu.getId_metodoPago());
                session.setAttribute("idUsuarioCliente", usu.getID());
                session.setAttribute("usuario", usu.getNombre());
                session.setAttribute("rol", usu.getRol());
            }
        } else {
            msj = crudu.getMensaje();
        }
        
        return msj;
    }

    public String logout() {
        String msj = null;
        HttpSession session = request.getSession(false); // Obtener la sesión existente sin crear una nueva si no existe
        String rol = (String) session.getAttribute("rol");
        if (session != null && rol != null) {
            if (rol.equalsIgnoreCase("admin")) {
                session.invalidate(); // Invalidar la sesión, eliminando todos los datos almacenados en ella
                msj = "admin";
            } else {
                session.invalidate(); // Invalidar la sesión, eliminando todos los datos almacenados en ella
                msj = "cliente";
            }
        } else {
            msj = "cliente";
        }
        return msj;
    }
}
