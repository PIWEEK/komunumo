<html>
    <head>
         <meta name="layout" content="base" />
         <title>Entity name | Komunumo</title>
    </head>
    <!-- end of base template -->
    <body data-view="activity">

       <nav class="single-header activity-view">
            <div class="container clearfix">
                <div class="logo"><a class="text-indent" href="/komunumo" title="Komunumo">Komunumo</a></div>
                <form>
                    <fieldset class="neighborhood-select">
                        <select name="neighId">
                            <option value="" class="default selected" selected="selected">¿Qué barrio?</option>
                            <g:each var="neighbourhood" in="${neigbourhoodList}" >
                                <option value="${neighbourhood.id}">${neighbourhood.name}</option>
                            </g:each>
                        </select>
                    </fieldset>
                    <fieldset class="activity-select">
                        <select name="aTypeId">
                            <option value="" class="default selected" selected="selected">¿Qué actividad?</option>
                            <g:each var="activityType" in="${activityTypeList}" >
                                <option value="${activityType.id}">${activityType.name}</option>
                            </g:each>
                        </select>
                    </fieldset>
                    <fieldset class="date-select">
                        <select name="nextDate">
                            <option value="" class="default selected" selected="selected">¿Cuándo?</option>
                            <option value="1">Hoy</option>
                            <option value="3">En 3 días</option>
                            <option value="7">En una semana</option>
                            <option value="30">En un mes</option>
                        </select>
                    </fieldset>
                    <fieldset>
                        <a href="#" class="search-event btn" title="Busca eventos">Buscar!</a>
                    </fieldset>
                </form>
            </div><!-- /container -->
        </nav>
        <div class="activity-view-body container clearfix">
            <h1 class="title">${entity?.name}</h1>
            <div class="description left">
                <ul class="activity-metadata">
                    <li class="address">
                        <span class="typcn typcn-location-outline"></span>
                         ${entity.address}
                    </li>
                    <li>
                        <span class="typcn typcn-directions"></span>
                         ${entity.zone}
                    </li>
                    <li class="activity-type">
                        <span class="typcn typcn-ico-124"></span>
                        ${entity.entityType}
                    </li>
                </ul>
                <article class="description-text">
                    ${entity.description}
                </article>
            </div>
            <div class="map right">
                <div id="map-block" class="map-block"
                    data-filter-category="5"
                    data-filter-subcategory="125"
                    data-filter-keywords="1"
                    data-initial-lon="-3.86"
                    data-initial-lat="40.38"
                    data-initial-zoom="11"
                    data-api-url="api/entity/map">
                </div>
            </div>
        </div><!-- /container -->

        <div class="related-activities container clearfix">
            <h3 class="title">Otras actividades de esa entidad</h3>
            <g:each var="activity" in="${activities}">
            <div class="single-activity activity-${activity.activityType.id}">
                <div class="activity-body">
                    <h3>
                        <a href="#" title="Monta tu propio huerto">${activity.name}</a>
                    </h3>
                    <p class="description">${activity.description}</p>
                </div>
                <ul class="metadata-activity">
                    <li class="address">
                        <span class="typcn typcn-location-outline"></span>
                        ${activity.place}
                    </li>
                    <li class="activity-type">
                        <span class="typcn typcn-ico-${activity.activityType.id}"></span>
                        ${activity.activityType.name}
                    </li>
                </ul>
                <div class="date">
                    <span class="date-day">20</span>
                    <span class="date-month">JUN</span>
                </div>
            </div>
            </g:each>
        </div>


        <!-- Compiled scripts -->
        <script src="app/bower_components/jquery/jquery.js"></script>
        <script src="app/bower_components/underscore/underscore.js"></script>
        <script src="app/bower_components/backbone/backbone.js"></script>
        <script src="app/bower_components/backbone.epoxy/backbone.epoxy.min.js"></script>
        <script src="js/openlayers/OpenLayers.js"></script>
        <script src="js/map.js"></script>
        <script src="js/main.js"></script>
        <script src="js/home.js"></script>
        <!-- endbuild -->
    </body>
</html>
