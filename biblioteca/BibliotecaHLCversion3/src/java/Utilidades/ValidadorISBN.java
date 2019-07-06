
package Utilidades;

/**
 * @author AlbertoPortatil
 */
public class ValidadorISBN {

    public boolean validarIsbn13(String isbn) {
        if (isbn == null) {
            return false;
        }
        //eliminar marcas
        isbn = isbn.replaceAll("-", "");

        //debe ser un isbn de 13 digitos
        if (isbn.length() != 13) {
            return false;
        }

        try {
            int tot = 0;
            for (int i = 0; i < 12; i++) {
                int digit = Integer.parseInt(isbn.substring(i, i + 1));
                tot += (i % 2 == 0) ? digit * 1 : digit * 3;
            }

            int checksum = 10 - (tot % 10);
            if (checksum == 10) {
                checksum = 0;
            }

            return checksum == Integer.parseInt(isbn.substring(12));
        } catch (NumberFormatException nfe) {
            return false;
        }
    }
}