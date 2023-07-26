
package DTO;

import DAO.DAOcategoria;
import Modelo.Categoria;
import config.Conexion;
import java.util.ArrayList;
import java.sql.*;
import java.util.List;

public class CRUDcategoria implements DAOcategoria{
    
    private final Conexion conexion;
    private String mensaje;

    public CRUDcategoria() {
        conexion = new Conexion();
    }

    @Override
    public String getMensaje() {
        return mensaje;
    }

    @Override
    public List<Categoria> listarCategorias() {
    
        List<Categoria> lista = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM categoria");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                Categoria p = new Categoria();
                p.setID(rs.getInt(1));
                p.setNombre(rs.getString(2));
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
    public Categoria categoriabyID(int id) {
        Categoria c = null;
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM categoria WHERE ID="+id);
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                c = new Categoria();
                c.setID(rs.getInt(1));
                c.setNombre(rs.getString(2));
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return c;
        
    }
        

    
}
