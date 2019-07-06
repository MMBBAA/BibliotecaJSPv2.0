<%@page import="java.util.List"%>
<%@page import="Entidades.Prestamo"%>
<%@page import="DAO.DAOPrestamo"%>
<%@page import="Utilidades.FechaAFormato"%>
<%@page import="Conexion.DBConnection"%>
<%@page import="Utilidades.InformeDevoluciones"%>
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
        prestamos = dao.selectPrestamo();
    } catch (Exception ex) {
        message = ex.toString();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formFiltrarPrestamoDoble</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>   
        <div class="titulo">
            <h1>BIBLIOTECA - Listado de préstamos con doble filtrado</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2>
                    <h2><a href="V2HojaPrestamos.jsp">Atras</a></h2> 
                </div>
                <form id="formulario" action="V2formFiltrarPrestamoDoble2.jsp" method="POST">
                    <fieldset>
                        <legend>FILTRADO DOBLE</legend> 
                        <label for="DNI" id="r1">DNI</label><br>
                        <input type="text" name="DNI" placeholder="8 cifras y letra mayúscula" pattern=[0-9]{8}[A-Z]{1} maxlength="9" required=""><br>  
                        <label for="ISBN" id="r1">ISBN</label><br>
                        <input type="text" name="ISBN" pattern=[0-9]{13} placeholder="formato:13 dígitos" maxlength="13" required=""><br> 
                        <input type="submit" class="boton_final" value="Filtrar"> 
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
                            $('.bordered td:last-child:contains(devuelto fuera de plazo)').closest('tr').css('background-color', 'red');
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
                        <%for (int i = 0; i < prestamos.size(); i++) {%>
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