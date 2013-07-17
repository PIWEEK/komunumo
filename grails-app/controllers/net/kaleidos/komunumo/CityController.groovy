package net.kaleidos.komunumo

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured("isAuthenticated()")
class CityController {
	static scaffold = true	
}
