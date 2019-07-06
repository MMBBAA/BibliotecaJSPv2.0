<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Usuario"%>
<%@page import="DAO.DAOUsuario"%>
<%@page import="Utilidades.ValidadorDNI"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuario" class="Entidades.Usuario"></jsp:useBean> 
<jsp:setProperty name="usuario" property="*"/>

<%
    String message = "";
    String DNIDarDeBaja = "";
    ValidadorDNI validador = new ValidadorDNI();

    try {
        if (request.getParameter("DNI").isEmpty()) {
            message = "El campo DNI no puede estar vacio.";
        } else {
            if (validador.validar(request.getParameter("DNI")) == false) {
                message = "El DNI que ha introducido no es válido";
            } else {
                DNIDarDeBaja = request.getParameter("DNI");
                DAOUsuario dao = new DAOUsuario();
                Usuario usuariosBusqueda = dao.DarUsuarioBaja(DNIDarDeBaja);
                if (usuariosBusqueda != null) {
                    message = "El usuario no puede darse de baja,tiene préstamos pendientes";
                } else {
                    dao.updateNo(DNIDarDeBaja);
                    message = "Usuario dado de baja correctamente.";
                }
            }
        }
    } catch (Exception ex) {
        message = ex.getMessage();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>formDarBajaUsuario2</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <div class="titulo">
            <h1>BIBLIOTECA - Dar usuarios de baja</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2>
                    <h2><a href="V2formDarBajaUsuario1.jsp">Atras</a></h2> 
                </div>
                <form method="POST" action="V2formDarBajaUsuario2.jsp">
                    <input name="updating" type="hidden" value="1"/>
                    <%if (!message.isEmpty()) {%>
                    <input class="mensajes" name="message" type="text" style="width:400px" value="<%=message%>"/>
                    <%} else { %>
                    <br/><br/>
                    <%}%>
                </form>
            </div>
        </div>
    </body>
</html>