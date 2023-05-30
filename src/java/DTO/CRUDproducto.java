/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import Modelo.Producto;
import config.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import DAO.DAOproducto;

/**
 *
 * @author carra
 */
public class CRUDproducto implements DAOproducto {

    private final Conexion conexion;
    private String mensaje;

    public CRUDproducto() {
        conexion = new Conexion();
    }

    @Override
    public List<Producto> listarproductos(){

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

//    public void listarIMG(int id, HttpServletResponse response){
//        
//        InputStream inputStream = null;
//        OutputStream outputStream = null;
//        BufferedInputStream bufferedInputStream = null;
//        BufferedOutputStream bufferedOutputStream = null;
//
//        try {
//            outputStream = response.getOutputStream();
//            this.getConexion();
//            rs = st.executeQuery("SELECT * FROM producto where id_producto=" + id);
//            if (rs.next()) {
//                inputStream = rs.getBinaryStream("Foto");
//            }
//            bufferedInputStream = new BufferedInputStream(inputStream);
//            bufferedOutputStream = new BufferedOutputStream(outputStream);
//            int i = 0;
//            
//            while ((i=bufferedInputStream.read())!=-1) {                
//                bufferedOutputStream.write(i);
//            }
//          
//
//        } catch (Exception ex) {
//            System.out.println("Error"+ex);
//        } finally {
//            this.cerrarconexion();
//        }
//    }

    @Override
    public String getMensaje() {
        return mensaje;
    }

}
