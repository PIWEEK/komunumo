<%@ page import="komunumo.ActivityType" %>



<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="activityType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${activityTypeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'activities', 'error')} ">
	<label for="activities">
		<g:message code="activityType.activities.label" default="Activities" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${activityTypeInstance?.activities?}" var="a">
    <li><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activity" action="create" params="['activityType.id': activityTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activity.label', default: 'Activity')])}</g:link>
</li>
</ul>

</div>

