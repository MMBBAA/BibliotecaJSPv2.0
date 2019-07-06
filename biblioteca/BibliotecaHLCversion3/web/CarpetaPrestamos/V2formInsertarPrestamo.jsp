<%@page import="DAO.DAOUsuario"%>
<%@page import="Entidades.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DAOObra"%>
<%@page import="Entidades.Obra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String message = "";
    List<Obra> obras = null;
    DAOObra daoobra = new DAOObra();
    List<Usuario> usuarios = null;
    DAOUsuario daousuario = new DAOUsuario();

    try {
        //obras = daoobra.selectObra("si", "autor");
        obras=daoobra.selectObrasAlquilables();
        usuarios = daousuario.selectUsuario("si", "apellidos");
    } catch (Exception ex) {
        message = ex.toString();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formInsertarPrestamo</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titulo">
            <h1>BIBLIOTECA - Solicitar préstamos</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="index.jsp">Inicio</a></h2> 
                    <h2><a href="V2HojaPrestamos.jsp">Atras</a></h2> 
                </div> 
                <form id="formulario" action="V2formInsertarPrestamo2.jsp" method="POST">
                    <fieldset>
                        <legend>SOLICITUD</legend> 
                        <label for="DNI" id="r1">DNI</label><br>
                        <input type="text" name="DNI" placeholder="8 cifras y letra mayúscula" pattern=[0-9]{8}[A-Z]{1} maxlength="9" required=""><br>  
                        <label for="ISBN" id="r1">ISBN</label><br>
                        <input type="text" name="ISBN" pattern=[0-9]{13} placeholder="formato:13 dígitos" maxlength="13" required=""><br>
                        <input type="submit" class="boton_final" value="Solicitar"> 
                    </fieldset>
                </form>
                <br/><br/>
                <div style="float:left; margin-right: 4px">
                    <table class="bordered">
                        <tr>
                            <th>DNI</th>
                            <th>nombre</th>
                            <th>apellidos</th>
                            <th>de Alta</th>
                        </tr>
                        <%for (int i = 0; i < usuarios.size(); i++) {%>
                        <td><%=usuarios.get(i).getDNI()%></td>
                        <td><%=usuarios.get(i).getNombre()%></td>
                        <td><%=usuarios.get(i).getApellidos()%></td>
                        <td><%=usuarios.get(i).getDeAlta()%></td>
                        </tr>
                        <%}%>
                    </table>
                </div>  

                <div style="float:left;">
                    <table class="bordered">
                        <tr>
                            <th>ISBN</th>
                            <th>titulo</th>
                            <th>autor</th>
                            <th>editorial</th>
                            <th>operativo</th>
                        </tr>
                        <%for (int i = 0; i < obras.size(); i++) {%>
                        <tr>
                            <td><%=obras.get(i).getISBN()%></td>
                            <td><%=obras.get(i).getTitulo()%></td>
                            <td><%=obras.get(i).getAutor()%></td>
                            <td><%=obras.get(i).getEditorial()%></td>
                            <td><%=obras.get(i).getOperativo()%></td>
                        </tr>
                        <%}%>
                    </table>
                </div> 
            </div>
        </div>
    </body>
</html>