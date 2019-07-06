<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2HojaUsuarios</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titulo">
            <h1>BIBLIOTECA - Sección prestamos</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Ir a menu inicial</a></h2> 
                    <h2><a href="V2formInsertarPrestamo.jsp">Solicitar préstamos</a></h2>
                    <h2><a href="V2formDevolverPrestamo.jsp">Cancelar préstamos</a></h2>
                    <select id="desplegable" style="background-color: transparent; border:none;" name="forma" onchange="location = this.value;">
                        <option class="showoption" value="">Seleccione listado</option>
                        <option class="showoption" value="V2formListarPrestamo.jsp">Préstamos</option>
                        <option class="showoption" value="V2formFiltrarPrestamoDoble.jsp">Préstamos con doble filtrado</option>
                        <option class="showoption" value="V2formListarPrestamoPorDNIusuario.jsp">Préstamos ordenados por DNI</option>
                        <option class="showoption" value="V2formListarPrestamoPorISBNobra.jsp">Préstamos ordenados por ISBN</option>
                        <option class="showoption" value="V2formListarPrestamoPorFechasolicitud.jsp">Préstamos ordenados por Fecha de solicitud</option>
                        <option class="showoption" value="V2formListarPrestamoPorFechadevolucion.jsp">Préstamos ordenados por Fecha de devolución</option>
                    </select>
                </div>
            </div>
        </div>
    </body>
</html>