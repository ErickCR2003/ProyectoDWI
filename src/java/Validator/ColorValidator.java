
package Validator;

import DAO.DAOcolor;
import DTO.CRUDcolor;
import Modelo.Color;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class ColorValidator {
    
    private HttpServletRequest request;
    private DAOcolor dao;

    public ColorValidator(HttpServletRequest request) {
        this.request = request;
        this.dao = new CRUDcolor();
    }
    
    public String listaColor() {
        String msj = null;
        List<Color> lista = dao.listarColor();
        if (lista != null) {
            request.setAttribute("listaColor", lista);
        } else {
            msj = dao.getMensaje();
        }
        return msj;
    }
    
}
