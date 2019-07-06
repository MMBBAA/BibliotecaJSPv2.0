
package Conexion;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase DBConnection version2
 * @author AlbertoPortatil
 */
public class DBConnection {
    
private static Connection connection = null;
//metodo get
    public static Connection get() {
        if (connection == null) {
            try {
                create();
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return connection;
    }
    //metodo privado que crea la conexion
    private static void create() throws ClassNotFoundException, SQLException {
        /* parametros para la conexión a la base de datos */
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/bibliov3";
        String user = "root";
        String password = "";    
        Class.forName(driver);//instancia el driver y crea la conexion a través del driverManager
        connection = (Connection)DriverManager.getConnection(url, user, password);
        if (connection.isClosed())
            throw new SQLException("Connection closed by server");
    }
    //metodo que cierra las conexiones
    public static void close() throws SQLException  {
        if (connection == null)
            return;        
        connection.close();
        connection = null;
    }
}
