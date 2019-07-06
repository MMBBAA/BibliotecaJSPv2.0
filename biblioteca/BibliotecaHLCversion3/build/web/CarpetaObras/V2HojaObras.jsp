<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2HojaObras</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titulo">
            <h1>BIBLIOTECA - Sección obras</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Ir a menu inicial</a></h2> 
                    <h2><a href="V2formInsertarObra.jsp">Dar obra de alta</a></h2>
                    <h2><a href="V2formRecuperarObra.jsp">Recuperar obra</a></h2>
                    <h2><a href="V2formDarBajaObra.jsp">Dar obra de baja</a></h2>
                    <h2><a href="V2formModificarObra.jsp">Modificar obra</a></h2>  
                    <select id="desplegable" style="background-color: transparent; border:none;" name="forma" onchange="location = this.value;">
                        <option class="showoption" value="">Seleccione listado</option>
                        <option class="showoption" value="V2formListarObrasOperativasTitulo.jsp">Obras operativas por Titulo</option>
                        <option class="showoption" value="V2formListarObrasOperativasAutor.jsp">Obras operativas por Autor</option>
                        <option class="showoption" value="V2formListarObrasNoOperativasTitulo.jsp">Obras no operativas por Titulo</option>
                        <option class="showoption" value="V2formListarObrasNoOperativasAutor.jsp">Obras no operativas por Autor</option>
                    </select>
                </div>
            </div>
        </div>
    </body>
</html>