<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DAOUsuario"%>
<%@page import="Entidades.Usuario"%>
<%@page import="Utilidades.ValidadorDNI"%>
<%@page import="Conexion.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuario" class="Entidades.Usuario" />
<jsp:setProperty name="usuario" property="*"/>
<%
    String message = "";
    String DNIaBuscar = "";
    String nombre = "";
    String apellidos = "";
    String deAlta = "";
    DAOUsuario dao = new DAOUsuario();
    ValidadorDNI validador=new ValidadorDNI();

    if (((request.getParameter("DNI") == null) || (request.getParameter("DNI").isEmpty()))
            || ((request.getParameter("nombre") == null) || (request.getParameter("nombre").isEmpty()))
            || ((request.getParameter("apellidos") == null) || (request.getParameter("apellidos").isEmpty()))) {
        message = "Ningún campo del formulario debe estar vacio.";
    } else {
        if(validador.validar(request.getParameter("DNI"))==false){
        message= "El DNI que ha introducido no es válido";
        }
        else{
        DNIaBuscar = request.getParameter("DNI");
        try {
            usuario = dao.SelectDniAndAltaSi(DNIaBuscar);
            if (usuario != null) {
                message = "el usuario con ese DNI ya existe, es " + usuario.getNombre() + " " + usuario.getApellidos();
            } else {
                /*como no está de alta se busca en los de baja,si los encuentra de baja podrán 
                pasar dos cosas, que se decida no recuperarlo de la baja, o bien se decida recuperarlo*/
                usuario = dao.SelectDniAndAltaNo(DNIaBuscar);//funciona
                if (usuario != null) {
                    message = "el usuario con ese DNI estaba de baja y se le acaba de dar de alta, era "
                            + usuario.getNombre() + " " + usuario.getApellidos();
                    usuario = dao.updateUsuarioEnBaja(DNIaBuscar);

                } else {
                    /*si el usuario no ha sido encontado ni de alta ni de baja, es que 
                    no existe, así que podemos crearlo*/
                    nombre = request.getParameter("nombre");
                    apellidos = request.getParameter("apellidos");
                    deAlta = "si";//todo usuario nuevo estará de alta.
                    dao.createUsuarioPorParametros(DNIaBuscar, nombre, apellidos, deAlta);//funciona
                    message = "el usuario se ha creado";
                }
            }
        } catch (Exception ex) {
            message = ex.getMessage();
        }
    }
    }//hasta aqui
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formInsertarUsuario2</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titulo">
            <h1>BIBLIOTECA - Dar usuario de alta</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Inicio</a></h2> 
                    <h2><a href="V2HojaUsuarios.jsp">Atras</a></h2> 
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