
package DAO;

import Modelo.Categoria;
import java.util.List;

public interface DAOcategoria {
    
    List<Categoria> listarCategorias();
    Categoria categoriabyID(int id);
    public String getMensaje();
    
}
