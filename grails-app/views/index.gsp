<!doctype html>
<html>
<head>
    <meta name="layout" content="main2"/>
    <title>Welcome to Grails</title>
</head>
<body>



<div class="container">
    <div id="content" role="main">
        <section class="row">
            <h1 class="titulo">¡Bienvenido a Mercadolibre.com!</h1>

            <p>
                Aplicación web desarrollada para el programa IT Academy 2019 en MELI San Luis, Argentina.
            </p>
            <br>


        </section>

        <div id="controllers" role="navigation">
            <h2>Categorias:</h2>

            <div class="row botones" >
                <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3" v-for="item of articulos">
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <g:link controller="${c.logicalPropertyName}">
                            <img src="https://i.ibb.co/8xXvXHR/Captura-de-Pantalla-2019-08-24-a-la-s-23-46-29.png"
                                 alt="Indumentaria" border="0" />
                        </g:link>
                    </g:each>
                </div>

                <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3" v-for="item of articulos">
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <g:link controller="${c.logicalPropertyName}">
                            <img src="https://i.ibb.co/8zJLmfs/Captura-de-Pantalla-2019-08-24-a-la-s-23-47-18.png"
                                 alt="Indumentaria" border="0"/>
                        </g:link>
                    </g:each>
                </div>



                <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3" v-for="item of articulos">
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <g:link controller="${c.logicalPropertyName}">
                            <img src="https://i.ibb.co/9ssXS8K/Captura-de-Pantalla-2019-08-24-a-la-s-23-47-30.png"
                                 alt="Indumentaria" border="0" />
                        </g:link>
                    </g:each>
                </div>


                <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3" v-for="item of articulos">
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <g:link controller="${c.logicalPropertyName}">
                            <img src="https://i.ibb.co/8xXvXHR/Captura-de-Pantalla-2019-08-24-a-la-s-23-46-29.png"
                                 alt="Indumentaria" border="0" />
                        </g:link>
                    </g:each>
                </div>
            </div>
            <div class="row botones">

                <img style="width:90%;" src="https://i.ibb.co/PwHsNmk/Captura-de-Pantalla-2019-08-25-a-la-s-00-29-41.png"
                     alt="Colchones" border="0" />
            </div>


        </div>
    </div>
</div>

</body>
</html>
