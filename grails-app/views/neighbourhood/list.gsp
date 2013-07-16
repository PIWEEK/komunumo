
<%@ page import="komunumo.Neighbourhood" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'neighbourhood.label', default: 'Neighbourhood')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-neighbourhood" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-neighbourhood" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'neighbourhood.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="latitude" title="${message(code: 'neighbourhood.latitude.label', default: 'Latitude')}" />
					
						<g:sortableColumn property="longitude" title="${message(code: 'neighbourhood.longitude.label', default: 'Longitude')}" />
					
						<th><g:message code="neighbourhood.city.label" default="City" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${neighbourhoodInstanceList}" status="i" var="neighbourhoodInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${neighbourhoodInstance.id}">${fieldValue(bean: neighbourhoodInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: neighbourhoodInstance, field: "latitude")}</td>
					
						<td>${fieldValue(bean: neighbourhoodInstance, field: "longitude")}</td>
					
						<td>${fieldValue(bean: neighbourhoodInstance, field: "city")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${neighbourhoodInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
