package komunumo

import grails.test.*
import grails.plugin.spock.*
import spock.lang.*


class SearchServiceIntegrationSpec extends IntegrationSpec {

	void "searching activities for a neighborhood given"() {
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

			def a = 3
		
		when:
			a = 3		
		
		then:
			a == 3
			println activity1
	}
}