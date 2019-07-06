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
    DAOObra dao = new DAOObra();
    String ISBNActualizado = "";
    ValidadorISBN validarISBN=new ValidadorISBN();

    if (request.getParameter("ISBN").isEmpty()) {
        message = "El campo del ISBN no debe estar vacio.";
    } else {
        if(validarISBN.validarIsbn13(request.getParameter("ISBN"))==false){
        message= "El ISBN que ha introducido no es válido";
        }else {
        try {
            ISBNActualizado = request.getParameter("ISBN");
            obra = dao.updateObraEnBaja(ISBNActualizado);
            message = "obra con ISBN " + request.getParameter("ISBN") + " dada de alta";

        } catch (Exception ex) {
            message = "no se encuentra ninguna obra de baja con ese ISBN";
        }
    }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formRecuperarObra2</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <div class="titulo">
            <h1>BIBLIOTECA - Recuperar obra de baja</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2>
                    <h2><a href="V2formRecuperarObra.jsp">Atras</a></h2> 
                </div>
                <form method="POST" action="V2formRecuperarObra2.jsp">
                    <input name="updating" type="hidden" value="1"/>
                    <%if (!message.isEmpty()) {%>
                    <input class="mensajes" name="message" type="text" style="width:400px" value="<%=message%>"/>
                    <%}%>
                </form>
            </div>
        </div>
    </body>
</html>