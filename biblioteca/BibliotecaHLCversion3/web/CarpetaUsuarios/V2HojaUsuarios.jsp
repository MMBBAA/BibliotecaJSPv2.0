<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2HojaUsuarios</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titulo">
            <h1>BIBLIOTECA - Sección usuarios</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Ir a menu inicial</a></h2> 
                    <h2><a href="V2formInsertarUsuario1.jsp">Dar usuarios de alta</a></h2>
                    <h2><a href="V2formRecuperarUsuario1.jsp">Recuperar usuarios de baja</a></h2>
                    <h2><a href="V2formDarBajaUsuario1.jsp">Dar usuarios de baja</a></h2>
                    <h2><a href="V2formModificarUsuario1.jsp">Modificación de usuarios</a></h2>
                    <select id="desplegable" name="forma" onchange="location = this.value;">
                        <option class="showoption" value="">Seleccione listado</option>
                        <option class="showoption" value="V2formListarUsuariosAltaNombre.jsp">Usuarios en alta ordenados por nombre</option>
                        <option class="showoption" value="V2formListarUsuariosAltaApellidos.jsp">Usuarios en alta ordenados por apellidos</option>
                        <option class="showoption" value="V2formListarUsuariosBajaNombre.jsp">Usuarios en baja ordenados por nombre</option>
                        <option class="showoption" value="V2formListarUsuariosBajaApellidos.jsp">Usuarios en baja ordenados por apellidos</option>
                    </select>
                </div>
            </div>
        </div>
    </body>
</html>