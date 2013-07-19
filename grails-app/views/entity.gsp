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
                        <span class="typcn typcn-group-outline"></span>
                        ${entity.entityType}
                    </li>
                </ul>
                <article class="description-text">
                    ${entity.description}
                </article>
            </div>
            <div class="map right">
                <div id="map-block" class="map-block"
                    data-filter-category="${entity.id}"
                    data-filter-subcategory=""
                    data-filter-keywords=""
                    data-initial-lon="-3.7"
                    data-initial-lat="40.4"
                    data-initial-zoom="11"
                    data-api-url="${createLink(uri: '/api/entity/detail/map', absolute: true)}">
                </div>
            </div>
        </div><!-- /container -->

        <g:if test="${activities}">
        <div class="related-activities container clearfix">
            <h3 class="title">Otras actividades de esa entidad</h3>
            <g:each var="activity" in="${activities}">
            <div class="single-activity activity-${activity.activityType.id}">
                <div class="activity-body">
                    <h3>
                        <g:link mapping="activityDetail" params="[id: activity.id]">
                            ${activity.name}
                        </g:link>
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
        </g:if>

        <r:require module="activity" />
    </body>
</html>
