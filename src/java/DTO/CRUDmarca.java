
package DTO;

import DAO.DAOmarca;
import Modelo.Marca;
import config.Conexion;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class CRUDmarca implements DAOmarca{
    
    private final Conexion conexion;
    private String mensaje;

    public CRUDmarca() {
        conexion = new Conexion();
    }

    @Override
    public List<Marca> listarMarca() {
        List<Marca> lista = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM marca");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                Marca p = new Marca();
                p.setID(rs.getInt(1));
                p.setMarca(rs.getString(2));
                lista.add(p);
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return lista;
    }

    @Override
    public String getMensaje() {
        return mensaje;
    }

    @Override
    public Marca marcaByID(int id) {
        Marca c = null;
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM marca WHERE ID="+id);
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                c = new Marca();
                c.setID(rs.getInt(1));
                c.setMarca(rs.getString(2));
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return c;
    }
    
    
    
}
