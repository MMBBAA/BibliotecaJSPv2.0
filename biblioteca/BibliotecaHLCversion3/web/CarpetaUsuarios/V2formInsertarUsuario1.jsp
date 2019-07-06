<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formInsertarUsuario1</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titulo">
            <h1>BIBLIOTECA - Dar usuario de alta</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2> 
                    <h2><a href="V2HojaUsuarios.jsp">Atras</a></h2> 
                </div>
                <form id="formulario" action="V2formInsertarUsuario2.jsp" method="POST">
                    <fieldset>
                        <legend >Introduzca datos </legend> 
                        <label for="DNI" id="r1">DNI</label><br>
                        <input type="text" name="DNI" placeholder="8 cifras y letra mayúscula" pattern=[0-9]{8}[A-Z]{1} maxlength="9" required=""><br> 
                        <label for="nombre" id="r1">nombre</label><br>
                        <input type="text" name="nombre" placeholder="introduzca su nombre" pattern=[A-Za-z]{1,15} required=""><br> 
                        <label for="apellidos" id="r1">apellidos</label><br>
                        <input type="text" name="apellidos" placeholder="introduzca sus apellidos" pattern=[A-Za-z]{1,30} required=""><br> 
                        <input type="submit" class="boton_final" value="Alta"> 
                    </fieldset>
                </form>  
            </div>
        </div>
    </body>
</html>