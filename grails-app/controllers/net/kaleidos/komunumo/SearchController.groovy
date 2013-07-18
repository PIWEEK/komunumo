package net.kaleidos.komunumo

import grails.plugins.springsecurity.Secured
import grails.converters.JSON
import groovy.time.TimeCategory


class SearchController {
	
	def searchService

    def activitySearch(String neighId, String aTypeId, String nextDate) {
		
		def success = true
		
		def neighbourhood = null
		if (neighId) {
			neighbourhood = Neighbourhood.get(neighId)
			if (!neighbourhood) {
				success = false
			} 
		}
		
		def activityType = null
		if (aTypeId) {
			activityType = ActivityType.get(aTypeId)
			if (!activityType) {
				success = false
			}
		}
		
		def endDate, realNow, now

		if (nextDate) {
			
			realNow = new Date()
			now = realNow.clearTime()
			
			use(TimeCategory) {				
				switch (nextDate) {
				case "0":
					endDate = now + 1.days
					break;
				case "1":
					endDate = now + 2.days		
					break;	
				case "3":
					endDate = now + 4.days		
					break;
				case "7":
					endDate = now + 1.week + 1.day
					break;
				case "30":
					endDate = now + 1.months + 1.day
					break;
				default:
					realNow = null
					endDate = null
					break;
				}
			}
		}
		
		def result = searchService.activitySearch(neighbourhood, activityType, realNow, endDate)
		if (success) {
			
			return render(text:[success:success, list:searchService.activityJsonFormatter(result)] as JSON, contentType:'text/json')
		} else {
		return render(text:[success:success, list:[]] as JSON, contentType:'text/json')
		}
	}
}
