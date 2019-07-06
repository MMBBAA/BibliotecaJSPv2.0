<%@page import="Utilidades.CrearMensajes"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Prestamo"%>
<%@page import="DAO.DAOPrestamo"%>
<%@page import="Utilidades.ValidadorDNI"%>
<%@page import="Utilidades.FechaAFormato"%>
<%@page import="Utilidades.InformeDevoluciones"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="prestamo" class="Entidades.Prestamo" />
<jsp:setProperty name="prestamo" property="*"/>

<%
    String message = "";
    String message2 = "";
    List<Prestamo> prestamos = null;//array donde se guardan los prestamos que encontremos
    Prestamo prestamo1 = null;
    CrearMensajes crearMensaje = new CrearMensajes();
    DAOPrestamo dao = new DAOPrestamo();
    FechaAFormato fecha = new FechaAFormato();
    InformeDevoluciones calculo = new InformeDevoluciones();
    String DNI = "";
    ValidadorDNI validador = new ValidadorDNI();

    try {
        if (!request.getParameter("DNI").isEmpty()) {
            if (validador.validar(request.getParameter("DNI")) == false) {
                message = "El DNI que ha introducido no es válido";
            }else {
            DNI = request.getParameter("DNI");
            prestamo1 = dao.selectPrestamoByCriterio("DNIusuario", DNI);

            if (prestamo1 == null) {
                message = "no existen prestamos con ese DNI";
            } else {

                message2 = crearMensaje.crearMensajeUsuarios(DNI);
                prestamos = dao.selectPrestamoByCondicion("DNIusuario", DNI);
            }//creo el objeto prestamo
         //else {
            if (request.getParameter("DNI").isEmpty()) {
                message = "rellene el campo con un DNI para hacer un filtrado";
            }
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
        <title>V2formListarPrestamoPorISBNobra2</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <div class="titulo">
            <h1>BIBLIOTECA - Listado de préstamos ordenados por ISBN</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="index.jsp">Inicio</a></h2> 
                    <h2><a href="V2formListarPrestamoPorISBNobra.jsp">Atras</a></h2> 
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
                    <input name="status_Prestamo" type="text" style="width:600px" value="<%=message2%>"/>
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