package DAO;

import Conexion.DBConnection;
import Entidades.Obra;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DAOObra {

    /**
     * metodo SelectISBNAndOperativoSi, este metodo devuelve un objeto obra con
     * operativo=si que coincide con el ISBN que nos dice si esa obra está en el
     * sistema operativa
     */
    public Obra SelectISBNAndOperativoSi(String ISBN) throws Exception {

        if ((ISBN == null) || (ISBN.isEmpty())) {
            return null;
        }
        Obra obra = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {//si la conexión es nula lanza una excepción
                throw new Exception("No se ha podido establecer conexion");
            }
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM obra WHERE ISBN = '" + ISBN + "' AND operativo = 'si'");

            if (rs.next()) {
                obra = new Obra(rs.getString("ISBN"), rs.getString("titulo"),
                        rs.getString("autor"), rs.getString("editorial"), rs.getString("operativo"));
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return obra;

    }

    /**
     * metodo SelectISBNAndOperativoNo, este metodo devuelve un objeto obra con
     * operativo=no que coincide con el ISBN que nos dice si esa obra está en el
     * sistema no operativa
     */
    public Obra SelectISBNAndOperativoNo(String ISBN) throws Exception {

        if ((ISBN == null) || (ISBN.isEmpty())) {
            return null;
        }
        Obra obra = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("No se ha podido establecer conexion");
            }
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM obra WHERE ISBN = '" + ISBN + "' AND operativo = 'no'");

            if (rs.next()) {

                obra = new Obra(rs.getString("ISBN"), rs.getString("titulo"),
                        rs.getString("autor"), rs.getString("editorial"), rs.getString("operativo"));
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return obra;
    }

    /**
     * metodo updateObraEnBaja, recibe un ISBN y nos devuelve un objeto obra;Nos
     * permite actualizar una obra que esté no operativa y pasarla a operativa
     */
    public Obra updateObraEnBaja(String ISBN) throws Exception {

        if ((ISBN == null) || (ISBN.isEmpty())) {
            throw new Exception("ISBN no debe ser nulo");
        }

        Obra obra = SelectISBNAndOperativoNo(ISBN);
        if (obra == null) {
            throw new Exception("La obra no existe");
        }
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            String query = "UPDATE obra SET operativo='si' WHERE ISBN=? AND operativo='no'";

            PreparedStatement statement = connection.prepareStatement(query);
            //statement.setString(1, nombre);
            //statement.setString(2, apellidos);
            //statement.setString(1, deAlta);
            statement.setString(1, ISBN);
            statement.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        obra = SelectISBNAndOperativoSi(ISBN);
        return obra;
    }

    /**
     * metodo updateObraEnAlta, recibe un ISBN y nos devuelve un objeto obra;Nos
     * permite actualizar una obra que esté operativa y pasarla a no operativa
     */
    public Obra updateObraEnAlta(String ISBN) throws Exception {

        if ((ISBN == null) || (ISBN.isEmpty())) {
            throw new Exception("ISBN no debe ser nulo");
        }

        Obra obra = SelectISBNAndOperativoSi(ISBN);
        if (obra == null) {
            throw new Exception("La obra no existe");
        }
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            String query = "UPDATE obra SET operativo='no' WHERE ISBN=? AND operativo='si'";

            PreparedStatement statement = connection.prepareStatement(query);
            //statement.setString(1, nombre);
            //statement.setString(2, apellidos);
            //statement.setString(1, deAlta);
            statement.setString(1, ISBN);
            statement.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        obra = SelectISBNAndOperativoSi(ISBN);
        return obra;
    }

    /**
     * metodo void createObraPorParametros,se le pasan por cabecera los
     * parámetros buscandos del formulario y crea una obra nueva de alta en el
     * sistema
     */
    public void createObraPorParametros(String ISBN, String titulo, String autor, String editorial) throws Exception {

        if ((ISBN == null) || (ISBN.isEmpty())) {
            throw new Exception("El ISBN no debe ser nulo");
        }
        if ((titulo == null) || (titulo.isEmpty())) {
            throw new Exception("el título no debe estar vacio");
        }
        if ((autor == null) || (autor.isEmpty())) {
            throw new Exception("La obra debe tener un autor");
        }
        if ((editorial == null) || (editorial.isEmpty())) {
            throw new Exception("La obra debe tener una editorial");
        }

        Obra obra = new Obra(ISBN, titulo, autor, editorial);
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            String query = "INSERT INTO obra (ISBN, titulo, autor,editorial,operativo) VALUES (?, ?, ?,?,?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, obra.getISBN());
            statement.setString(2, obra.getTitulo());
            statement.setString(3, obra.getAutor());
            statement.setString(4, obra.getEditorial());
            statement.setString(5, obra.getOperativo());
            statement.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
    }

    /**
     * metodo selectObra, nos mostrará todas las obras que estén de Alta o Baja
     * en el sistema por titulo o autor,se le pasan por cabecera estos
     * parámetros
     */
    public ArrayList<Obra> selectObra(String parametroAlta, String parametro) throws Exception {
        ArrayList<Obra> obras = null;
        String deAltaEstado = parametroAlta;
        String nombreCol = parametro;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM obra WHERE operativo = '" + deAltaEstado + "' ORDER BY " + nombreCol + " ");

            obras = new ArrayList();
            while (rs.next()) {
                Obra obra = new Obra(rs.getString("ISBN"), rs.getString("titulo"),
                        rs.getString("autor"), rs.getString("editorial"), rs.getString("operativo"));
                obras.add(obra);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return obras;
    }

    /**
     * metodo selectAllObras, método que selecciona todas las obras que estén en
     * el sistema, independientemente de su alta o baja
     */
    public ArrayList<Obra> selectAllObras() throws Exception {
        ArrayList<Obra> obras = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM obra");

            obras = new ArrayList();
            while (rs.next()) {
                Obra obra = new Obra(rs.getString("ISBN"), rs.getString("titulo"),
                        rs.getString("autor"), rs.getString("editorial"), rs.getString("operativo"));
                obras.add(obra);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return obras;
    }

    /**
     * seleccion de obras por ISBN, devuelve un objeto obra con el ISBN pasado
     * por cabecera, estén o no operativos
     */
    public Obra selectByISBN(String ISBN) throws Exception {
        if ((ISBN == null) || (ISBN.isEmpty())) {
            return null;
        }
        Obra obra = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM obra WHERE ISBN = '" + ISBN + "'");

            if (rs.next()) {
                obra = new Obra(rs.getString("ISBN"), rs.getString("titulo"),
                        rs.getString("autor"), rs.getString("editorial"), rs.getString("operativo"));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return obra;
    }

    /**
     * metodo update obra, se le pasan ISBN, titulo,autor y editorial y
     * actualiza, independientemente de si está de alta o baja, devuelve un
     * objeto Obra con titulo, autor y editorial actualizados.
     */
    public Obra update(String ISBN, String titulo, String autor, String editorial) throws Exception {
        if ((ISBN == null) || (ISBN.isEmpty())) {
            throw new Exception("DNI no debe ser nulo");
        }
        if ((titulo == null) || (titulo.isEmpty())) {
            throw new Exception("nombre no debe ser nulo");
        }
        if ((autor == null) || (autor.isEmpty())) {
            throw new Exception("apellidos no debe ser nulo");
        }
        if ((editorial == null) || (editorial.isEmpty())) {
            throw new Exception("apellidos no debe ser nulo");
        }
        Obra obra = selectByISBN(ISBN);
        if (obra == null) {
            throw new Exception("El usuario no existe");
        }
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            String query = "UPDATE obra SET titulo=?, autor=?, editorial=? WHERE ISBN=?";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, titulo);
            statement.setString(2, autor);
            statement.setString(3, editorial);
            statement.setString(4, ISBN);
            statement.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        obra = selectByISBN(ISBN);
        return obra;
    }

    /*selectObrasAlquilables, retorna un array de obras que estén operativas y que no estén sin devolver*/
    public ArrayList<Obra> selectObrasAlquilables() throws Exception {

        ArrayList<Obra> obras = null;

        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }
            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM obra WHERE operativo='si' "
                    + "AND ISBN IN(SELECT ISBNobra FROM prestamo WHERE `Fechadevolucion` IS NOT NULL)");

            obras = new ArrayList();
            while (rs.next()) {
                Obra obra = new Obra(rs.getString("ISBN"), rs.getString("titulo"),
                        rs.getString("autor"), rs.getString("editorial"), rs.getString("operativo"));
                obras.add(obra);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return obras;
    }
}
