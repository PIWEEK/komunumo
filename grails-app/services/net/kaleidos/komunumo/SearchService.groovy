package net.kaleidos.komunumo

import groovy.time.TimeCategory

/**
 * Service for searching
 * @author daniel
 *
 */
class SearchService {
	
	static transactional = false

	/**	
	 * Search for activities according to a neighbourhood, an activity type, and celebrated between now and now+days
	 * @param neighbourhood
	 * @param activityType
	 * @param days
	 * @return List of activities
	 */
    public List<Activity> activitySearch(Neighbourhood neighbourhood, ActivityType activityType, Date startDate, Date nextDate) {
		
println "=> ${neighbourhood} - ${activityType} - ${startDate} - ${nextDate}"		

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
}
