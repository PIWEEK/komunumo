package komunumo

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured("isAuthenticated()")
class EntityController {
	static scaffold = true	
}
