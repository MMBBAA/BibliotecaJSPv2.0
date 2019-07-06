
<%@page import="Utilidades.FechaAFormato"%>
<%@page import="Utilidades.CrearMensajes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Prestamo"%>
<%@page import="DAO.DAOPrestamo"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="prestamo" class="Entidades.Prestamo"></jsp:useBean> 
<jsp:setProperty name="prestamo" property="*"/>

<%

    CrearMensajes mostrarFechaDev = new CrearMensajes();
    CrearMensajes mostrarDatosUsu = new CrearMensajes();
    CrearMensajes mostrarDatosObra = new CrearMensajes();
    String message = "";
    String informacion = "";//incluirá message 3 y message 4
    String message2 = "";//para mostrar la fecha de devolucion
    String message3 = "";//para mostrar los datos del usuario para ese DNI
    String message4 = "";//para mostrar los datos de la obra para ese ISBN
    DAOPrestamo dao = new DAOPrestamo();
    try {
        if ((prestamo.getId() >= 0)) {

            Prestamo prestamoSeleccionado = dao.selectPrestamoById(prestamo.getId());
            if (prestamoSeleccionado != null) {
                if ((prestamoSeleccionado.getFechadevolucion() == null)) {

                    dao.updatePrestamo(prestamoSeleccionado.getId());
                    message2 = mostrarFechaDev.crearMensajePrestamos(prestamo.getId());
                    message3 = mostrarDatosUsu.crearMensajeUsuarios(prestamoSeleccionado.getDNIusuario());
                    message4 = mostrarDatosObra.crearMensajeObras(prestamoSeleccionado.getISBNobra());
                    message = "Datos del préstamo devuelto: " + message2;
                    informacion = message3 + "," + message4;
                } else {
                    message = "El préstamo con ese identificador ya estaba devuelto.";
                    informacion = "No hay datos que mostar";
                }
            } else {
                message = "No existe ningun préstamo con ese identificador.";
                informacion = "No hay datos que mostar";
            }
        } else {
            message = "El identificador del préstamo debe ser superior o igual a 0.";
            informacion = "No hay datos que mostar";
        }
    } catch (Exception ex) {
        message = ex.getMessage();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formDevolverPrestamo2</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <div class="titulo">
            <h1>BIBLIOTECA - Cancelar préstamos</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="index.jsp">Inicio</a></h2> 
                    <h2><a href="V2formDevolverPrestamo.jsp">Atras</a></h2> 
                </div>
                <form method="POST" action="formDevolverPrestamo2.jsp">
                    <input name="updating" type="hidden" value="1"/>
                    <%if (!message.isEmpty()) {%>
                    <input class="mensajes" name="message" type="text" style="width:600px; background-color: none" value="<%=message%>"/><br/>
                    <input class="mensajes" name="message" type="text" style="width:980px; background-color: none" value="<%=informacion%>"/><br/>
                    <%} else { %>
                    <br/><br/>
                    <%}%>
                </form>
            </div>
        </div>
    </body>
</html>