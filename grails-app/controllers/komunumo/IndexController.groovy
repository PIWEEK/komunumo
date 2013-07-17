package komunumo

import grails.plugins.springsecurity.Secured

class IndexController {

    def show() {
		 render view:'/index', model:[dataView: 'HomeView']
	}
}
