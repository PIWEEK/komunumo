package net.kaleidos.komunumo

import groovy.time.TimeCategory
import java.text.DateFormatSymbols

/**
 * Service for searching
 * @author daniel
 *
 */
class SearchService {
	
	static transactional = false
	
	def grailsApplication

	/**	
	 * Search for activities according to a neighbourhood, an activity type, and celebrated between now and now+days
	 * @param neighbourhood
	 * @param activityType
	 * @param days
	 * @return List of activities
	 */
    public List<Activity> activitySearch(Neighbourhood neighbourhood, ActivityType activityType, Date startDate, Date nextDate) {
		
		def activities = Activity.withCriteria {
			if (neighbourhood) {
				eq "neighbourhood.id",  neighbourhood.id
			}			
			if (activityType) {
				eq "activityType.id", activityType.id
			}			
			if (startDate && nextDate) {
				between('activityDate', startDate, nextDate)
			}
		}

		return activities
	}
	
	public activityJsonFormatter(List<Activity> activityList) {
		
		def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
		
		def result = []
		activityList.each  { activity ->
			def threeLettersMonth =  new DateFormatSymbols().getMonths()[activity.activityDate.format("MM").toInteger()][0..2]
			def activityDetail = g.createLink(mapping: 'activityShow', params: [id: activity.id], absolute: "true")
			
			result << [
				'id' : activity.id,
				'activityDate' : activity.activityDate.format("dd") + " " + threeLettersMonth,
				'activityTypeName' : activity.activityType?.name,
				'url' : activityDetail,
				'address' : activity.address,
				'description' : activity.description.size() > 50 ? activity.description[0..49] : activity.description,
				'entity' : activity.entity,
				'latitude' : activity.latitude,
				'longitude' : activity.longitude,
				'name' : activity.name,
				'neighbourhood' : activity.neighbourhood,
				'place' : activity.place
				
			]
		}		
		return result

	}
}
