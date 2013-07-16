
<%@ page import="komunumo.Activity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'activity.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="place" title="${message(code: 'activity.place.label', default: 'Place')}" />
					
						<g:sortableColumn property="latitude" title="${message(code: 'activity.latitude.label', default: 'Latitude')}" />
					
						<g:sortableColumn property="longitude" title="${message(code: 'activity.longitude.label', default: 'Longitude')}" />
					
						<g:sortableColumn property="activityDate" title="${message(code: 'activity.activityDate.label', default: 'Activity Date')}" />
					
						<th><g:message code="activity.activityType.label" default="Activity Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityInstanceList}" status="i" var="activityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityInstance.id}">${fieldValue(bean: activityInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: activityInstance, field: "place")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "latitude")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "longitude")}</td>
					
						<td><g:formatDate date="${activityInstance.activityDate}" /></td>
					
						<td>${fieldValue(bean: activityInstance, field: "activityType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
