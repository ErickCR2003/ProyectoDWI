
package Validator;

import DAO.DAOcompra;
import DTO.CRUDcompra;
import Modelo.Compra;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class CompraValidator {
    
    private HttpServletRequest request;
    private DAOcompra dao;

    public CompraValidator(HttpServletRequest request) {
        this.request = request;
        this.dao = new CRUDcompra();
    }
    
    public String listaCompras() {
        String msj = null;
        List<Compra> lista = dao.listaCompras();
        if (lista != null) {
            request.setAttribute("listacompras", lista);
        } else {
            msj = dao.getMensaje();
        }
        return msj;
    }
 
}
