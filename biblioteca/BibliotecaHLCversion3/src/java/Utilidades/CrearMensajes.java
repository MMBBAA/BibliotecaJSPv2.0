
package Utilidades;

import DAO.DAOObra;
import DAO.DAOPrestamo;
import DAO.DAOUsuario;
import Entidades.Obra;
import Entidades.Prestamo;
import Entidades.Usuario;

/**
 * @author AlbertoPortatil
 */
public class CrearMensajes {

    /**
     * metodo crearMensajeObras, creará un mensaje de la obra, recibe un String
     */
    public String crearMensajeObras(String ISBN) throws Exception {

        String valor = ISBN;
        String mensaje;
        Obra obra;
        DAOObra dao = new DAOObra();
        obra = dao.selectByISBN(valor);
        String nombreObra = obra.getTitulo();
        String autorObra = obra.getAutor();
        String operativo = obra.getOperativo();
        mensaje = "La obra con ese ISBN es " + nombreObra + ", su autor es "
                + autorObra + ", su estado es " + operativo + " operativo. ";
        return mensaje;

    }

    /**
     * metodo crearMensajeUsuarios, creará un mensaje del usuario, recibe un
     * String
     */
    public String crearMensajeUsuarios(String DNI) throws Exception {

        String valor = DNI;
        String mensaje;
        Usuario usuario;
        DAOUsuario dao = new DAOUsuario();
        usuario = dao.selectByDNI(valor);
        String nombre = usuario.getNombre();
        String apellidos = usuario.getApellidos();
        String deAlta = usuario.getDeAlta();
        mensaje = "El usuario con ese DNI es " + nombre + " " + apellidos + " y "
                + "" + deAlta + " está de alta";
        return mensaje;
    }
    /**
     metodo crearMensajePrestamos, devolverá un mensaje con fecha de devolución del préstamo
     * convertida al formato dd/mm/yyyy en forma de String
     */
    public String crearMensajePrestamos(int id) throws Exception {

        String mensaje;
        Prestamo prestamo;
        FechaAFormato fechaEnTexto=new FechaAFormato();
        
        DAOPrestamo dao=new DAOPrestamo();
        prestamo=dao.selectPrestamoById(id);
        String resultado=fechaEnTexto.FechaATexto(prestamo.getFechadevolucion());
        mensaje= "fecha devolucion:"+resultado;
        return mensaje;
    }
}
