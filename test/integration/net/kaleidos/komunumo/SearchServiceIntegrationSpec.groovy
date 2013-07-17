package net.kaleidos.komunumo

import grails.test.*
import grails.plugin.spock.*
import spock.lang.*


class SearchServiceIntegrationSpec extends IntegrationSpec {
	
	def searchService

	void "searching activities for a given neighborhood"() {
		setup:
		
			def city = City.build()
			def entity = Entity.build(name: 'Entity1')
			
			def neighbourhood1 = Neighbourhood.build(city: city, name: 'neighbourhood1')
			def neighbourhood2 = Neighbourhood.build(city: city, name: 'neighbourhood2')
			def neighbourhood3 = Neighbourhood.build(city: city, name: 'neighbourhood3')
			
			def activityType1 = ActivityType.build(name: 'activityType1')
			def activityType2 = ActivityType.build(name: 'activityType2')

			def activity1 = Activity.build(neighbourhood: neighbourhood1, activityType: activityType1, entity: entity, name: 'Activity1')
			def activity2 = Activity.build(neighbourhood: neighbourhood2, activityType: activityType1, entity: entity, name: 'Activity2')
			def activity3 = Activity.build(neighbourhood: neighbourhood2, activityType: activityType2, entity: entity, name: 'Activity3')

		when:
			def activitiesNeighbourhood1 = searchService.activitySearch(neighbourhood1, null, null)		
			def activitiesNeighbourhood2 = searchService.activitySearch(neighbourhood2, null, null)
			
		then:
			activitiesNeighbourhood1.size() == 1
			activitiesNeighbourhood2.size() == 2
	}
}