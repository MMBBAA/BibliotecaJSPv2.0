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

        <h2>Opciones de la sección usuario:</h2>
        <br>

        <h3 style="text-align: left; margin-left: 50px;"><u>Dar usuarios de alta</u>:</h3>

        <p style="text-align: left; margin-left: 50px;">Se accede a un formulario para dar 
            a usuarios de alta que debe cumplimentarse según las indicaciones.</p>

        <p style="text-align: left; margin-left: 50px;">Si ha intentado dar de alta a un usuario 
            que ya estuviera en el sistema de alta, el sistema le informará al respecto.</p>

        <p style="text-align: left; margin-left: 50px;">Si ha intentado dar de alta a un usuario 
            que ya estuviera en el sistema, pero lo estuviera de baja, el sistema le quitará 
            la baja y le pondrá en alta.</p>

        <p style="text-align: left; margin-left: 50px;">Cuando el usuario esté creado el sistema 
            le informará.</p>

        <h3 style="text-align: left; margin-left: 50px;"><u>Recuperar usuarios de baja</u>:</h3>

        <p style="text-align: left; margin-left: 50px;">Se accede a un formulario y a 
            un listado de los usuarios que estén de baja en el sistema.</p>

        <p style="text-align: left; margin-left: 50px;">Tendrá que cumplimentar el 
            formulario según las indicaciones.</p>

        <p style="text-align: left; margin-left: 50px;">
            Si en el formulario introduce datos de un usuario que no exista, o bien 
            exista pero esté de alta, el sistema mandará el mensaje 
            "<i>no se encuentra a <br>ningún usuario de baja con ese DNI</i>".</p>

        <p style="text-align: left; margin-left: 50px;">Cuando el usuario esté recuperado 
            de la baja y vuelva al alta, el sistema le informará.</p>

    <center><img style="margin:10px;" alt="" src="../imagenes/imagen 11 recuperar usuario de baja.PNG"/></center>
    <center>Formulario de recuperación de bajas de usuario</center>

    <h3 style="text-align: left; margin-left: 50px;"><u>Dar usuarios de baja</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">Se accede a un formulario y 
        a un listado de los usuarios que se encuentran de alta.</p>

    <p style="text-align: left; margin-left: 50px;">Tendrá que cumplimentar 
        el formulario según las indicaciones.</p>

    <p style="text-align: left; margin-left: 50px;">
        No puede dar de baja a usuarios que aún tengan préstamos por devolver.</p>

    <p style="text-align: left; margin-left: 50px;">Si introduce los datos de un 
        usuario que ya se encuentre de baja, o bien los datos de un usuario que 
        aún tenga préstamos por devolver, el sistema <br>le informará al respecto.</p>

    <h3 style="text-align: left; margin-left: 50px;"><u>Modificación de usuarios</u></h3>

    <p style="text-align: left; margin-left: 50px;">Se accede a un formulario y 
        a un listado de los usuarios que están tanto de alta como de baja.</p>

    <p style="text-align: left; margin-left: 50px;">Tendrá que cumplimentar 
        el formulario según las indicaciones.</p>

    <p style="text-align: left; margin-left: 50px;">

        Si introduce el DNI de un usuario que no exista, el sistema le informará 
        al respecto con el mensaje "<i>no existe ningún usuario con ese DNI"</i>.</p>

    <p style="text-align: left; margin-left: 50px;">
        Cuando introduzca el DNI correctamente, accederá a un nuevo formulario 
        con los datos del usuario que usted desea modificar,<br> los cuales ya estarán 
        cargados por defecto en los campos. Puede modificarlos como desee siguiendo 
        las indicaciones de formato que se hicieron <br>en el formulario anterior.</p>

    <p style="text-align: left; margin-left: 50px;">
        Podrá modificar los datos de los usuarios menos el DNI y el estado de alta
        (este último campo se modifica en otras secciones).</p>

    <center><img style="margin:10px;" alt="" src="../imagenes/imagen 13 modificar usuario.PNG"/></center>
    <center>Formulario de modificación de usuarios</center>

    <h3 style="text-align: left; margin-left: 50px;"><u>Listados</u>:</h3>

    <p style="text-align: left; margin-left: 50px;">Tendrá acceso a 4 tipos 
        de listado de usuarios, son listados de solo consulta.</p>

    <p style="text-align: left; margin-left: 50px;">Las opciones de listado 
        son claras respecto a lo que hacen.</p>

</body>
</html>
