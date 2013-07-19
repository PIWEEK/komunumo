<html>
    <head>
         <meta name="layout" content="base" />
         <title>Komunumo</title>
         <r:require module="activity" />
    </head>
    <!-- end of base temaplate -->
    <body>
        <section class="home-header">
            <div class="container">
                <h1 class="logo text-indent">Komunumo</h1>
                <div class="activity-search">
                    <h2>Qué hacer en el barrio</h2>
                    <form action="" class="search-form">
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
                </div>
            </div><!-- /container -->
        </section><!-- head home -->
        <nav class="alt-header hidden">
            <div class="container clearfix">
                <div class="logo text-indent">Komunumo</div>
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
        <section class="home-body">
            <div class="container activity-list">
                <p class="title-activities">
                    <span class="search-text">¿Qué buscas?</span>
                    <span class="activity-search-text"></span>
                    <span class="neigborhood-search-text"></span>
                    <span class="date-search-text"></span>
                </p>
            </div><!-- /container -->

            <div class="container activity-list-body clearfix">
                <div data-bind="collection:$collection"></div>
            </div>
        </section><!-- body home -->

        <section class="map">
            <div id="map-block" class="map-block"
                data-filter-category=""
                data-filter-subcategory=""
                data-filter-keywords=""
                data-initial-lon="-3.7"
                data-initial-lat="40.4"
                data-initial-zoom="11"
                data-api-url="${createLink(uri: '/api/activity/map', absolute: true)}">
            </div>
        </section>

        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <script type="text/template" id="activity-template">
                <div class="single-activity activity-{{ activityTypeId }}">
                    <div class="activity-body">
                        <h3>
                            <a href="{{ url }}" title="{{name}}">{{name}}</a>
                        </h3>
                        <p class="description">{{ description }}...</p>
                    </div>
                    <ul class="metadata-activity">
                        <li class="address">
                            <span class="typcn typcn-location-outline"></span>
                            {{ place }}
                        </li>
                        <li class="activity-type">
                            <span class="typcn typcn-ico-{{ activityTypeId }}"></span>
                            {{ activityTypeName }}
                        </li>
                    </ul>
                    <div class="date">
                        <span class="date-day">{{ activityDayDate }}</span>
                        <span class="date-month">{{ activityDayMonth }}</span>
                    </div>
                </div>

        </script>
    </body>
</html>
