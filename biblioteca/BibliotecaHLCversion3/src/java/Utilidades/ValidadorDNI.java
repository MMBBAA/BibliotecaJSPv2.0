package Utilidades;

/**
 * @author AlbertoPortatil
 */
public class ValidadorDNI {

    public boolean validar(String dni) {

        boolean esValido = false;
        int i = 0;
        int caracterASCII = 0;
        char letra = ' ';
        int miDNI = 0;
        int resto = 0;
        char[] asignacionLetra = {'T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 
            'X', 'B', 'N', 'J', 'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E'};

        if (dni.length() == 9 && Character.isLetter(dni.charAt(8))) {

            do {
                caracterASCII = dni.codePointAt(i);
                esValido = (caracterASCII > 47 && caracterASCII < 58);
                i++;
            } while (i < dni.length() - 1 && esValido);
        }

        if (esValido) {
            letra = Character.toUpperCase(dni.charAt(8));
            miDNI = Integer.parseInt(dni.substring(0, 8));
            resto = miDNI % 23;
            esValido = (letra == asignacionLetra[resto]);
        }

        return esValido;
    }
}
