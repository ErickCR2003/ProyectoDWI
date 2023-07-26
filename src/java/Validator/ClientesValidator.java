package Validator;

import DAO.DAOusuario;
import DTO.CRUDusuario;
import Modelo.Usuario;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.json.JSONArray;
import org.json.JSONObject;

public class ClientesValidator {

    private HttpServletRequest request;
    private DAOusuario dao;

    public ClientesValidator(HttpServletRequest request) {
        this.request = request;
        this.dao = new CRUDusuario();
    }

    public String listaClientes() {
        String msj = null;
        List<Usuario> lista = dao.listaUsuarios();
        if (lista != null) {
            request.setAttribute("listausuarios", lista);
        } else {
            msj = dao.getMensaje();
        }
        return msj;
    }

    public String obtenerCliente(){
        String json = null;
        int id = Integer.parseInt(request.getParameter("id"));
        Usuario user = dao.ConsultaUsuarioByID(id);
        if (user != null) {
            JSONObject jsonUser = new JSONObject();
            jsonUser.put("nombre", user.getNombre());
            jsonUser.put("apellido", user.getApellido());
            jsonUser.put("email", user.getEmail());
            jsonUser.put("fecNacimiento", user.getFecNacimiento());
            jsonUser.put("dni", user.getDni());
            
            json = jsonUser.toString();
            // Utiliza el JSON como desees, por ejemplo, puedes imprimirlo en la consola
            
        } else {
            json = dao.getMensaje();
        }
        return json;
    }
    
    public String actualizarCliente(){
        String json = null;
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String dni = request.getParameter("dni");
        String fecNacimiento = request.getParameter("fecha");
        
        Usuario user = new Usuario();
        user.setNombre(nombre);
        user.setApellido(apellido);
        user.setEmail(email);
        user.setDni(dni);
        user.setFecNacimiento(fecNacimiento);
        
        json = dao.actualizarUsuarioByID(user, id);

        return json;
    }
}
