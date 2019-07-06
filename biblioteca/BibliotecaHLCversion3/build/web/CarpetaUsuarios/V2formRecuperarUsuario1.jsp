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
        usuarios = dao.selectUsuario("no", "apellidos");
    } catch (Exception ex) {
        message = ex.toString();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formRecuperarUsuario1</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>   
        <div class="titulo">
            <h1>BIBLIOTECA - Recuperar usuarios de baja</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2>
                    <h2><a href="V2HojaUsuarios.jsp">Atras</a></h2> 
                </div>
                <form id="formulario" action="V2formRecuperarUsuario2.jsp" method="POST">
                    <fieldset>
                        <legend >Introduzca DNI</legend> 
                        <input type="text" name="DNI" placeholder="8 cifras y letra mayúscula" pattern=[0-9]{8}[A-Z]{1} maxlength="9" required=""><br> 
                        <input type="submit" class="boton_final" value="Recuperar usuario"> 
                    </fieldset>
                </form>  
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
                            <th>de alta</th>
                        </tr>
                        <%for (int i = 0; i < usuarios.size(); i++) {%>
                        <tr>
                            <td><%=usuarios.get(i).getDNI()%></td>
                            <td><%=usuarios.get(i).getNombre()%></td>
                            <td><%=usuarios.get(i).getApellidos()%></td>
                            <td><%=usuarios.get(i).getDeAlta()%></td>
                        </tr>                            
                        <%}%>
                    </table>
                    <%}%>
                </form>
            </div>
        </div>
    </body>
</html>