
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2formInsertarObra1</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titulo">
            <h1>BIBLIOTECA - Dar obra de Alta</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Menu inicial</a></h2>
                    <h2><a href="V2HojaObras.jsp">Atras</a></h2> 
                </div>
                <form id="formulario" action="V2formInsertarObra2.jsp" method="POST">
                    <fieldset>
                        <legend>Alta de obra </legend> 
                        <label for="ISBN" id="r1">ISBN</label><br>
                        <input type="text" name="ISBN" pattern=[0-9]{13} placeholder="formato:13 dígitos" maxlength="13" required=""><br> 
                        <label for="titulo" id="r1">TITULO</label><br>
                        <input type="text" name="titulo" placeholder="introduzca título obra" maxlength="50" required=""><br>
                        <label for="autor" id="r1">AUTOR</label><br>
                        <input type="text" name="autor" placeholder="introduzca nombre autor" maxlength="30" required=""><br>
                        <label for="editorial" id="r1">EDITORIAL</label><br>
                        <input type="text" name="editorial" placeholder="introduzca nombre editorial" maxlength="30" required=""><br>
                        <input type="submit" class="boton_final" value="Alta"> 
                    </fieldset>
                </form>  
            </div>
        </div>
    </body>
</html>