package DTO;

import Modelo.Producto;
import config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import DAO.DAOproducto;
import Modelo.ItemCarrito;


public class CRUDproducto implements DAOproducto {

    private final Conexion conexion;
    private String mensaje;

    public CRUDproducto() {
        conexion = new Conexion();
    }

    @Override
    public List<Producto> listarproductos() {

        List<Producto> listaproductos = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM producto");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                Producto p = new Producto();
                p.setID(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setGenero(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                p.setImagen(rs.getString(7));
                p.setCategoria(rs.getString(8));
                p.setColor(rs.getString(9));
                p.setTalla(rs.getInt(10));
                p.setMarca(rs.getString(11));
                listaproductos.add(p);
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return listaproductos;
    }

    @Override
    public String getMensaje() {
        return mensaje;
    }

    @Override
    public Producto listarporID(int ID) {
        
        Producto p = null;
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM producto where ID = " + ID);
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                p = new Producto();
                p.setID(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                p.setImagen(rs.getString(7));
                p.setColor(rs.getString(9));
                p.setTalla(rs.getInt(10));
                p.setMarca(rs.getString(11));
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return p;
    }

    @Override
    public int cantidadProductoByID(int ID) {
        int c = 0;
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("stock FROM producto where ID = " + ID);
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            if (rs.next()) {
                c = rs.getInt(1);
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return c;
    }

    @Override
    public String restarCantidadDelStock(List<ItemCarrito> carrito) {
        try (Connection cn = conexion.getConexion()) {
            for (ItemCarrito item : carrito) {
                String sql = "UPDATE producto SET stock = stock-"+item.getCantidad()+" WHERE ID = "+item.getId_producto()+";";
                try (PreparedStatement ps = cn.prepareStatement(sql)) {
                    ps.executeUpdate();
                }
            }

        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return mensaje;
    }
    
    @Override
    public String insertProducto(Producto p){
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO `producto`(`nombre`, `genero`, `descripcion`, `precio`, "
                + "`stock`, `imagen`, `categoria`, `color`, `talla`, `marca`, `id_categoria`, "
                + "`id_empleado`, `id_talla`, `id_marca`, `id_color`)")
                .append(" VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getGenero());
            ps.setString(3, p.getDescripcion());
            ps.setDouble(4, Double.parseDouble(p.getPrecio()));
            ps.setInt(5, p.getStock());
            ps.setString(6, p.getImagen());
            ps.setString(7, p.getCategoria());
            ps.setString(8, p.getColor());
            ps.setInt(9, p.getTalla());
            ps.setString(10, p.getMarca());
            ps.setInt(11, p.getId_categoria());
            ps.setInt(12, p.getId_empleado());
            ps.setInt(13, p.getId_talla());
            ps.setInt(14, p.getId_marca());
            ps.setInt(15, p.getId_color());
            
            int ctos = ps.executeUpdate();
            mensaje = (ctos == 0)
                    ? "Cero filas insertadas"
                    : null;
            
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return mensaje;
    }
    
    
    
}
