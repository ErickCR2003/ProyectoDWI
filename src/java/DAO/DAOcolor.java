
package DAO;

import Modelo.Color;
import java.util.List;


public interface DAOcolor {
    
    List<Color> listarColor();
    Color colorByID(int id);
    public String getMensaje();
    
}
