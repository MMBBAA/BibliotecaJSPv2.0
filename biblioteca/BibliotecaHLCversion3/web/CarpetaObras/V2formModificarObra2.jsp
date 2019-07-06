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
    String tituloActualizar = "";
    String autorActualizar = "";
    String editorialActualizar = "";
    ValidadorISBN validarISBN = new ValidadorISBN();

    try {
        if (!request.getParameter("ISBN").isEmpty()) {
            if (validarISBN.validarIsbn13(request.getParameter("ISBN")) == false) {
                message = "El ISBN que ha introducido no es válido";
            } else {
                DAOObra dao = new DAOObra();
                Obra obras = dao.selectByISBN(request.getParameter("ISBN"));
                if (obras == null) {
                    message = "no existe ninguna obra con ese ISBN";
                } else {
                    tituloActualizar = dao.selectByISBN(request.getParameter("ISBN")).getTitulo();
                    autorActualizar = dao.selectByISBN(request.getParameter("ISBN")).getAutor();
                    editorialActualizar = dao.selectByISBN(request.getParameter("ISBN")).getEditorial();
                }
            }
        } else {
            message = "El ISBN de actualización no puede ser nulo.";
        }
    } catch (Exception ex) {
        message = ex.getMessage();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formModificarObra2</title>
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
                    <fieldset>
                        <legend >Modifique datos de la obra</legend> 
                        <br/>
                        <label for="ISBN" id="r1">ISBN</label><br>
                        <input name="ISBN" type="text" style="width:200px" value="<jsp:getProperty property="ISBN" name="obra"/>" readonly=""/>
                        <br/>
                        <label for="titulo" id="r1">titulo</label><br>
                        <input name="titulo" type="text" style="width:300px" maxlength="50" required="" placeholder="<%=tituloActualizar%>" value="<%=tituloActualizar%>"/>
                        <br/>
                        <label for="autor" id="r1">autor</label><br>
                        <input name="autor" type="text" style="width:300px" maxlength="30" required="" placeholder="<%=autorActualizar%>" value="<%=autorActualizar%>"/>
                        <br/>
                        <label for="editorial" id="r1">editorial</label><br>
                        <input name="editorial" type="text" style="width:300px" maxlength="30" required="" placeholder="<%=editorialActualizar%>" value="<%=editorialActualizar%>"/>
                        <br/><br/>
                        <input type="submit" class="boton_final" value="Actualizar"/>
                        <%}%>
                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>