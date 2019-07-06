<%-- 
    index Biblioteca HLC v2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
                <div class="titulo">
            <h1>BIBLIOTECA - Menu inicial</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="CarpetaObras/V2HojaObras.jsp">sección Obras</a></h2> 
                    <h2><a href="CarpetaUsuarios/V2HojaUsuarios.jsp">sección usuarios</a></h2>
                    <h2><a href="CarpetaPrestamos/V2HojaPrestamos.jsp">sección prestamos</a></h2>
                    <select id="desplegable" style="background-color: transparent; border:none;" name="forma" onchange="location = this.value;">
                        <option class="showoption" value="">Instrucciones</option>
                        <option class="showoption" value="CarpetaInstrucciones/V2Instrucciones.jsp">página Menu</option>
                        <option class="showoption" value="CarpetaInstrucciones/V2Instrucciones2.jsp">página obras</option>
                        <option class="showoption" value="CarpetaInstrucciones/V2Instrucciones3.jsp">página usuarios</option>
                        <option class="showoption" value="CarpetaInstrucciones/V2Instrucciones4.jsp">página préstamos</option>
                    </select>
                </div>
            </div>
        </div>
    </body>
</html>