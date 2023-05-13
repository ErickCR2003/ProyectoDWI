/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Modelo.Producto;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author carra
 */
public class CRUDproducto extends ConexionBD {

    public CRUDproducto() {
    }

    public List listarproductos() throws SQLException {

        List<Producto> listaproductos = new ArrayList<>();

        try {
            this.obtenerconexion();
            rs = st.executeQuery("SELECT * FROM producto");
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setMarca(rs.getString(3));
                p.setTalla(rs.getInt(4));
                p.setColor(rs.getString(5));
                p.setPrecio(rs.getDouble(6));
                p.setStock(rs.getInt(7));
                listaproductos.add(p);
            }

        } catch (Exception ex) {
            throw new SQLException("ERROR! No se puede insertar los autores al combobox..." + ex);
        } finally {
            this.cerrarconexion();
        }
        return listaproductos;
    }

    public void listarIMG(int id, HttpServletResponse response) throws SQLException {
        
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;

        try {
            outputStream = response.getOutputStream();
            this.obtenerconexion();
            rs = st.executeQuery("SELECT * FROM producto where id_producto=" + id);
            if (rs.next()) {
                inputStream = rs.getBinaryStream("Foto");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            
            while ((i=bufferedInputStream.read())!=-1) {                
                bufferedOutputStream.write(i);
            }
          

        } catch (Exception ex) {
            throw new SQLException("ERROR! No se puede insertar los autores al combobox..." + ex);
        } finally {
            this.cerrarconexion();
        }
    }

}
