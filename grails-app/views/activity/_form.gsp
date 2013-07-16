<%@ page import="komunumo.Activity" %>



<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="activity.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${activityInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'place', 'error')} ">
	<label for="place">
		<g:message code="activity.place.label" default="Place" />
		
	</label>
	<g:textField name="place" value="${activityInstance?.place}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'latitude', 'error')} ">
	<label for="latitude">
		<g:message code="activity.latitude.label" default="Latitude" />
		
	</label>
	<g:field name="latitude" value="${fieldValue(bean: activityInstance, field: 'latitude')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'longitude', 'error')} ">
	<label for="longitude">
		<g:message code="activity.longitude.label" default="Longitude" />
		
	</label>
	<g:field name="longitude" value="${fieldValue(bean: activityInstance, field: 'longitude')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'activityDate', 'error')} required">
	<label for="activityDate">
		<g:message code="activity.activityDate.label" default="Activity Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="activityDate" precision="day"  value="${activityInstance?.activityDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'activityType', 'error')} required">
	<label for="activityType">
		<g:message code="activity.activityType.label" default="Activity Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activityType" name="activityType.id" from="${komunumo.ActivityType.list()}" optionKey="id" required="" value="${activityInstance?.activityType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="activity.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${activityInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="activity.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${activityInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'entity', 'error')} required">
	<label for="entity">
		<g:message code="activity.entity.label" default="Entity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entity" name="entity.id" from="${komunumo.Entity.list()}" optionKey="id" required="" value="${activityInstance?.entity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'neighbourhood', 'error')} required">
	<label for="neighbourhood">
		<g:message code="activity.neighbourhood.label" default="Neighbourhood" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="neighbourhood" name="neighbourhood.id" from="${komunumo.Neighbourhood.list()}" optionKey="id" required="" value="${activityInstance?.neighbourhood?.id}" class="many-to-one"/>
</div>

