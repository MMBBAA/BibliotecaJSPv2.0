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

        <h2>Opciones de la sección préstamos:</h2>
        <br>

        <h3 style="text-align: left; margin-left: 50px;"><u>Solicitar préstamos</u>:</h3>

        <p style="text-align: left; margin-left: 50px;">Se accede a un formulario y a dos listados: 
            el primero es el de los usuarios de alta en el sistema, y el segundo el de las obras 
            que están de alta en el sistema.</p>

        <p style="text-align: left; margin-left: 50px;">Solo los usuarios que estén de alta en el 
            sistema podrán realizar un préstamo, y solo las obras que estén operativas y que no 
            estén pendientes de estar <br>devueltas pueden ser parte de una solicitud de préstamo.</p>

        <p style="text-align: left; margin-left: 50px;">Si introduce un DNI de un usuario que no 
            esté de alta, o bien se trate de un usuario que no exista, el sistema le informará 
            con el mensaje "<i>No existe <br>ningún usuario de Alta con ese DNI</i>".</p>

        <p style="text-align: left; margin-left: 50px;">Si introduce un ISBN de una obra que no 
            esté operativa o que no exista, el sistema le informará con el mensaje 
            "<i>No existe ninguna obra operativa<br> con ese ISBN</i>".</p>

        <p style="text-align: left; margin-left: 50px;">Si introduce un ISBN de una obra que 
            está pendiente de devolver, el sistema le informará con el mensaje "<i>Obra no disponible 
                para préstamo,aún<br> no ha sido devuelta</i>".</p>

        <p style="text-align: left; margin-left: 50px;">Cuando se cree el préstamo, 
            el sistema le informará con el mensaje "<i>Préstamo creado</i>".</p>

    <center><img style="margin:10px;" alt="" src="../imagenes/imagen 15 solicitar prestamos.PNG"/></center>
    <center>Formulario de solicitud de préstamos</center>

    <h3 style="text-align: left; margin-left: 50px;"><u>Cancelar préstamos</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">Se accede a un formulario y a un listado, 
        el primero es un formulario donde se introducirá el identificador del préstamo 
        que quiere devolverse, y el segundo es un listado<br> de los préstamos que quedan 
        pendientes de devolución.</p>

    <p style="text-align: left; margin-left: 50px;">Un préstamo puede devolverse 
        independientemente del estado operativo de la obra.</p>

    <p style="text-align: left; margin-left: 50px;">
        Cuando se devuelve el préstamo el sistema le informará con el mensaje  
        y le dirá la fecha en que ha sido devuelto, así mismo informará de los
        datos del usuario y de la obra.</p>

    <p style="text-align: left; margin-left: 50px;">
        Si se introduce un identificador de préstamo que ya hubiera sido devuelto,el sistema 
        informará con el mensaje: "<i>El préstamo con ese identificador ya estaba devuelto, 
            no<br> hay datos que mostrar</i>".</p>

    <p style="text-align: left; margin-left: 50px;">
        Si se introduce un identificador de préstamo que no exista, el sistema informará con 
        el mensaje: "<i>No existe ningún préstamo con ese identificador,no hay datos que mostrar</i>".</p>

    <center><img style="margin:10px;" alt="" src="../imagenes/imagen 16 cancelar prestamos.PNG"/></center>
    <center>Formulario de cancelación de préstamos</center>

    <h3 style="text-align: left; margin-left: 50px;"><u>Listados</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">Tendrá acceso a  6 tipos de listado 
        de  préstamos, y todos los préstamos que hubieran sido devueltos fuera de 
        plazo se marcarán en color rojo.</p>

    <center><img style="margin:10px;" alt="" src="../imagenes/imagen 17 listado prestamos.PNG"/></center>
    <center>Listados de préstamos desplegados</center>

    <p style="text-align: left; margin-left: 50px;">Las 6 opciones de listado son:</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>1)Préstamos</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        Son todos los préstamos que se han realizado con la aplicación, y es un 
        listado de solo consulta.</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>2)Préstamos con doble filtrado</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        Este listado permite filtrar la lista general de préstamos usando 2 criterios: 
        DNI de usuario e ISBN de obra.</p>

    <p style="text-align: left; margin-left: 50px;">
        Para realizar el filtrado hay que completar los dos campos.</p>

    <p style="text-align: left; margin-left: 50px;">
        Cuando introduzca los campos accederá a una nueva tabla donde verá el préstamo 
        o préstamos identificados, y se le mostrarán dos mensajes añadidos.<br> El primer 
        mensaje le informará del nombre del usuario y si está o no de alta, y el segundo 
        mensaje le informará del nombre, autor y estado operativo de la obra.</p>

    <p style="text-align: left; margin-left: 50px;">
        Si en algún caso los datos del DNI o del ISBN no corresponden a ningún préstamo 
        existente en el listado, el sistema le informará con el mensaje "<i>no existen<br> prestamos 
            con esos DNI e ISBN activos</i>".</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>3)Préstamos ordenados por DNI</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        Este listado permite filtrar la lista general de préstamos,ordenada por el DNI del 
        usuario, filtrando por un criterio: ISBN de obra.</p>

    <p style="text-align: left; margin-left: 50px;">
        Si se introduce un ISBN que no esté en el listado,el sistema le informará con un mensaje.</p>

    <p style="text-align: left; margin-left: 50px;">
        Cuando se introduce un ISBN en concreto, el sistema mostrará los préstamos que contengan 
        una obra con ese ISBN, e informará de los datos de la misma.</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>4)Préstamos ordenados por ISBN</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        En este listado los préstamos se encuentran ordenados por el ISBN de la obra. 
        Este listado permite un filtrado simple usando el DNI del usuario. 
        Si se introduce un DNI<br> que no esté en el listado,el sistema le informará con un mensaje.</p>

    <p style="text-align: left; margin-left: 50px;">
        Cuando se introduce un DNI en concreto, el sistema mostrará los préstamos 
        que contengan un usuario con ese DNI, e informará de los datos del mismo.</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>5)Préstamos ordenados por fecha de solicitud</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        Este listado muestra la lista general de préstamos ordenada por la fecha 
        de dsolicitud y es solo de consulta..</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>6)Préstamos ordenados por fecha de devolución</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">
        Este listado muestra la lista general de préstamos ordenada por la fecha 
        de devolución y es solo de consulta..</p>

</body>
</html>
