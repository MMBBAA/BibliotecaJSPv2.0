<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Usuario"%>
<%@page import="DAO.DAOUsuario"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuario" class="Entidades.Usuario"></jsp:useBean> 
<jsp:setProperty name="usuario" property="*"/>

<%
    String message = "";
    DAOUsuario dao = new DAOUsuario();
    String DNIActualizado = "";
    String nombreActualizado = "";
    String apellidoActualizado = "";
    if (((request.getParameter("DNI") == null) || (request.getParameter("DNI").isEmpty()))
            || ((request.getParameter("nombre") == null) || (request.getParameter("nombre").isEmpty()))
            || ((request.getParameter("apellidos") == null) || (request.getParameter("apellidos").isEmpty()))) {
        message = "Ningún campo del formulario debe estar vacio.";
    } else {
        DNIActualizado = request.getParameter("DNI");
        nombreActualizado = request.getParameter("nombre");
        apellidoActualizado = request.getParameter("apellidos");
        usuario = dao.update(DNIActualizado, nombreActualizado, apellidoActualizado);
        message = "usuario con DNI " + request.getParameter("DNI") + " actualizado";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formModificarUsuario3</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <div class="titulo">
            <h1>BIBLIOTECA - Modificación de usuarios</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2>
                    <h2><a href="V2formModificarUsuario1.jsp">Atras</a></h2> 
                </div>
                <form method="POST" action="V2formModificarUsuario3.jsp">
                    <input name="updating" type="hidden" value="1"/>
                    <%if (!message.isEmpty()) {%>
                    <input class="mensajes" name="message" type="text" style="width:300px" value="<%=message%>"/>
                    <%} else {%>
                    <%}%>
                </form>
            </div>
        </div>
    </body>
</html>