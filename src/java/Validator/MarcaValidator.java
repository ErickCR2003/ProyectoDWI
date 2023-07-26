
package Validator;

import DAO.DAOmarca;
import DTO.CRUDmarca;
import Modelo.Marca;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class MarcaValidator {
    
    private HttpServletRequest request;
    private DAOmarca dao;

    public MarcaValidator(HttpServletRequest request) {
        this.request = request;
        this.dao = new CRUDmarca();
    }
    
    public String listaMarca() {
        String msj = null;
        List<Marca> lista = dao.listarMarca();
        if (lista != null) {
            request.setAttribute("listaMarca", lista);
        } else {
            msj = dao.getMensaje();
        }
        return msj;
    }
    
}
