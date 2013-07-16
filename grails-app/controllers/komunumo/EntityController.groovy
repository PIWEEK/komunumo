package komunumo

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured("isAuthenticated()")
class EntityController {
	static scaffold = true
}
