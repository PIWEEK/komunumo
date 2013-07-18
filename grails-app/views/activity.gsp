<html>
    <head>
         <meta name="layout" content="base" />
         <title>Activity name | Komunumo</title>
    </head>
    <!-- end of base temaplate -->
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
            <h1 class="title">Cata de vinos y comida popular en la Guindalera</h1>
            <div class="description left">
                <ul class="activity-metadata">
                    <li class="address">
                        <span class="typcn typcn-location-outline"></span>
                         Plaza del encuentro                        
                    </li>
                    <li>
                        <span class="typcn typcn-directions"></span>
                         Plaza del encuentro
                    </li>
                    <li class="activity-type">
                        <span class="typcn typcn-ico-124"></span>
                        Infantil
                    </li>
                </ul>
                <article class="description-text">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nec augue id purus lacinia tincidunt. Aenean non tempus lacus, eu facilisis neque. Phasellus venenatis est in orci aliquet consectetur. Ut non ipsum ut justo tristique euismod ac eu urna. Nullam consectetur, purus eget dictum aliquam, tortor nibh ornare tellus, quis porttitor purus risus id neque. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                    <p>Aliquam erat sapien, condimentum sed congue suscipit, vehicula rutrum quam. Fusce fermentum felis a nibh pretium posuere.Quisque faucibus, justo iaculis egestas tincidunt, mauris urna condimentum nibh, vel convallis nisi lacus eget purus. Aliquam vel nulla bibendum, venenatis tortor quis, ultrices tellus. Integer in erat congue, venenatis eros vel, pulvinar justo. Cras sit amet tortor vel tortor tristique tristique. Vestibulum venenatis fermentum urna sed pulvinar. </p>
                    <!--
                    <p>Praesent iaculis mauris sapien, eu blandit lorem vulputate at. Mauris congue, ligula malesuada suscipit iaculis, dui lorem luctus odio, in convallis dui dolor vitae nisi. Donec gravida sed nunc non fermentum. Ut eget nulla ornare, malesuada sapien quis, aliquam orci. Mauris eget suscipit massa, et rhoncus arcu. Maecenas commodo justo blandit, hendrerit odio in, luctus leo. Nulla facilisi. Mauris porttitor vestibulum iaculis.Curabitur bibendum augue quis neque porttitor, quis mattis lectus ultrices. Fusce ante elit, accumsan ultricies dignissim nec, malesuada vel mi. Maecenas interdum eros id sapien luctus rutrum. Vivamus egestas mauris quis tristique iaculis. Vestibulum lobortis dictum tempus. Sed porta in velit non dapibus. Proin eget est non massa condimentum fringilla a at risus. Sed ac ipsum mollis, </p>
                    -->
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
                    data-api-url="api/activity/map">
                </div>
            </div>
        </div><!-- /container -->

        <div class="related-activities container clearfix">
            <h3 class="title">Actividades relacionadas</h3>
            <div class="single-activity activity-121">
                <div class="activity-body">
                    <h3>
                        <a href="#" title="Monta tu propio huerto">Monta tu propio huerto</a>
                    </h3>
                    <p class="description">Te enseñamos a montar tu propio huerto ecológico.</p>
                </div>
                <ul class="metadata-activity">
                    <li class="address">
                        <span class="typcn typcn-location-outline"></span>
                        Centro Eco
                    </li>
                    <li class="activity-type">
                        <span class="typcn typcn-ico-{{ activityTypeId }}"></span>
                        Formación
                    </li>
                </ul>
                <div class="date">
                    <span class="date-day">20</span>
                    <span class="date-month">JUN</span>
                </div>
            </div>
        </div>
		
		
        <!-- Compiled scripts -->
        <g:javascript src="app/bower_components/jquery/jquery.js"></g:javascript>
        <g:javascript src="app/bower_components/underscore/underscore.js"></g:javascript>
        <g:javascript src="app/bower_components/backbone/backbone.js"></g:javascript>
        <g:javascript src="app/bower_components/backbone.epoxy/backbone.epoxy.min.js"></g:javascript>
        <g:javascript src="js/openlayers/OpenLayers.js"></g:javascript>
        <g:javascript src="js/map.js"></g:javascript>
        <g:javascript src="js/main.js"></g:javascript>
        <g:javascript src="js/home.js"></g:javascript>
        <!-- endbuild -->
    </body>
</html>
