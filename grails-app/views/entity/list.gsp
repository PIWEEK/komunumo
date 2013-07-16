
<%@ page import="komunumo.Entity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entity.label', default: 'Entity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-entity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-entity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'entity.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'entity.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="latitude" title="${message(code: 'entity.latitude.label', default: 'Latitude')}" />
					
						<g:sortableColumn property="longitude" title="${message(code: 'entity.longitude.label', default: 'Longitude')}" />
					
						<g:sortableColumn property="web" title="${message(code: 'entity.web.label', default: 'Web')}" />
					
						<g:sortableColumn property="telephone" title="${message(code: 'entity.telephone.label', default: 'Telephone')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${entityInstanceList}" status="i" var="entityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${entityInstance.id}">${fieldValue(bean: entityInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: entityInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: entityInstance, field: "latitude")}</td>
					
						<td>${fieldValue(bean: entityInstance, field: "longitude")}</td>
					
						<td>${fieldValue(bean: entityInstance, field: "web")}</td>
					
						<td>${fieldValue(bean: entityInstance, field: "telephone")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${entityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
