package net.kaleidos.komunumo

import grails.plugins.springsecurity.Secured
import grails.converters.JSON
import groovy.time.TimeCategory


class SearchController {
	
	def searchService

    def activitySearch() {
		
		def error = false
		
		def neighbourhood = null
		if (params.neighId) {
			neighbourhood = Neighbourhood.get(params.neighId)
			if (!neighbourhood) {
				error = true
			} 
		}
		
		def activityType = null
		if (params.aTypeId) {
			activityType = ActivityType.get(params.aTypeId)
			if (!activityType) {
				error = true
			}
		}
		
		def nextDate, realNow, now

		if (params.nextDate) {
			realNow = new Date()
			now = realNow.clearTime()
			
			use(TimeCategory) {				
				switch (params.neighId) {
				case 0:
					nextDate = now + 1.days
					break;
				case 1:
					nextDate = now + 2.days		
					break;	
				case 3:
					nextDate = now + 4.days		
					break;
				case 7:
					nextDate = now + 1.week + 1.day
					break;
				case 30:
					nextDate = now + 1.months + 1.day
					break;
				}
			}
		}
println "-------------------> ${neighbourhood} - ${activityType} - "		
		
		def result = searchService.activitySearch(neighbourhood, activityType, now, nextDate)
		
//println "===================> ${json}"		
			return render(text:[success:error, list:Activity.list()] as JSON, contentType:'text/json')
	}
}
