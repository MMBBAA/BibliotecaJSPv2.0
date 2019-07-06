<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Obra"%>
<%@page import="DAO.DAOObra"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obra" class="Entidades.Obra"></jsp:useBean> 
<jsp:setProperty name="obra" property="*"/>

<%
    String message = "";
    DAOObra dao = new DAOObra();
    String ISBNActualizado = "";
    String tituloActualizado = "";
    String autorActualizado = "";
    String editorialActualizado = "";
    if (((request.getParameter("ISBN") == null) || (request.getParameter("ISBN").isEmpty()))
            || ((request.getParameter("titulo") == null) || (request.getParameter("titulo").isEmpty()))
            || ((request.getParameter("autor") == null) || (request.getParameter("autor").isEmpty()))
            || ((request.getParameter("editorial") == null) || (request.getParameter("editorial").isEmpty()))) {
        message = "Ningún campo del formulario debe estar vacio.";
    } else {
        ISBNActualizado = request.getParameter("ISBN");
        tituloActualizado = request.getParameter("titulo");
        autorActualizado = request.getParameter("autor");
        editorialActualizado = request.getParameter("editorial");

        obra = dao.update(ISBNActualizado, tituloActualizado, autorActualizado, editorialActualizado);
        message = "obra con ISBN " + request.getParameter("ISBN") + " actualizada";
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formModificarObra3</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <div class="titulo">
            <h1>BIBLIOTECA - Modificar datos de obra</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2>
                    <h2><a href="V2formModificarObra.jsp">Atras</a></h2> 
                </div>
                <form method="POST" action="V2formModificarObra3.jsp">
                    <input name="updating" type="hidden" value="1"/>

                    <%if (!message.isEmpty()) {%>
                    <input class="mensajes" name="message" type="text" style="width:400px" value="<%=message%>"/>
                    <%} else {%>
                    <%}%>
                </form>
            </div>
        </div>
    </body>
</html>