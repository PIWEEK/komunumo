
<%@ page import="komunumo.Entity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entity.label', default: 'Entity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-entity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-entity" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list entity">
			
				<g:if test="${entityInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="entity.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${entityInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entityInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="entity.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${entityInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entityInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="entity.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${entityInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entityInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="entity.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${entityInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entityInstance?.web}">
				<li class="fieldcontain">
					<span id="web-label" class="property-label"><g:message code="entity.web.label" default="Web" /></span>
					
						<span class="property-value" aria-labelledby="web-label"><g:fieldValue bean="${entityInstance}" field="web"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entityInstance?.telephone}">
				<li class="fieldcontain">
					<span id="telephone-label" class="property-label"><g:message code="entity.telephone.label" default="Telephone" /></span>
					
						<span class="property-value" aria-labelledby="telephone-label"><g:fieldValue bean="${entityInstance}" field="telephone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entityInstance?.zone}">
				<li class="fieldcontain">
					<span id="zone-label" class="property-label"><g:message code="entity.zone.label" default="Zone" /></span>
					
						<span class="property-value" aria-labelledby="zone-label"><g:fieldValue bean="${entityInstance}" field="zone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entityInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="entity.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${entityInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entityInstance?.entityType}">
				<li class="fieldcontain">
					<span id="entityType-label" class="property-label"><g:message code="entity.entityType.label" default="Entity Type" /></span>
					
						<span class="property-value" aria-labelledby="entityType-label"><g:fieldValue bean="${entityInstance}" field="entityType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entityInstance?.activities}">
				<li class="fieldcontain">
					<span id="activities-label" class="property-label"><g:message code="entity.activities.label" default="Activities" /></span>
					
						<g:each in="${entityInstance.activities}" var="a">
						<span class="property-value" aria-labelledby="activities-label"><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${entityInstance?.id}" />
					<g:link class="edit" action="edit" id="${entityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
