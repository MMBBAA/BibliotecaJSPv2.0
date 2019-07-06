package Utilidades;

import java.util.Date;

public class InformeDevoluciones {

    public String TiempoRetraso(Date fechaDevolucion, Date fechaSolicitud) {
        String resultado;

        if (fechaDevolucion == null) {
            resultado = "sin devolver";

        } else {
            long diferenciaEnms = fechaDevolucion.getTime() - fechaSolicitud.getTime();
            long dias = diferenciaEnms / (1000 * 60 * 60 * 24);

            if (dias <= 10) {
                resultado = "devuelto en plazo";
            } else {
                resultado = "devuelto fuera de plazo";
            }
        }
        return resultado;
    }
}