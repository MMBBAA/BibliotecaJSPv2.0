<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2Instrucciones3</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titulo">
            <h1>BIBLIOTECA - Instrucciones</h1>
            <div id="menu">
                <div id="opciones">
                    <h2><a href="../Menu.jsp">Ir a menu inicial</a></h2> 
                    <h2><a href="V2Instrucciones2.jsp"><img style alt="Atras" src="../imagenes/atras.png"/></a></h2> 
                    <h2><a href="V2Instrucciones4.jsp"><img style alt="Adelante" src="../imagenes/adelante.png"/></a></h2>  
                </div>
            </div>
        </div>

        <h2>Opciones de la secci�n usuario:</h2>
        <br>

        <h3 style="text-align: left; margin-left: 50px;"><u>Dar usuarios de alta</u>:</h3>

        <p style="text-align: left; margin-left: 50px;">Se accede a un formulario para dar 
            a usuarios de alta que debe cumplimentarse seg�n las indicaciones.</p>

        <p style="text-align: left; margin-left: 50px;">Si ha intentado dar de alta a un usuario 
            que ya estuviera en el sistema de alta, el sistema le informar� al respecto.</p>

        <p style="text-align: left; margin-left: 50px;">Si ha intentado dar de alta a un usuario 
            que ya estuviera en el sistema, pero lo estuviera de baja, el sistema le quitar� 
            la baja y le pondr� en alta.</p>

        <p style="text-align: left; margin-left: 50px;">Cuando el usuario est� creado el sistema 
            le informar�.</p>

        <h3 style="text-align: left; margin-left: 50px;"><u>Recuperar usuarios de baja</u>:</h3>

        <p style="text-align: left; margin-left: 50px;">Se accede a un formulario y a 
            un listado de los usuarios que est�n de baja en el sistema.</p>

        <p style="text-align: left; margin-left: 50px;">Tendr� que cumplimentar el 
            formulario seg�n las indicaciones.</p>

        <p style="text-align: left; margin-left: 50px;">
            Si en el formulario introduce datos de un usuario que no exista, o bien 
            exista pero est� de alta, el sistema mandar� el mensaje 
            "<i>no se encuentra a <br>ning�n usuario de baja con ese DNI</i>".</p>

        <p style="text-align: left; margin-left: 50px;">Cuando el usuario est� recuperado 
            de la baja y vuelva al alta, el sistema le informar�.</p>

    <center><img style="margin:10px;" alt="" src="../imagenes/imagen 11 recuperar usuario de baja.PNG"/></center>
    <center>Formulario de recuperaci�n de bajas de usuario</center>

    <h3 style="text-align: left; margin-left: 50px;"><u>Dar usuarios de baja</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">Se accede a un formulario y 
        a un listado de los usuarios que se encuentran de alta.</p>

    <p style="text-align: left; margin-left: 50px;">Tendr� que cumplimentar 
        el formulario seg�n las indicaciones.</p>

    <p style="text-align: left; margin-left: 50px;">
        No puede dar de baja a usuarios que a�n tengan pr�stamos por devolver.</p>

    <p style="text-align: left; margin-left: 50px;">Si introduce los datos de un 
        usuario que ya se encuentre de baja, o bien los datos de un usuario que 
        a�n tenga pr�stamos por devolver, el sistema <br>le informar� al respecto.</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>Modificaci�n de usuarios</u></h3>

    <p style="text-align: left; margin-left: 50px;">Se accede a un formulario y 
        a un listado de los usuarios que est�n tanto de alta como de baja.</p>

    <p style="text-align: left; margin-left: 50px;">Tendr� que cumplimentar 
        el formulario seg�n las indicaciones.</p>

    <p style="text-align: left; margin-left: 50px;">

        Si introduce el DNI de un usuario que no exista, el sistema le informar� 
        al respecto con el mensaje "<i>no existe ning�n usuario con ese DNI"</i>.</p>

    <p style="text-align: left; margin-left: 50px;">
        Cuando introduzca el DNI correctamente, acceder� a un nuevo formulario 
        con los datos del usuario que usted desea modificar,<br> los cuales ya estar�n 
        cargados por defecto en los campos. Puede modificarlos como desee siguiendo 
        las indicaciones de formato que se hicieron <br>en el formulario anterior.</p>

    <p style="text-align: left; margin-left: 50px;">
        Podr� modificar los datos de los usuarios menos el DNI y el estado de alta
        (este �ltimo campo se modifica en otras secciones).</p>

    <center><img style="margin:10px;" alt="" src="../imagenes/imagen 13 modificar usuario.PNG"/></center>
    <center>Formulario de modificaci�n de usuarios</center>

    <h3 style="text-align: left; margin-left: 50px;"><u>Listados</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">Tendr� acceso a 4 tipos 
        de listado de usuarios, son listados de solo consulta.</p>

    <p style="text-align: left; margin-left: 50px;">Las opciones de listado 
        son claras respecto a lo que hacen.</p>

</body>
</html>
