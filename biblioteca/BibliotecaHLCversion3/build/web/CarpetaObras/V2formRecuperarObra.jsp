<%@page import="java.util.List"%>
<%@page import="Entidades.Obra"%>
<%@page import="DAO.DAOObra"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obra" class="Entidades.Obra" />
<jsp:setProperty name="obra" property="*"/>
<%
    String message = "";
    List<Obra> obras = null;
    DAOObra dao = new DAOObra();
    try {
        obras = dao.selectObra("no", "autor");
    } catch (Exception ex) {
        message = ex.toString();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formRecuperarObra</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>   
        <div class="titulo">
            <h1>BIBLIOTECA - Recuperar obra de baja</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2>
                    <h2><a href="V2HojaObras.jsp">Atras</a></h2> 
                </div>
                <form id="formulario" action="V2formRecuperarObra2.jsp" method="POST">
                    <fieldset>
                        <legend>INTRODUZCA ISBN </legend> 
                        <input type="text" name="ISBN" pattern=[0-9]{13} placeholder="formato:13 dígitos" maxlength="13" required=""><br> 
                        <input type="submit" class="boton_final" value="Recuperar">
                    </fieldset>
                </form>  
                <form>
                    <%if (!message.isEmpty()) {%>
                    <input class="mensajes" name="status_initial" type="text" style="width:400px" value="<%=message%>"/>
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
                    <%}%>
                </form>
            </div>
        </div>
    </body>
</html>