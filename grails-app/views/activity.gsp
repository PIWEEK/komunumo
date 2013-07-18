<html>
    <head>
         <meta name="layout" content="base" />
         <title>Komunumo</title>
    </head>
    <!-- end of base temaplate -->
    <body>

       <nav class="alt-header">
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
		
		
        <!-- Compiled scripts -->
        <g:javascript src="app/bower_components/jquery/jquery.js"></g:javascript>
        <g:javascript src="app/bower_components/underscore/underscore.js"></g:javascript>
        <g:javascript src="app/bower_components/backbone/backbone.js"></g:javascript>
        <g:javascript src="app/bower_components/backbone.epoxy/backbone.epoxy.min.js"></g:javascript>
        <g:javascript src="js/main.js"></g:javascript>
        <g:javascript src="js/home.js"></g:javascript>
        <!-- endbuild -->
    </body>
</html>
