/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Validator;

import DTO.CRUDempleado;
import Modelo.Empleado;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author carra
 */
public class LoginValidator {

    private HttpServletRequest request;
    private CRUDempleado crude;

    public LoginValidator(HttpServletRequest request) {
        this.request = request;
        this.crude = new CRUDempleado();
    }

    public String login() {
        String msj = null;
        String user = request.getParameter("txtUsuario");
        String password = request.getParameter("txtContrasenia");
        Empleado emp = crude.ConsultaUsuario(user, password);
        if (emp != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", emp.getUsuario());
            msj = "logeado como usuario";
        } else {
            msj = crude.getMensaje();
        }
        return msj;
    }

    public String logout() {
        String msj = null;
        HttpSession session = request.getSession(false); // Obtener la sesión existente sin crear una nueva si no existe
        if (session != null) {
            session.invalidate(); // Invalidar la sesión, eliminando todos los datos almacenados en ella
            msj = "Sesion eliminada";
        }
        return msj;
    }
}
