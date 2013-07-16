
<%@ page import="komunumo.Activity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activity" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activity">
			
				<g:if test="${activityInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="activity.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${activityInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.place}">
				<li class="fieldcontain">
					<span id="place-label" class="property-label"><g:message code="activity.place.label" default="Place" /></span>
					
						<span class="property-value" aria-labelledby="place-label"><g:fieldValue bean="${activityInstance}" field="place"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="activity.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${activityInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="activity.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${activityInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.activityDate}">
				<li class="fieldcontain">
					<span id="activityDate-label" class="property-label"><g:message code="activity.activityDate.label" default="Activity Date" /></span>
					
						<span class="property-value" aria-labelledby="activityDate-label"><g:formatDate date="${activityInstance?.activityDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.activityType}">
				<li class="fieldcontain">
					<span id="activityType-label" class="property-label"><g:message code="activity.activityType.label" default="Activity Type" /></span>
					
						<span class="property-value" aria-labelledby="activityType-label"><g:link controller="activityType" action="show" id="${activityInstance?.activityType?.id}">${activityInstance?.activityType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="activity.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${activityInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="activity.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${activityInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.entity}">
				<li class="fieldcontain">
					<span id="entity-label" class="property-label"><g:message code="activity.entity.label" default="Entity" /></span>
					
						<span class="property-value" aria-labelledby="entity-label"><g:link controller="entity" action="show" id="${activityInstance?.entity?.id}">${activityInstance?.entity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.neighbourhood}">
				<li class="fieldcontain">
					<span id="neighbourhood-label" class="property-label"><g:message code="activity.neighbourhood.label" default="Neighbourhood" /></span>
					
						<span class="property-value" aria-labelledby="neighbourhood-label"><g:link controller="neighbourhood" action="show" id="${activityInstance?.neighbourhood?.id}">${activityInstance?.neighbourhood?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${activityInstance?.id}" />
					<g:link class="edit" action="edit" id="${activityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
