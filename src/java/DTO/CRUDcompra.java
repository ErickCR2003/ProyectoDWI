package DTO;

import DAO.DAOcompra;
import Modelo.Compra;
import Modelo.ItemCarrito;
import Modelo.Usuario;
import config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CRUDcompra implements DAOcompra {

    private final Conexion conexion;
    private String mensaje;

    public CRUDcompra() {
        conexion = new Conexion();
    }

    @Override
    public String generarCompra(Compra compra) {
        String sql = "INSERT INTO compra(id_cliente, id_metodopago, fechaHoraCreacion, monto, estado) values (?,?,?,?,?)";
        //creamos la consulta
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, compra.getId_cliente());
            ps.setInt(2, compra.getId_metodoPago());
            ps.setString(3, compra.getFechaHora());
            ps.setDouble(4, compra.getMonto());
            ps.setString(5, compra.getEstado());
            int ctos = ps.executeUpdate();
            mensaje = (ctos == 0)
                    ? "Cero filas insertadas"
                    : null;

        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return mensaje;
    }

    @Override
    public int ultimoID() {
        int idcompra = 0;
        String sql = "SELECT ID_compra FROM compra ORDER BY ID_compra DESC LIMIT 1;";
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql);
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            if (rs.next()) {
                idcompra = rs.getInt(1);
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return idcompra;
    }

    @Override
    public String generarDetalles(List<ItemCarrito> detalles, int idcompra) {
        String sql = "INSERT INTO detallecompras(id_producto, id_compra, cantidad, precioCompra, subtotal) values (?,?,?,?,?)";
        try (Connection cn = conexion.getConexion()) {
            for (ItemCarrito detalle : detalles) {
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setInt(1, detalle.getId_producto());
                ps.setInt(2, idcompra);
                ps.setInt(3, detalle.getCantidad());
                ps.setDouble(4, detalle.getPrecio());
                ps.setDouble(5, (detalle.getCantidad()*detalle.getPrecio()));
                ps.executeUpdate();
                ps.close();
            }

        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return mensaje;
    }
    
    @Override
    public String getMensaje() {
        return mensaje;
    }

    @Override
    public List<Compra> listaCompras() {
        List<Compra> listacompras = new ArrayList<>();
        //creamos e inicializamos la variable a usar
        Compra c = null;
        //creamos un String Builder
        StringBuilder sql = new StringBuilder();
        //creamos la consulta
        sql.append("SELECT ")
                .append("* FROM compra");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            //Ejecutamos la consulta
            ResultSet rs = ps.executeQuery();
            //Si existe respuesta la rpta se le asignará el valor de "true"
            while (rs.next()) {
                c = new Compra();
                c.setID(rs.getInt(1));
                c.setId_cliente(rs.getInt(2));
                c.setId_metodoPago(rs.getInt(3));
                c.setFechaHora(rs.getString(4));
                c.setMonto(rs.getDouble(5));
                c.setEstado(rs.getString(6));
                
                CRUDusuario crudu = new CRUDusuario();
                Usuario user = crudu.ConsultaUsuarioByID(c.getId_cliente());
                c.setUsuario(user);
                
                listacompras.add(c);
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            conexion.cerrarconexion();
        }
        return listacompras;
    }

}
