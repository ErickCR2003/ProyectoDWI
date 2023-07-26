
package Validator;

import DAO.DAOtalla;
import DTO.CRUDtalla;
import Modelo.Talla;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class TallaValidator {
    
    private HttpServletRequest request;
    private DAOtalla dao;

    public TallaValidator(HttpServletRequest request) {
        this.request = request;
        this.dao = new CRUDtalla();
    }
    
    public String listaTalla() {
        String msj = null;
        List<Talla> lista = dao.listarTalla();
        if (lista != null) {
            request.setAttribute("listaTalla", lista);
        } else {
            msj = dao.getMensaje();
        }
        return msj;
    }
    
}
