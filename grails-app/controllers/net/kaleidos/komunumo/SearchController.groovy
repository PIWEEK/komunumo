package net.kaleidos.komunumo

import grails.plugins.springsecurity.Secured
import grails.converters.JSON

class SearchController {

    def activitySearch() {
		return render(text:[success:true, list:Activity.list()] as JSON, contentType:'text/json')
	}
}
