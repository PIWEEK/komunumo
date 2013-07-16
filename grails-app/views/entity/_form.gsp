<%@ page import="komunumo.Entity" %>



<div class="fieldcontain ${hasErrors(bean: entityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="entity.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${entityInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entityInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="entity.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${entityInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entityInstance, field: 'latitude', 'error')} ">
	<label for="latitude">
		<g:message code="entity.latitude.label" default="Latitude" />
		
	</label>
	<g:field name="latitude" value="${fieldValue(bean: entityInstance, field: 'latitude')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entityInstance, field: 'longitude', 'error')} ">
	<label for="longitude">
		<g:message code="entity.longitude.label" default="Longitude" />
		
	</label>
	<g:field name="longitude" value="${fieldValue(bean: entityInstance, field: 'longitude')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entityInstance, field: 'web', 'error')} ">
	<label for="web">
		<g:message code="entity.web.label" default="Web" />
		
	</label>
	<g:textField name="web" value="${entityInstance?.web}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entityInstance, field: 'telephone', 'error')} ">
	<label for="telephone">
		<g:message code="entity.telephone.label" default="Telephone" />
		
	</label>
	<g:textField name="telephone" value="${entityInstance?.telephone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entityInstance, field: 'zone', 'error')} ">
	<label for="zone">
		<g:message code="entity.zone.label" default="Zone" />
		
	</label>
	<g:textField name="zone" value="${entityInstance?.zone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entityInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="entity.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${entityInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entityInstance, field: 'entityType', 'error')} ">
	<label for="entityType">
		<g:message code="entity.entityType.label" default="Entity Type" />
		
	</label>
	<g:textField name="entityType" value="${entityInstance?.entityType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entityInstance, field: 'activities', 'error')} ">
	<label for="activities">
		<g:message code="entity.activities.label" default="Activities" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${entityInstance?.activities?}" var="a">
    <li><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activity" action="create" params="['entity.id': entityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activity.label', default: 'Activity')])}</g:link>
</li>
</ul>

</div>

