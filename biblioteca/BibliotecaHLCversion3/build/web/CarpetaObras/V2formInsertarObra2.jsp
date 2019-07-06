<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DAOObra"%>
<%@page import="Entidades.Obra"%>
<%@page import="Utilidades.ValidadorISBN"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obra" class="Entidades.Obra" />
<jsp:setProperty name="obra" property="*"/>
<%
    String message = "";
    String ISBNaBuscar = "";
    String titulo = "";
    String autor = "";
    String editorial = "";
    DAOObra dao = new DAOObra();
    ValidadorISBN validarISBN=new ValidadorISBN();

    if (((request.getParameter("ISBN") == null) || (request.getParameter("ISBN").isEmpty()))
            || ((request.getParameter("titulo") == null) || (request.getParameter("titulo").isEmpty()))
            || ((request.getParameter("autor") == null) || (request.getParameter("autor").isEmpty()))
            || ((request.getParameter("editorial") == null) || (request.getParameter("editorial").isEmpty()))) {
        message = "Ningún campo del formulario debe estar vacio.";
    } else {
        if(validarISBN.validarIsbn13(request.getParameter("ISBN"))==false){
        message= "El ISBN que ha introducido no es válido";
        }else {
        ISBNaBuscar = request.getParameter("ISBN");
        try {
            obra = dao.SelectISBNAndOperativoSi(ISBNaBuscar);
            if (obra != null) {
                message = "la obra con ese ISBN ya existe, es " + obra.getTitulo() + " de " + obra.getAutor();
            } else {
                /*como no está de alta se busca en las de baja,si las encuentra de baja podrán 
                pasar dos cosas, que se decida no recuperarla de la baja, o bien se decida recuperarla*/
                obra = dao.SelectISBNAndOperativoNo(ISBNaBuscar);
                if (obra != null) {
                    message = "la obra con ese ISBN estaba de baja y se le acaba de dar de alta, era "
                            + obra.getTitulo() + " de " + obra.getAutor();
                    obra = dao.updateObraEnBaja(ISBNaBuscar);

                } else {
                    /*si la obra no ha sido encontada ni operativa ni no operativa, es que 
                    no existe, así que podemos crearla*/
                    titulo = request.getParameter("titulo");
                    autor = request.getParameter("autor");
                    editorial = request.getParameter("editorial");
                    //operativo = "si";//toda obra nueva estará de alta.
                    dao.createObraPorParametros(ISBNaBuscar, titulo, autor, editorial);
                    message = "la obra se ha creado";
                }
            }
        } catch (Exception ex) {
            message = ex.getMessage();
        }
    }
    }//llave de cierre
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formInsertarObra2</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titulo">
            <h1>BIBLIOTECA - Dar obra de Alta</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Inicio</a></h2> 
                    <h2><a href="V2formInsertarObra.jsp">Atras</a></h2> 
                </div>
                <form>
                    <%if (!message.isEmpty()) {%>
                    <input class="mensajes" name="status_initial" type="text" style="width:550px" value="<%=message%>"/>
                    <br>
                    <%}%>

                </form>
            </div>
        </div>
    </body>
</html>