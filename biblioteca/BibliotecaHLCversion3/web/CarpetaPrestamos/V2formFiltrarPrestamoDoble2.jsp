<%@page import="Utilidades.CrearMensajes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Prestamo"%>
<%@page import="DAO.DAOPrestamo"%>
<%@page import="Utilidades.FechaAFormato"%>
<%@page import="Utilidades.InformeDevoluciones"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="prestamo" class="Entidades.Prestamo" />
<jsp:setProperty name="prestamo" property="*"/>
<%
    String message = "";
    String message2 = "";
    String message3 = "";
    List<Prestamo> prestamos = null;//array donde se guardan los prestamos que encontremos
    Prestamo prestamo1 = null;
    Prestamo prestamo2 = null;
    Prestamo prestamo3 = null;//para comprobacion
    DAOPrestamo dao = new DAOPrestamo();
    CrearMensajes crearMensaje = new CrearMensajes();
    FechaAFormato fecha = new FechaAFormato();
    InformeDevoluciones calculo = new InformeDevoluciones();
    String DNI = "";
    String ISBN = "";
    try {
        if ((!request.getParameter("DNI").isEmpty()) && (!request.getParameter("ISBN").isEmpty())) {
            DNI = request.getParameter("DNI");
            ISBN = request.getParameter("ISBN");
            prestamo1 = dao.selectPrestamoByCriterio("DNIusuario", DNI);
            prestamo2 = dao.selectPrestamoByCriterio("ISBNobra", ISBN);
            if (prestamo1 == null) {
                message = "no existen prestamos con ese DNI";
            } else {
                if (prestamo2 == null) {
                    message = "no existen prestamos con ese ISBN";
                } else {
                    prestamo3 = dao.selectBuscaPrestamoByCondiciones(DNI, ISBN);
                    if (prestamo3 == null) {
                        message = "no existen prestamos con esos DNI e ISBN activos";
                    } else {
                        message2 = crearMensaje.crearMensajeUsuarios(DNI);
                        message3 = crearMensaje.crearMensajeObras(ISBN);
                        prestamos = dao.selectPrestamoByCondiciones(DNI, ISBN);
                    }
                }
            }
        } else { //si ninguno de los dos campos está completo se manda un mensaje informando
            if ((request.getParameter("DNI").isEmpty()) || (request.getParameter("ISBN").isEmpty())) {
                message = "rellene los dos campos para hacer un filtrado";
            }
        }
    } catch (Exception ex) {
        message = ex.toString();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formFiltrarPrestamoDoble2</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <div class="titulo">
            <h1>BIBLIOTECA - Listado de préstamos con doble filtrado</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="index.jsp">Inicio</a></h2> 
                    <h2><a href="V2formFiltrarPrestamoDoble.jsp">Atras</a></h2> 
                </div>
                <form>
                    <%if (!message.isEmpty()) {%>
                    <input class="mensajes" name="status_initial" type="text" style="width:400px" value="<%=message%>"/>
                    <%} else {%>

                    <br/><br/>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                    <script>
                        $(function () {
                            $('.bordered td:last-child:contains(devuelto fuera de plazo)').closest('tr').css('background-color', 'red');
                        });
                    </script>
                    <input class="mensajes" name="status_Prestamo" type="text" style="width:700px" value="<%=message2%>"/>
                    <br/>
                    <input class="mensajes" name="status_Prestamo" type="text" style="width:700px" value="<%=message3%>"/>
                    <!--<table border="1">-->
                    <table class="bordered">
                        <tr>
                            <th>id</th>
                            <th>DNI Usuario</th>
                            <th>ISBN Obra</th>
                            <th>Fecha Solicitud</th>
                            <th>Fecha Devolucion</th>
                            <th>Situación del préstamo</th>
                        </tr>
                        <%
                            for (int i = 0; i < prestamos.size(); i++) {%>
                        <tr>
                            <td><%=prestamos.get(i).getId()%></td>
                            <td><%=prestamos.get(i).getDNIusuario()%></td>
                            <td><%=prestamos.get(i).getISBNobra()%></td>
                            <td><%=fecha.FechaATexto(prestamos.get(i).getFechasolicitud())%></td>
                            <td><%=fecha.FechaATexto(prestamos.get(i).getFechadevolucion())%></td>
                            <td><%=calculo.TiempoRetraso(prestamos.get(i).getFechadevolucion(), prestamos.get(i).getFechasolicitud())%></td>
                        </tr>                            
                        <%}%>
                    </table>
                    <%}%>
                </form>
            </div>
        </div>
    </body>
</html>