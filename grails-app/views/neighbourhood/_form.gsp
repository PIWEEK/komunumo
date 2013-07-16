<%@ page import="komunumo.Neighbourhood" %>



<div class="fieldcontain ${hasErrors(bean: neighbourhoodInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="neighbourhood.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${neighbourhoodInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: neighbourhoodInstance, field: 'latitude', 'error')} ">
	<label for="latitude">
		<g:message code="neighbourhood.latitude.label" default="Latitude" />
		
	</label>
	<g:field name="latitude" value="${fieldValue(bean: neighbourhoodInstance, field: 'latitude')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: neighbourhoodInstance, field: 'longitude', 'error')} ">
	<label for="longitude">
		<g:message code="neighbourhood.longitude.label" default="Longitude" />
		
	</label>
	<g:field name="longitude" value="${fieldValue(bean: neighbourhoodInstance, field: 'longitude')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: neighbourhoodInstance, field: 'activities', 'error')} ">
	<label for="activities">
		<g:message code="neighbourhood.activities.label" default="Activities" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${neighbourhoodInstance?.activities?}" var="a">
    <li><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activity" action="create" params="['neighbourhood.id': neighbourhoodInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activity.label', default: 'Activity')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: neighbourhoodInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="neighbourhood.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="city" name="city.id" from="${komunumo.City.list()}" optionKey="id" required="" value="${neighbourhoodInstance?.city?.id}" class="many-to-one"/>
</div>

