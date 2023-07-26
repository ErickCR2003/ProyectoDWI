
package DTO;

import DAO.DAOcolor;
import Modelo.Color;
import config.Conexion;
import java.util.List;
import java.sql.*;
import java.util.ArrayList;

public class CRUDcolor implements DAOcolor{
    
    private final Conexion conexion;
    private String mensaje;

    public CRUDcolor() {
        conexion = new Conexion();
    }

    @Override
    public List<Color> listarColor() {
        List<Color> lista = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM color");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                Color p = new Color();
                p.setID(rs.getInt(1));
                p.setColor(rs.getString(2));
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
    public Color colorByID(int id) {
        Color c = null;
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM color WHERE ID="+id);
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                c = new Color();
                c.setID(rs.getInt(1));
                c.setColor(rs.getString(2));
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return c;
    }

}
