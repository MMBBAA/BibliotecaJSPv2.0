
package Entidades;
/**
 * clase prestamo version 2
 * @author AlbertoPortatil
 */
import java.io.Serializable;
import java.sql.Date;

/**
 * clase prestamo version 2
 * @author AlbertoPortatil
 */
public class Prestamo implements Serializable{

    int id;
    String DNIusuario = null;
    String ISBNobra = null;
    Date Fechasolicitud = null;
    Date Fechadevolucion = null;

    public Prestamo(){}
    public Prestamo(int id, String DNIusuario, String ISBNobra,
            Date Fechasolicitud, Date Fechadevolucion) {
        this.id = id;
        this.DNIusuario = DNIusuario;
        this.ISBNobra = ISBNobra;
        this.Fechasolicitud = Fechasolicitud;
        this.Fechadevolucion = Fechadevolucion;
    }
     public Prestamo( String DNIusuario, String ISBNobra,
            Date Fechasolicitud) {
       
        this.DNIusuario = DNIusuario;
        this.ISBNobra = ISBNobra;
        this.Fechasolicitud = Fechasolicitud;
        this.Fechadevolucion = null;
    }
      public Prestamo(String DNIusuario, String ISBNobra) {
       
        this.DNIusuario = DNIusuario;
        this.ISBNobra = ISBNobra;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDNIusuario() {
        return DNIusuario;
    }

    public void setDNIusuario(String DNIusuario) {
        this.DNIusuario = DNIusuario;
    }

    public String getISBNobra() {
        return ISBNobra;
    }

    public void setISBNobra(String ISBNobra) {
        this.ISBNobra = ISBNobra;
    }

    public Date getFechasolicitud() {
        return Fechasolicitud;
    }

    public void setFechasolicitud(Date Fechasolicitud) {
        this.Fechasolicitud = Fechasolicitud;
    }

    public Date getFechadevolucion() {
        return Fechadevolucion;
    }

    public void setFechadevolucion(Date Fechadevolucion) {
        this.Fechadevolucion = Fechadevolucion;
    }

}

