<%@page import="java.util.List"%>
<%@page import="Entidades.Obra"%>
<%@page import="DAO.DAOObra"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obra" class="Entidades.Obra" />
<jsp:setProperty name="obra" property="*"/>
<%
    String message = "";
    List<Obra> usuarios = null;
    DAOObra dao = new DAOObra();

    try {
        //usuarios = dao.selectUsuario("si","nombre");
        usuarios = dao.selectAllObras();
    } catch (Exception ex) {
        message = ex.toString();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formModificarObra</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>   
        <div class="titulo">
            <h1>BIBLIOTECA - Modificar datos de obra</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2>
                    <h2><a href="V2HojaObras.jsp">Atras</a></h2> 
                </div>
                <form id="formulario" action="V2formModificarObra2.jsp" method="POST">
                    <fieldset>
                        <legend>INTRODUZCA ISBN </legend> 
                        <input type="text" name="ISBN" pattern=[0-9]{13} placeholder="formato:13 dígitos" maxlength="13" required=""><br> 
                        <input type="submit" class="boton_final" value="Modificar"> 
                    </fieldset>
                </form>  
                <form>
                    <%if (!message.isEmpty()) {%>
                    <input name="status_initial" type="text" style="width:400px" value="<%=message%>"/>
                    <%} else { %>
                    <br/><br/>
                    <table class="bordered">
                        <tr>
                            <th>ISBN</th>
                            <th>titulo</th>
                            <th>autor</th>
                            <th>editorial</th>
                            <th>operativo</th>
                        </tr>
                        <%for (int i = 0; i < usuarios.size(); i++) {%>
                        <tr>
                            <td><%=usuarios.get(i).getISBN()%></td>
                            <td><%=usuarios.get(i).getTitulo()%></td>
                            <td><%=usuarios.get(i).getAutor()%></td>
                            <td><%=usuarios.get(i).getEditorial()%></td>
                            <td><%=usuarios.get(i).getOperativo()%></td>
                        </tr>                            
                        <%}%>
                    </table>
                    <%}%>
                </form>
            </div>
        </div>
    </body>
</html>
