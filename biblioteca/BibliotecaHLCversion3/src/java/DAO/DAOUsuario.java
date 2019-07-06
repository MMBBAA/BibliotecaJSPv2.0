package DAO;

import Conexion.DBConnection;
import Entidades.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DAOUsuario {

    /**
     * metodo SelectDniAndAltaSi, este metodo devuelve un objeto usuario de alta
     * que coincide con el DNI que nos dice si ese usuario está en el sistema de
     * alta
     */
    public Usuario SelectDniAndAltaSi(String DNI) throws Exception {

        if ((DNI == null) || (DNI.isEmpty())) {
            return null;
        }
        Usuario usuario = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {//si la conexión es nula lanza una excepción
                throw new Exception("No se ha podido establecer conexion");
            }
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM usuario WHERE DNI = '" + DNI + "' AND deAlta = 'si'");

            if (rs.next()) {
                usuario = new Usuario(rs.getString("DNI"), rs.getString("nombre"),
                        rs.getString("apellidos"), rs.getString("deAlta"));
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return usuario;

    }

    /**
     * metodo SelectDniAndAltaNo, este metodo devuelve un objeto usuario de alta
     * que coincide con el DNI que nos dice si ese usuario está en el sistema de
     * baja
     */
    public Usuario SelectDniAndAltaNo(String DNI) throws Exception {

        if ((DNI == null) || (DNI.isEmpty())) {
            return null;
        }
        Usuario usuario = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {//si la conexión es nula lanza una excepción
                throw new Exception("No se ha podido establecer conexion");
            }
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM usuario WHERE DNI = '" + DNI + "' AND deAlta = 'no'");

            if (rs.next()) {
                usuario = new Usuario(rs.getString("DNI"), rs.getString("nombre"),
                        rs.getString("apellidos"), rs.getString("deAlta"));
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return usuario;
    }

    /**
     * metodo void createUsuarioPorParametros,se le pasan por cabecera los
     * parámetros buscandos del formulario y crea un usuario nuevo de alta en el
     * sistema
     */
    public void createUsuarioPorParametros(String DNI, String nombre, String apellidos, String deAlta) throws Exception {

        if ((DNI == null) || (DNI.isEmpty())) {
            throw new Exception("DNI no debe ser nulo");
        }
        if ((nombre == null) || (nombre.isEmpty())) {
            throw new Exception("nombre no debe ser nulo");
        }
        if ((apellidos == null) || (apellidos.isEmpty())) {
            throw new Exception("APellidos no debe ser nulo");
        }

        Usuario usuario = new Usuario(DNI, nombre, apellidos);
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            String query = "INSERT INTO usuario (DNI, nombre, apellidos,deAlta) VALUES (?, ?, ?,?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, usuario.getDNI());
            statement.setString(2, usuario.getNombre());
            statement.setString(3, usuario.getApellidos());
            statement.setString(4, usuario.getDeAlta());
            statement.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
    }

    /**
     * metodo selectUsuario, nos mostrará todos los usuarios que estén de Alta o
     * Baja en el sistema por nombre o apellido,se le pasa por cabecera estos
     * parámetros
     */
    public ArrayList<Usuario> selectUsuario(String parametroAlta, String parametro) throws Exception {
        ArrayList<Usuario> usuarios = null;

        String deAltaEstado = parametroAlta;
        String nombreCol = parametro;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM usuario WHERE deAlta = '" + deAltaEstado + "' ORDER BY " + nombreCol + " ");

            usuarios = new ArrayList();
            while (rs.next()) {
                Usuario usuario = new Usuario(rs.getString("DNI"), rs.getString("nombre"),
                        rs.getString("apellidos"), rs.getString("deAlta"));
                usuarios.add(usuario);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return usuarios;
    }

    /**
     * metodo updateUsuarioEnBaja, recibe un DNI y nos devuelve un objeto
     * Usuario;Nos permite actualizar un usuario que esté de baja y pasarlo a
     * alta
     */
    public Usuario updateUsuarioEnBaja(String DNI) throws Exception {
        if ((DNI == null) || (DNI.isEmpty())) {
            throw new Exception("DNI no debe ser nulo");
        }

        Usuario usuario = SelectDniAndAltaNo(DNI);
        if (usuario == null) {
            throw new Exception("El usuario no existe");
        }
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            String query = "UPDATE usuario SET deAlta='si' WHERE DNI=? AND deAlta='no'";

            PreparedStatement statement = connection.prepareStatement(query);
            //statement.setString(1, nombre);
            //statement.setString(2, apellidos);
            //statement.setString(1, deAlta);
            statement.setString(1, DNI);
            statement.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        usuario = SelectDniAndAltaSi(DNI);
        return usuario;
    }

    /**
     * metodo selectAllUsuarios, método que selecciona todos los usuarios que
     * estén en el sistema, independientemente de su alta o baja
     */
    public ArrayList<Usuario> selectAllUsuarios() throws Exception {
        ArrayList<Usuario> usuarios = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM usuario");

            usuarios = new ArrayList();
            while (rs.next()) {
                Usuario usuario = new Usuario(rs.getString("DNI"), rs.getString("nombre"),
                        rs.getString("apellidos"), rs.getString("deAlta"));
                usuarios.add(usuario);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return usuarios;
    }

    /**
     * seleccion de usuarios por DNI, devuelve un objeto usuario con el DNI
     * pasado por cabecera, estén o no de baja
     */
    public Usuario selectByDNI(String DNI) throws Exception {//trabajando en el
        if ((DNI == null) || (DNI.isEmpty())) {
            return null;
        }
        Usuario usuario = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM usuario WHERE DNI = '" + DNI + "'");

            if (rs.next()) {
                usuario = new Usuario(rs.getString("DNI"), rs.getString("nombre"),
                        rs.getString("apellidos"), rs.getString("deAlta"));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return usuario;
    }

    /**
     * metodo update usuarios, se le pasan DNI, nombre y apellidos y actualiza,
     * independientemente de si está de alta o baja, devuelve un objeto Usuario
     * con nombre y apellidos actualizados.
     */
    public Usuario update(String DNI, String nombre, String apellidos) throws Exception {
        if ((DNI == null) || (DNI.isEmpty())) {
            throw new Exception("DNI no debe ser nulo");
        }
        if ((nombre == null) || (nombre.isEmpty())) {
            throw new Exception("nombre no debe ser nulo");
        }
        if ((apellidos == null) || (apellidos.isEmpty())) {
            throw new Exception("apellidos no debe ser nulo");
        }

        Usuario usuario = selectByDNI(DNI);
        if (usuario == null) {
            throw new Exception("El usuario no existe");
        }
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            String query = "UPDATE usuario SET nombre=?, apellidos=? WHERE DNI=?";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, nombre);
            statement.setString(2, apellidos);
            statement.setString(3, DNI);
            statement.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        usuario = selectByDNI(DNI);
        return usuario;
    }

    /**
     * metodo DarUsuarioBaja,recibe DNI por cabecera y busca usuarios que tengan
     * fecha de devolución de prestamos en null, si devuelve usuarios (!null),
     * es que tiene préstamos pendientes, en caso contrario (null) no tiene
     * prestamos pendientes
     */
    public Usuario DarUsuarioBaja(String DNI) throws Exception {

        if ((DNI == null) || (DNI.isEmpty())) {
            return null;
        }
        Usuario usuario = null;
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }
            Statement statement = connection.createStatement();
            
            ResultSet rs = statement.executeQuery("SELECT * FROM usuario WHERE "
                    + "DNI = '" + DNI + "' AND deAlta='si' AND DNI IN(SELECT DNIusuario FROM prestamo WHERE `Fechadevolucion` IS NULL)");

            if (rs.next()) {
                usuario = new Usuario(rs.getString("DNI"), rs.getString("nombre"),
                        rs.getString("apellidos"), rs.getString("deAlta"));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        return usuario;
    }
    
    /**
     * metodo updateNo de usuario, recibe DNI por cabecera y retorna un objeto 
     * Usuario con deAlta actualizada a no.
     */
    public Usuario updateNo(String DNI) throws Exception {
        if ( DNI.isEmpty()) {
            throw new Exception("DNI no debe ser nulo");
        }

        Usuario usuario = selectByDNI(DNI);
        if (usuario == null) {
            throw new Exception("El usuario no existe");
        }
        try (Connection connection = DBConnection.get()) {
            if (connection == null) {
                throw new Exception("Connection is null");
            }

            String query = "UPDATE usuario SET deAlta='no' WHERE DNI=? AND deAlta='si'";

            PreparedStatement statement = connection.prepareStatement(query);
            //statement.setString(1, nombre);
            //statement.setString(2, apellidos);
            //statement.setString(1, deAlta);
            statement.setString(1, DNI);
            statement.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBConnection.close();
        }
        usuario = selectByDNI(DNI);
        return usuario;
    }
}
