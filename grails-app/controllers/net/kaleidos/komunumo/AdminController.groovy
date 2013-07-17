package net.kaleidos.komunumo

import grails.plugins.springsecurity.Secured

@Secured("isAuthenticated()")
class AdminController {

    def scaffolding() { 
		 render view:'/admin'
	}
}
