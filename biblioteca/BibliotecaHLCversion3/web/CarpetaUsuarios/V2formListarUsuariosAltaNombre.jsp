<%@page import="java.util.List"%>
<%@page import="Entidades.Usuario"%>
<%@page import="DAO.DAOUsuario"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuario" class="Entidades.Usuario" />
<jsp:setProperty name="usuario" property="*"/>
<%
    String message = "";
    List<Usuario> usuarios = null;
    DAOUsuario dao = new DAOUsuario();
    try {
        usuarios = dao.selectUsuario("si", "nombre");
    } catch (Exception ex) {
        message = ex.toString();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formListarUsuariosAltaNombre</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>   
        <div class="titulo">
            <h1>BIBLIOTECA - Lista de usuarios en alta ordenados por nombre</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2>
                    <h2><a href="V2HojaUsuarios.jsp">Atras</a></h2> 
                </div>
                <form>
                    <%if (!message.isEmpty()) {%>
                    <input class="mensajes" name="status_initial" type="text" style="width:400px" value="<%=message%>"/>
                    <%} else { %>
                    <br/><br/>
                    <table class="bordered">
                        <tr>
                            <th>DNI</th>
                            <th>nombre</th>
                            <th>apellidos</th>
                        </tr>
                        <%for (int i = 0; i < usuarios.size(); i++) {%>
                        <tr>
                            <td><%=usuarios.get(i).getDNI()%></td>
                            <td><%=usuarios.get(i).getNombre()%></td>
                            <td><%=usuarios.get(i).getApellidos()%></td>
                        </tr>                            
                        <%}%>
                    </table>
                    <%}%>
                </form>
            </div>
        </div>
    </body>
</html>