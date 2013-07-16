<%@ page import="komunumo.City" %>



<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="city.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${cityInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'neighbourhoods', 'error')} ">
	<label for="neighbourhoods">
		<g:message code="city.neighbourhoods.label" default="Neighbourhoods" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cityInstance?.neighbourhoods?}" var="n">
    <li><g:link controller="neighbourhood" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="neighbourhood" action="create" params="['city.id': cityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'neighbourhood.label', default: 'Neighbourhood')])}</g:link>
</li>
</ul>

</div>

