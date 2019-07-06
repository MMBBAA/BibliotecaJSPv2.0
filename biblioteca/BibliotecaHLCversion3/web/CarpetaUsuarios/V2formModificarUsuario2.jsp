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
    String nombreActualizar = "";
    String apellidoActualizar = "";
    ValidadorDNI validador = new ValidadorDNI();
    try {
        if (!request.getParameter("DNI").isEmpty()) {
            if (validador.validar(request.getParameter("DNI")) == false) {
                message = "El DNI que ha introducido no es válido";
            }else {
            DAOUsuario dao = new DAOUsuario();
            Usuario usuarios = dao.selectByDNI(request.getParameter("DNI"));
            if (usuarios == null) {
                message = "no existe ningún usuario con ese DNI";
            } else {
                nombreActualizar = dao.selectByDNI(request.getParameter("DNI")).getNombre();
                apellidoActualizar = dao.selectByDNI(request.getParameter("DNI")).getApellidos();
            }
            }
        } else {
            message = "El DNI  de actualización no puede ser nulo.";
        }
    } catch (Exception ex) {
        message = ex.getMessage();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formModificarUsuario2(en obras)</title>
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
                    <input class="mensajes" name="message" type="text" style="width:400px" value="<%=message%>"/>
                    <%} else {%>
                    <fieldset>
                        <legend >Modifique datos del usuario </legend> 
                        <br/>
                        <label for="DNI" id="r1">DNI</label><br>
                        <input name="DNI" type="text" style="width:200px" value="<jsp:getProperty property="DNI" name="usuario"/>" readonly=""/>
                        <br/>
                        <label for="nombre" id="r1">nombre</label><br>
                        <input name="nombre" type="text" style="width:200px" pattern=[A-Za-z]{1,15} required="" placeholder="<%=nombreActualizar%>" value="<%=nombreActualizar%>"/>
                        <br/>
                        <label for="apellidos" id="r1">apellidos</label><br>
                        <input name="apellidos" type="text" style="width:200px" pattern=[A-Za-z]{1,30} required="" placeholder="<%=apellidoActualizar%>" value="<%=apellidoActualizar%>"/>
                        <br/><br/>
                        <input type="submit" class="boton_final" value="Actualizar"/>
                        <%}%>
                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>

