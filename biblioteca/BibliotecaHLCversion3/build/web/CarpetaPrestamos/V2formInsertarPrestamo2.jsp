<%@page import="DAO.DAOUsuario"%>
<%@page import="DAO.DAOObra"%>
<%@page import="Entidades.Usuario"%>
<%@page import="Entidades.Obra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Prestamo"%>
<%@page import="DAO.DAOPrestamo"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="prestamo" class="Entidades.Prestamo"></jsp:useBean> 
<jsp:setProperty name="prestamo" property="*"/>

<%
    String message = "";
    String DNI = "";
    String ISBN = "";
    DAOObra daoobra = new DAOObra();
    DAOUsuario daousuario = new DAOUsuario();
    DAOPrestamo daoprestamo = new DAOPrestamo();

    try {
        if ((request.getParameter("DNI") != null) || (!request.getParameter("DNI").isEmpty())
                && (request.getParameter("ISBN") != null) || (!request.getParameter("ISBN").isEmpty())) {
            DNI = request.getParameter("DNI");
            ISBN = request.getParameter("ISBN");
            Usuario usuario = daousuario.SelectDniAndAltaSi(DNI);
            Obra obra = daoobra.SelectISBNAndOperativoSi(ISBN);
            if (usuario == null) {//el usuario debe estar de alta, si no es así no puede crearse el préstamo
                message = "No existe ningún usuario de Alta con ese DNI";
            } else {
                if (obra == null) {//la obra debe estar operativa para poder ser prestada.
                    message = "No existe ninguna obra operativa con ese ISBN";
                } else {/*si la obra está operativa compruebo que,para un ISBN concreto, 
                    no existen préstamos sin devolver(es decir,con Fechadevolucion=NULL),
                    porque eso implica que no se ha devuelto*/
                    prestamo = daoprestamo.selectBuscaPrestamoSinDevolverByCondicion(ISBN);
                    if (prestamo != null) {
                        message = "Obra no disponible para préstamo,aún no ha sido devuelta";
                    } else {
                        daoprestamo.createPrestamo(DNI, ISBN);
                        message = "Prestamo creado.";
                    }
                }
            }
        } else {
            message = "Complete los dos campos para realizar un préstamo";
        }
    } catch (Exception ex) {
        message = ex.getMessage();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formInsertarPrestamo2</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <div class="titulo">
            <h1>BIBLIOTECA - Solicitar préstamos</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="index.jsp">Inicio</a></h2> 
                    <h2><a href="V2formInsertarPrestamo.jsp">Atras</a></h2> 
                </div>
                <form method="POST" action="V2formInsertarPrestamo2.jsp">
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