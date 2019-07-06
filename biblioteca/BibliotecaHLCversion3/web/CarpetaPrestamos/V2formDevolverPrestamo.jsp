<%@page import="Utilidades.InformeDevoluciones"%>
<%@page import="Utilidades.FechaAFormato"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DAOPrestamo"%>
<%@page import="Entidades.Prestamo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="prestamo" class="Entidades.Prestamo" />
<jsp:setProperty name="prestamo" property="*"/>
<%
    String message = "";//por si hay que mandar un mensaje de error
    List<Prestamo> prestamos = null;
    DAOPrestamo dao = new DAOPrestamo();
    FechaAFormato fecha = new FechaAFormato();
    InformeDevoluciones calculo = new InformeDevoluciones();
    try {
        prestamos = dao.selectPrestamosSinDevolucion();
    } catch (Exception ex) {
        message = ex.toString();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formDevolverPrestamo</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titulo">
            <h1>BIBLIOTECA - Cancelar préstamos</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="index.jsp">Inicio</a></h2> 
                    <h2><a href="V2HojaPrestamos.jsp">Atras</a></h2> 
                </div> 
                <form id="formulario" action="V2formDevolverPrestamo2.jsp" method="POST">
                    <fieldset>
                        <legend >CANCELACIÓN</legend> 
                        <label for="id" id="r1">Inserte id del préstamo</label>
                        <input type="number" name="id" min="0" required=""><br> 
                        <input type="submit" class="boton_final" value="Cancelar"> 
                    </fieldset> 
                </form>  
                <form>
                    <%if (!message.isEmpty()) {%>
                    <input class="mensajes" name="status_initial" type="text" style="width:400px" value="<%=message%>"/>
                    <%} else { %>

                    <br/><br/>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                    <script>
                        $(function () {
                            $('#tabla1 td:last-child:contains(devuelto fuera de plazo)').closest('tr').css('background-color', 'red');
                        });
                    </script>
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
