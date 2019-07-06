package DAO;

import Conexion.DBConnection;
import Entidades.Prestamo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class DAOPrestamo {

    /**
     * metodo select Prestamo, nos devuelve un array con todos los préstamos,
     * estén o no devueltos
     */
    public ArrayList<Prestamo> selectPrestamo() throws Exception {
        ArrayList<Prestamo> prestamos = null;

        try (Connection connection = DBConnection.get()) {
            if (connection == null) {//si la conexión es nula lanza una excepción
                throw new Exception("Connection is null");
            }

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM prestamo");

            prestamos = new ArrayList();
            while (rs.next()) {
                Prestamo prestamo = new Prestamo(rs.getInt("id"), rs.getString("DNIusuario"),
                        rs.getString("ISBNobra"), rs.getDate("Fechasolicitud"),
                        rs.getDate("Fechadevolucion"));
                prestamos.add(prestamo);
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return prestamos;
    }

    /**
     * metodo select PrestamoByCriterio, nos devuelve un array con todos los
     * préstamos ordenados por el criterio que pasemos por cabecera
     */
    public ArrayList<Prestamo> selectPrestamoOrdenarByCriterio(String criterio) throws Exception {
        ArrayList<Prestamo> prestamos = null;
        String orden = criterio;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM prestamo ORDER BY " + orden + "");
            prestamos = new ArrayList();
            while (rs.next()) {
                Prestamo prestamo = new Prestamo(rs.getInt("id"), rs.getString("DNIusuario"),
                        rs.getString("ISBNobra"), rs.getDate("Fechasolicitud"),
                        rs.getDate("Fechadevolucion"));
                prestamos.add(prestamo);
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return prestamos;
    }

    /**
     * metodo selectPrestamoByCriterio, devuelve un préstamo existente según el
     * criterio que se pase por cabecera,criterio1 es el nombre de la columna, y
     * criterio 2 la condición
     */
    public Prestamo selectPrestamoByCriterio(String criterio1, String criterio2) throws Exception {

        if ((criterio2 == null) || (criterio2.isEmpty())) {
            return null;
        }
        String nombreColumna = criterio1;
        String nombreCriterio = criterio2;
        Prestamo prestamo = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("No se ha podido establecer conexion");
            }

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM prestamo WHERE " + nombreColumna + " = '" + nombreCriterio + "'");

            if (rs.next()) {
                prestamo = new Prestamo(rs.getInt("id"), rs.getString("DNIusuario"),
                        rs.getString("ISBNobra"), rs.getDate("Fechasolicitud"),
                        rs.getDate("Fechadevolucion"));

            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return prestamo;
    }

    /**
     * metodo selectBuscaPrestamoByCondiciones, devuelve un objeto préstamo
     * existente según dos condiciones pasadas por cabecera
     */
    public Prestamo selectBuscaPrestamoByCondiciones(String condicion1, String condicion2) throws Exception {

        if (((condicion1 == null) || (condicion1.isEmpty()))
                || ((condicion2 == null) || (condicion2.isEmpty()))) {
            return null;
        }

        String DNIusuario = condicion1;
        String ISBNobra = condicion2;
        Prestamo prestamo = null;

        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM prestamo WHERE DNIusuario= '" + DNIusuario + "' AND ISBNobra= '" + ISBNobra + "'");
            //prestamos = new ArrayList();
            while (rs.next()) {
                prestamo = new Prestamo(rs.getInt("id"), rs.getString("DNIusuario"),
                        rs.getString("ISBNobra"), rs.getDate("Fechasolicitud"),
                        rs.getDate("Fechadevolucion"));
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return prestamo;
    }

    /**
     * metodo selectPrestamoByCondiciones, devuelve los préstamos existentes
     * según dos condiciones pasadas por cabecera
     */
    public ArrayList<Prestamo> selectPrestamoByCondiciones(String condicion1, String condicion2) throws Exception {
        ArrayList<Prestamo> prestamos = null;
        String DNIusuario = condicion1;
        String ISBNobra = condicion2;

        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM prestamo WHERE DNIusuario= '" + DNIusuario + "' AND ISBNobra= '" + ISBNobra + "'");
            prestamos = new ArrayList();
            while (rs.next()) {
                Prestamo prestamo = new Prestamo(rs.getInt("id"), rs.getString("DNIusuario"),
                        rs.getString("ISBNobra"), rs.getDate("Fechasolicitud"),
                        rs.getDate("Fechadevolucion"));
                prestamos.add(prestamo);
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return prestamos;
    }

    /**
     * metodo selectPrestamoByCriterio, nos devuelve un array de Prestamos según
     * el criterio del nombre de la columna que le pasemos por cabecera y la
     * condición que debe cumplir, probando
     */
    public ArrayList<Prestamo> selectPrestamoByCondicion(String criterio, String condicion) throws Exception {
        ArrayList<Prestamo> prestamos = null;
        String nombreColumna = criterio;
        if ((condicion == null) || (condicion.isEmpty())) {
            return null;
        }
        Prestamo prestamo = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM prestamo WHERE " + nombreColumna + "= '" + condicion + "'");
            prestamos = new ArrayList();
            while (rs.next()) {
                prestamo = new Prestamo(rs.getInt("id"), rs.getString("DNIusuario"),
                        rs.getString("ISBNobra"), rs.getDate("Fechasolicitud"),
                        rs.getDate("Fechadevolucion"));
                prestamos.add(prestamo);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return prestamos;
    }

    /**
     * metodo selectPrestamosSinDevolucion, devuelve un array con los préstamos
     * que no han sido devueltos
     */
    public ArrayList<Prestamo> selectPrestamosSinDevolucion() throws Exception {
        ArrayList<Prestamo> prestamos = null;

        Prestamo prestamo = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM prestamo WHERE Fechadevolucion IS NULL");
            prestamos = new ArrayList();
            while (rs.next()) {
                prestamo = new Prestamo(rs.getInt("id"), rs.getString("DNIusuario"),
                        rs.getString("ISBNobra"), rs.getDate("Fechasolicitud"),
                        rs.getDate("Fechadevolucion"));
                prestamos.add(prestamo);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return prestamos;
    }

    /**
     * metodo selectPrestamoById, devuelve un objeto préstamo, recibe un
     * identificador por cabecera.
     */
    public Prestamo selectPrestamoById(int id) throws Exception {
        if (id < 0) {
            return null;
        }

        Prestamo prestamo = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM prestamo WHERE id = '" + id + "'");

            if (rs.next()) {
                prestamo = new Prestamo(rs.getInt("id"), rs.getString("DNIUsuario"),
                        rs.getString("ISBNObra"), rs.getDate("Fechasolicitud"),
                        rs.getDate("Fechadevolucion"));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return prestamo;
    }

    /**
     * update prestamo, método que actualiza el préstamo devuelto añadiendo una
     * fecha de devolución.
     */
    public void updatePrestamo(int id) throws Exception {
        //funciona
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }
            Date fechaHoy = new Date();
            String date2 = new SimpleDateFormat("yyyy-MM-dd").format(fechaHoy);
            String query = "UPDATE prestamo SET Fechadevolucion='" + date2 + "' WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.execute();
            // String query2 = "UPDATE obra SET disponible='si' WHERE ISBN=?";
            //  PreparedStatement statement2 = connection.prepareStatement(query2);
            // statement2.setString(1, ISBN);
            // statement2.execute();

        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
    }

    /**metodo selectBuscaPrestamoSinDevolverByCondicion, busca, y devuelve si
    lo encuentra, un préstamo para una obra concreta que esté sin devolver(la fecha de devolución 
    será NULL)*/
    public Prestamo selectBuscaPrestamoSinDevolverByCondicion(String condicion1) throws Exception {

        if ((condicion1 == null) || (condicion1.isEmpty())) {
            return null;
        }

        String ISBNobra = condicion1;
        Prestamo prestamo = null;

        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM prestamo WHERE ISBNobra= '" + ISBNobra + "' AND Fechadevolucion IS NULL");
            //prestamos = new ArrayList();
            while (rs.next()) {
                prestamo = new Prestamo(rs.getInt("id"), rs.getString("DNIusuario"),
                        rs.getString("ISBNobra"), rs.getDate("Fechasolicitud"),
                        rs.getDate("Fechadevolucion"));
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return prestamo;
    }

    /**
     * metodo createPrestamo, crea un préstamo con DNI e ISBN, no devuelve nada,
     * inserta en el sistema
     */
    public void createPrestamo(String DNIusuario, String ISBNobra) throws Exception {

        if ((DNIusuario == null) || (DNIusuario.isEmpty())) {
            throw new Exception("DNIusuario no debe ser nulo");
        }
        if ((ISBNobra == null) || (ISBNobra.isEmpty())) {
            throw new Exception("nombre no debe ser nulo");
        }

        Prestamo prestamo = new Prestamo(DNIusuario, ISBNobra);
        prestamo.setFechadevolucion(null);
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            String query = "INSERT INTO prestamo (DNIusuario, ISBNobra, Fechasolicitud, "
                    + "Fechadevolucion) VALUES (?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, prestamo.getDNIusuario());
            statement.setString(2, prestamo.getISBNobra());
            statement.setDate(3, prestamo.getFechasolicitud());
            statement.setDate(4, prestamo.getFechadevolucion());
            statement.execute();

            ResultSet rs = statement.executeQuery("SELECT * from prestamo ORDER BY id DESC LIMIT 1");

            ArrayList<Prestamo> prestamos = new ArrayList();
            while (rs.next()) {

                Prestamo prestamos1 = new Prestamo(rs.getInt("id"), rs.getString("DNIusuario"), rs.getString("ISBNobra"),
                        rs.getDate("Fechasolicitud"), rs.getDate("Fechadevolucion"));
                prestamos.add(prestamos1);
            }
            int id = prestamos.get(0).getId();
            Date fechaHoy = new Date();
            String date2 = new SimpleDateFormat("yyyy-MM-dd").format(fechaHoy);
            String query3 = "UPDATE prestamo SET Fechasolicitud='" + date2 + "' WHERE id=?";
            PreparedStatement statement3 = connection.prepareStatement(query3);
            statement3.setInt(1, id);
            statement3.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
    }
}
