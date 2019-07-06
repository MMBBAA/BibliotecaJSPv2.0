<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Obra"%>
<%@page import="Utilidades.ValidadorISBN"%>
<%@page import="DAO.DAOObra"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obra" class="Entidades.Obra"></jsp:useBean> 
<jsp:setProperty name="obra" property="*"/>

<%
    String message = "";
    String ISBNDarDeBaja = "";
    ValidadorISBN validarISBN=new ValidadorISBN();
    try {
        if (request.getParameter("ISBN").isEmpty()) {
            message = "El campo ISBN no puede estar vacio.";
        }else {
        if(validarISBN.validarIsbn13(request.getParameter("ISBN"))==false){
        message= "El ISBN que ha introducido no es válido";
        } else {
            ISBNDarDeBaja = request.getParameter("ISBN");
            DAOObra dao = new DAOObra();
            Obra obrasBusqueda = dao.SelectISBNAndOperativoSi(ISBNDarDeBaja);
            if (obrasBusqueda == null) {
                message = "No existen obras de alta con ese ISBN";
            } else {
                dao.updateObraEnAlta(ISBNDarDeBaja);
                message = "Obra dada de baja correctamente.";
            }
        }
        }
    } catch (Exception ex) {
        message = ex.getMessage();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>formDarBajaUsuario2</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <div class="titulo">
            <h1>BIBLIOTECA - Dar obra de baja</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2>
                    <h2><a href="V2formDarBajaObra.jsp">Atras</a></h2> 
                </div>
                <form method="POST" action="V2formDarBajaObra2.jsp">
                    <input name="updating" type="hidden" value="1"/>

                    <%if (!message.isEmpty()) {%>
                    <input class="mensajes" name="message" type="text" style="width:400px" value="<%=message%>"/>
                    <%} else { %>
                    <%}%>
                </form>
            </div>
        </div>
    </body>
</html>