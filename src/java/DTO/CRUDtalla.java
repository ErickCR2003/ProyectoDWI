
package DTO;

import DAO.DAOtalla;
import Modelo.Talla;
import config.Conexion;
import java.util.List;
import java.sql.*;
import java.util.ArrayList;


public class CRUDtalla implements DAOtalla{
    
    private final Conexion conexion;
    private String mensaje;

    public CRUDtalla() {
        conexion = new Conexion();
    }

    @Override
    public List<Talla> listarTalla() {
        List<Talla> lista = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM talla");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                Talla p = new Talla();
                p.setID(rs.getInt(1));
                p.setNumeroCalzado(rs.getString(2));
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
    public Talla tallaByID(int id) {
        Talla c = null;
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM talla WHERE ID="+id);
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                c = new Talla();
                c.setID(rs.getInt(1));
                c.setNumeroCalzado(String.valueOf(rs.getInt(2)));
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return c;
    }
           
}
