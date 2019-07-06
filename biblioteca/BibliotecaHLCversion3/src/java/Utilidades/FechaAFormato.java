package Utilidades;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author AlbertoPortatil
 */
public class FechaAFormato {

    public String FechaATexto(Date fecha) {
        if (fecha == null) {
            return " pendiente";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");//cambio de formato de fecha a día/mes/año
        return sdf.format(fecha);
    }
}
