package Entidades;

/**
 * clase usuario version 2
 *
 * @author AlbertoPortatil
 */
import java.io.Serializable;

/*Sobre los usuarios de la biblioteca deseamos conocer su: nombre, apellidos y DNI. 
 */
public class Usuario implements Serializable {

    String DNI = null;
    String nombre = null;
    String apellidos = null;
    String deAlta = null;

    public Usuario() {
    }

    public Usuario(String DNI, String nombre, String apellidos) {

        this.DNI = DNI;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.deAlta = "si";

    }

    public Usuario(String DNI, String nombre, String apellidos, String deAlta) {

        this.nombre = nombre;
        this.apellidos = apellidos;
        this.DNI = DNI;
        this.deAlta = deAlta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getDeAlta() {
        return deAlta;
    }

    public void setDeAlta(String deAlta) {
        this.deAlta = deAlta;
    }
}
