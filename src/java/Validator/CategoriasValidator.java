package Validator;

import DAO.DAOcategoria;
import DTO.CRUDcategoria;
import Modelo.Categoria;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class CategoriasValidator {

    private HttpServletRequest request;
    private DAOcategoria dao;

    public CategoriasValidator(HttpServletRequest request) {
        this.request = request;
        this.dao = new CRUDcategoria();
    }

    public String listaCategorias() {
        String msj = null;
        List<Categoria> lista = dao.listarCategorias();
        if (lista != null) {
            request.setAttribute("listaCategorias", lista);
        } else {
            msj = dao.getMensaje();
        }
        return msj;
    }

}

