<html>
    <head>
         <meta name="layout" content="base" />
         <title>Komunumo2</title>
    </head>
    <!-- end of base temaplate -->
    <body>
        <section class="home-header">
            <div class="container">
                <h1 class="logo text-indent">Komunumo</h1>
                <form class="activity-search">
                    <h2>¿Qué hacer en el barrio?</h2>
                    <fieldset>
                        <select>
                            <option class="default selected" selected="selected">¿Qué barrio?</option>
                            <option>Barrio 1</option>
                            <option>Barrio 2</option>
                            <option>Barrio 3</option>
                            <option>Barrio 4</option>
                            <option>Barrio 5</option>
                            <option>Barrio 6</option>
                            <option>Barrio 7</option>
                        </select>
                    </fieldset>
                    <fieldset>
                        <select>
                            <option class="default selected" selected="selected">¿Qué actividad?</option>
                            <option>Arte y cultura</option>
                            <option>Deporte y aventura</option>
                            <option>Formación</option>
                            <option>Excursiones</option>
                            <option>Gastronomía</option>
                            <option>infantil</option>
                            <option>Social</option>
                            <option>Actividad múltiple</option>
                        </select>   
                    </fieldset>
                    <fieldset>
                        <select>
                            <option class="default selected" selected="selected">¿Cuándo?</option>
                            <option>Hoy</option>
                            <option>En 3 días</option>
                            <option>En una semana</option>
                            <option>En un mes</option>
                        </select>   
                    </fieldset>
                    <fieldset>
                        <a href="#" class="btn" title="Busca eventos">¡Busca!</a>
                    </fieldset>
                </form>
            </div><!-- /container -->
        </section><!-- head home -->

        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
            (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src='//www.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
        </script>

        <!-- build:js scripts/main.js -->
        <script src="app/bower_components/jquery/jquery.js"></script>
        <script src="app/bower_components/underscore/underscore.js"></script>
        <script src="app/bower_components/backbone/backbone.js"></script>
        <!-- Compiled scripts -->
        <script src="js/main.js"></script>
        <script src="js/home.js"></script>
        <script src="js/model/home.js"></script>
        <!-- endbuild -->
    </body>
</html>
