<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2Instrucciones4</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titulo">
            <h1>BIBLIOTECA - Instrucciones</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Ir a menu inicial</a></h2> 
                    <h2><a href="V2Instrucciones3.jsp"><img style alt="Atras" src="../imagenes/atras.png"/></a></h2> 
                </div>
            </div>
        </div>

        <h2>Opciones de la secci�n pr�stamos:</h2>
        <br>

        <h3 style="text-align: left; margin-left: 50px;"><u>Solicitar pr�stamos</u>:</h3>

        <p style="text-align: left; margin-left: 50px;">Se accede a un formulario y a dos listados: 
            el primero es el de los usuarios de alta en el sistema, y el segundo el de las obras 
            que est�n de alta en el sistema.</p>

        <p style="text-align: left; margin-left: 50px;">Solo los usuarios que est�n de alta en el 
            sistema podr�n realizar un pr�stamo, y solo las obras que est�n operativas y que no 
            est�n pendientes de estar <br>devueltas pueden ser parte de una solicitud de pr�stamo.</p>

        <p style="text-align: left; margin-left: 50px;">Si introduce un DNI de un usuario que no 
            est� de alta, o bien se trate de un usuario que no exista, el sistema le informar� 
            con el mensaje "<i>No existe <br>ning�n usuario de Alta con ese DNI</i>".</p>

        <p style="text-align: left; margin-left: 50px;">Si introduce un ISBN de una obra que no 
            est� operativa o que no exista, el sistema le informar� con el mensaje 
            "<i>No existe ninguna obra operativa<br> con ese ISBN</i>".</p>

        <p style="text-align: left; margin-left: 50px;">Si introduce un ISBN de una obra que 
            est� pendiente de devolver, el sistema le informar� con el mensaje "<i>Obra no disponible 
                para pr�stamo,a�n<br> no ha sido devuelta</i>".</p>

        <p style="text-align: left; margin-left: 50px;">Cuando se cree el pr�stamo, 
            el sistema le informar� con el mensaje "<i>Pr�stamo creado</i>".</p>

    <center><img style="margin:10px;" alt="" src="../imagenes/imagen 15 solicitar prestamos.PNG"/></center>
    <center>Formulario de solicitud de pr�stamos</center>

    <h3 style="text-align: left; margin-left: 50px;"><u>Cancelar pr�stamos</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">Se accede a un formulario y a un listado, 
        el primero es un formulario donde se introducir� el identificador del pr�stamo 
        que quiere devolverse, y el segundo es un listado<br> de los pr�stamos que quedan 
        pendientes de devoluci�n.</p>

    <p style="text-align: left; margin-left: 50px;">Un pr�stamo puede devolverse 
        independientemente del estado operativo de la obra.</p>

    <p style="text-align: left; margin-left: 50px;">
        Cuando se devuelve el pr�stamo el sistema le informar� con el mensaje  
        y le dir� la fecha en que ha sido devuelto, as� mismo informar� de los
        datos del usuario y de la obra.</p>

    <p style="text-align: left; margin-left: 50px;">
        Si se introduce un identificador de pr�stamo que ya hubiera sido devuelto,el sistema 
        informar� con el mensaje: "<i>El pr�stamo con ese identificador ya estaba devuelto, 
            no<br> hay datos que mostrar</i>".</p>

    <p style="text-align: left; margin-left: 50px;">
        Si se introduce un identificador de pr�stamo que no exista, el sistema informar� con 
        el mensaje: "<i>No existe ning�n pr�stamo con ese identificador,no hay datos que mostrar</i>".</p>

    <center><img style="margin:10px;" alt="" src="../imagenes/imagen 16 cancelar prestamos.PNG"/></center>
    <center>Formulario de cancelaci�n de pr�stamos</center>

    <h3 style="text-align: left; margin-left: 50px;"><u>Listados</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">Tendr� acceso a  6 tipos de listado 
        de  pr�stamos, y todos los pr�stamos que hubieran sido devueltos fuera de 
        plazo se marcar�n en color rojo.</p>

    <center><img style="margin:10px;" alt="" src="../imagenes/imagen 17 listado prestamos.PNG"/></center>
    <center>Listados de pr�stamos desplegados</center>

    <p style="text-align: left; margin-left: 50px;">Las 6 opciones de listado son:</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>1)Pr�stamos</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        Son todos los pr�stamos que se han realizado con la aplicaci�n, y es un 
        listado de solo consulta.</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>2)Pr�stamos con doble filtrado</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        Este listado permite filtrar la lista general de pr�stamos usando 2 criterios: 
        DNI de usuario e ISBN de obra.</p>

    <p style="text-align: left; margin-left: 50px;">
        Para realizar el filtrado hay que completar los dos campos.</p>

    <p style="text-align: left; margin-left: 50px;">
        Cuando introduzca los campos acceder� a una nueva tabla donde ver� el pr�stamo 
        o pr�stamos identificados, y se le mostrar�n dos mensajes a�adidos.<br> El primer 
        mensaje le informar� del nombre del usuario y si est� o no de alta, y el segundo 
        mensaje le informar� del nombre, autor y estado operativo de la obra.</p>

    <p style="text-align: left; margin-left: 50px;">
        Si en alg�n caso los datos del DNI o del ISBN no corresponden a ning�n pr�stamo 
        existente en el listado, el sistema le informar� con el mensaje "<i>no existen<br> prestamos 
            con esos DNI e ISBN activos</i>".</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>3)Pr�stamos ordenados por DNI</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        Este listado permite filtrar la lista general de pr�stamos,ordenada por el DNI del 
        usuario, filtrando por un criterio: ISBN de obra.</p>

    <p style="text-align: left; margin-left: 50px;">
        Si se introduce un ISBN que no est� en el listado,el sistema le informar� con un mensaje.</p>

    <p style="text-align: left; margin-left: 50px;">
        Cuando se introduce un ISBN en concreto, el sistema mostrar� los pr�stamos que contengan 
        una obra con ese ISBN, e informar� de los datos de la misma.</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>4)Pr�stamos ordenados por ISBN</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        En este listado los pr�stamos se encuentran ordenados por el ISBN de la obra. 
        Este listado permite un filtrado simple usando el DNI del usuario. 
        Si se introduce un DNI<br> que no est� en el listado,el sistema le informar� con un mensaje.</p>

    <p style="text-align: left; margin-left: 50px;">
        Cuando se introduce un DNI en concreto, el sistema mostrar� los pr�stamos 
        que contengan un usuario con ese DNI, e informar� de los datos del mismo.</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>5)Pr�stamos ordenados por fecha de solicitud</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        Este listado muestra la lista general de pr�stamos ordenada por la fecha 
        de dsolicitud y es solo de consulta..</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>6)Pr�stamos ordenados por fecha de devoluci�n</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        Este listado muestra la lista general de pr�stamos ordenada por la fecha 
        de devoluci�n y es solo de consulta..</p>

</body>
</html>
