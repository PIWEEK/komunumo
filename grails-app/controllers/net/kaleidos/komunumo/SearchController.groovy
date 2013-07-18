package net.kaleidos.komunumo

import grails.plugins.springsecurity.Secured
import grails.converters.JSON
import groovy.time.TimeCategory


class SearchController {
	
	def searchService

    def activitySearch() {
		
		def success = true
		
		def neighbourhood = null
		if (params.neighId) {
			neighbourhood = Neighbourhood.get(params.neighId)
			if (!neighbourhood) {
				success = false
			} 
		}
		
		def activityType = null
		if (params.aTypeId) {
			activityType = ActivityType.get(params.aTypeId)
			if (!activityType) {
				success = false
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
				default:
					success = false
					break;
				}
			}
		}
		
		def result = searchService.activitySearch(neighbourhood, activityType, realNow, nextDate)
		
println "-------------------> ${neighbourhood} - ${activityType} - ${realNow} - ${nextDate} - ${success}"		
		
			return render(text:[success:success, list:result] as JSON, contentType:'text/json')
	}
}
