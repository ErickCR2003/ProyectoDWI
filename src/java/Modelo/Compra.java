
package Modelo;

import java.util.List;

public class Compra {
    private int ID;
    private String fechaHora;
    private double monto;
    private String estado;
        
    private Usuario usuario;
    private int id_cliente;
    
    private MetodoPago metodoPago;
    private int id_metodoPago;
    
    private List<ItemCarrito> detalleCompras;

    public Compra() {
    }

    public Compra(String fechaHora, double monto, String estado, int id_cliente, int id_metodoPago, List<ItemCarrito> detalleCompras) {
        this.fechaHora = fechaHora;
        this.monto = monto;
        this.estado = estado;
        this.id_cliente = id_cliente;
        this.id_metodoPago = id_metodoPago;
        this.detalleCompras = detalleCompras;
    }
    
    public List<ItemCarrito> getDetalleCompras() {
        return detalleCompras;
    }

    public void setDetalleCompras(List<ItemCarrito> detalleCompras) {
        this.detalleCompras = detalleCompras;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public MetodoPago getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(MetodoPago metodoPago) {
        this.metodoPago = metodoPago;
    }

    public int getId_metodoPago() {
        return id_metodoPago;
    }

    public void setId_metodoPago(int id_metodoPago) {
        this.id_metodoPago = id_metodoPago;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }
    
    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
    
    
}
