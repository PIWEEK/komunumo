<html>
    <head>
         <meta name="layout" content="base" />
         <title>Komunumo</title>
    </head>
    <!-- end of base temaplate -->
    <body>
        <section class="home-header">
            <div class="container">
                <h1 class="logo text-indent">Komunumo</h1>
                <div class="activity-search">
                    <h2>Qué hacer en el barrio</h2>
                    <form>
                        <fieldset class="neighborhood-select">
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
                        <fieldset class="activity-select">
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
                        <fieldset class="date-select">
                            <select>
                                <option class="default selected" selected="selected">¿Cuándo?</option>
                                <option>Hoy</option>
                                <option>En 3 días</option>
                                <option>En una semana</option>
                                <option>En un mes</option>
                            </select>
                        </fieldset>
                        <fieldset>
                            <a href="#" class="search-event btn" title="Busca eventos">Buscar!</a>
                        </fieldset>
                    </form>
                </div>
            </div><!-- /container -->
        </section><!-- head home -->
        <nav class="alt-header hidden">
            <div class="container clearfix">
                <div class="logo text-indent">Komunumo</div>
                <form>
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
                        <a href="#" class="btn" title="Busca eventos">Buscar!</a>
                    </fieldset>
                </form>
            </div><!-- /container -->
        </nav>
        <section class="home-body">
            <div class="container activity-list">
                <p class="title-activities">
                    Busco <span class="activity-search">gastronomía</span> <span class="neigborhood-search">en guindalera</span> <span class="date-search">hoy</span>
                </p>
            </div><!-- /container -->

            <div class="container activity-list-body clearfix">
                <div data-bind="collection:$collection"></div>
            </div>
        </section><!-- body home -->

        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- Compiled scripts -->
        <script src="app/bower_components/jquery/jquery.js"></script>
        <script src="app/bower_components/underscore/underscore.js"></script>
        <script src="app/bower_components/backbone/backbone.js"></script>
        <script src="app/bower_components/backbone.epoxy/backbone.epoxy.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/home.js"></script>
        <script src="js/model/home.js"></script>
        <!-- endbuild -->

        <script type="text/template" id="activity-template">
                <div class="single-activity {{ activityType.class }}">
                    <div class="activity-body">
                        <h3>{{name}}</h3>
                        <p class="description">{{ description }}</p>
                    </div>
                    <ul class="metadata-activity">
                        <li class="address">
                            <span class="typcn typcn-location-outline"></span>
                            {{ place }}
                        </li>
                        <li class="activity-type">
                            <span class="typcn typcn-wine"></span>
                            {{ activityType.class }}
                        </li>
                    </ul>
                    <div class="date">
                        {{ activityDate }}
                    </div>
                </div>

        </script>

    </body>
</html>
