package net.kaleidos.komunumo

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured("isAuthenticated()")
class UserController {
	static scaffold = true
}
