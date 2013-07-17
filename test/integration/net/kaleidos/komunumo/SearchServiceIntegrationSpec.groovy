package net.kaleidos.komunumo

import grails.test.*
import grails.plugin.spock.*
import spock.lang.*
import groovy.time.TimeCategory


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
			def activitiesNeighbourhood1 = searchService.activitySearch(neighbourhood1, null, null, null)		
			def activitiesNeighbourhood2 = searchService.activitySearch(neighbourhood2, null, null, null)
			
		then:
			activitiesNeighbourhood1.size() == 1
			activitiesNeighbourhood1[0] == activity1
			
			activitiesNeighbourhood2.size() == 2
			activitiesNeighbourhood2[0] == activity2
			activitiesNeighbourhood2[1] == activity3			
	}
	
	void "searching activities for a given activity type"() {
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
			def activitiesActivityType1 = searchService.activitySearch(null, activityType1, null, null)
			def activitiesActivityType2 = searchService.activitySearch(null, activityType2, null, null)
			
		then:
			activitiesActivityType1.size() == 2
			activitiesActivityType1[0] == activity1
			activitiesActivityType1[1] == activity2
			
			activitiesActivityType2.size() == 1
			activitiesActivityType2[0] == activity3
	}
	
	void "searching activities celebrated a number of days from now"() {
		setup:
		
			def city = City.build()
			def entity = Entity.build(name: 'Entity1')
			
			def neighbourhood1 = Neighbourhood.build(city: city, name: 'neighbourhood1')
			def neighbourhood2 = Neighbourhood.build(city: city, name: 'neighbourhood2')
			def neighbourhood3 = Neighbourhood.build(city: city, name: 'neighbourhood3')
			
			def activityType1 = ActivityType.build(name: 'activityType1')
			def activityType2 = ActivityType.build(name: 'activityType2')
			
			def activity0, activity1, activity2, activity3
			def now, restOfDay, tomorrow, nextThreeDays, nextWeek,nextMonth
			def realNow = new Date()
			
			use(TimeCategory) {
				now = new Date().clearTime()
				restOfDay = now + 1.days				
				tomorrow = now + 2.days
				nextThreeDays = now + 4.days
				nextWeek = now + 1.week + 1.day
				nextMonth = now + 1.months + 1.day

				activity0 = Activity.build(activityDate: realNow + 5.minutes, neighbourhood: neighbourhood2, activityType: activityType2, entity: entity, name: 'Activity0')
				activity1 = Activity.build(activityDate: tomorrow - 5.minutes, neighbourhood: neighbourhood1, activityType: activityType1, entity: entity, name: 'Activity1')
				activity2 = Activity.build(activityDate: nextThreeDays - 5.minutes, neighbourhood: neighbourhood2, activityType: activityType1, entity: entity, name: 'Activity2')
				activity3 = Activity.build(activityDate: nextWeek + 5.hours, neighbourhood: neighbourhood2, activityType: activityType2, entity: entity, name: 'Activity3')
			}
			
		when:
			def activitiesNow = searchService.activitySearch(null, null, realNow, restOfDay)
			def activitiesTomorrow = searchService.activitySearch(null, null, realNow, tomorrow)
			def activitiesNextThreeDays = searchService.activitySearch(null, null, now, nextThreeDays)
			def activitiesNextWeek = searchService.activitySearch(null, null, now, nextWeek)
			def activitiesNextMonth = searchService.activitySearch(null, null, now, nextMonth)
			
		then:
			activitiesNow.size() == 1
			activitiesTomorrow.size() == 2
			activitiesNextThreeDays.size() == 3
			activitiesNextWeek.size() == 3
			activitiesNextMonth.size() == 4
	}
	
	void "searching activities using all the whole search fields "() {
		setup:
		
			def city = City.build()
			def entity = Entity.build(name: 'Entity1')
			
			def neighbourhood1 = Neighbourhood.build(city: city, name: 'neighbourhood1')
			def neighbourhood2 = Neighbourhood.build(city: city, name: 'neighbourhood2')
			def neighbourhood3 = Neighbourhood.build(city: city, name: 'neighbourhood3')
			
			def activityType1 = ActivityType.build(name: 'activityType1')
			def activityType2 = ActivityType.build(name: 'activityType2')
			
			def activity0, activity1, activity2, activity3
			def now, restOfDay, tomorrow, nextThreeDays, nextWeek,nextMonth
			def realNow = new Date()
			
			use(TimeCategory) {
				now = new Date().clearTime()
				restOfDay = now + 1.days
				tomorrow = now + 2.days
				nextThreeDays = now + 4.days
				nextWeek = now + 1.week + 1.day
				nextMonth = now + 1.months + 1.day

				activity0 = Activity.build(activityDate: realNow + 5.minutes, neighbourhood: neighbourhood2, activityType: activityType2, entity: entity, name: 'Activity0')
				activity1 = Activity.build(activityDate: tomorrow - 5.minutes, neighbourhood: neighbourhood1, activityType: activityType1, entity: entity, name: 'Activity1')
				activity2 = Activity.build(activityDate: nextThreeDays - 5.minutes, neighbourhood: neighbourhood2, activityType: activityType1, entity: entity, name: 'Activity2')
				activity3 = Activity.build(activityDate: nextWeek + 5.hours, neighbourhood: neighbourhood2, activityType: activityType2, entity: entity, name: 'Activity3')
			}
			
		when:
			def activitiesNextWeek1 = searchService.activitySearch(neighbourhood2, activityType2, now, nextWeek)
			def activitiesNextWeek2 = searchService.activitySearch(neighbourhood2, activityType1, now, nextWeek)
			def activitiesNow = searchService.activitySearch(neighbourhood1, activityType1, realNow, restOfDay)
			
		then:
			activitiesNextWeek1.size() == 1
			activitiesNextWeek1[0] == activity0
			
			activitiesNextWeek2.size() == 1
			activitiesNextWeek2[0] == activity2
			
			activitiesNow.size() == 0			
	}
	
	
	void "searching activities using none search fields "() {
		setup:
		
			def city = City.build()
			def entity = Entity.build(name: 'Entity1')
			
			def neighbourhood1 = Neighbourhood.build(city: city, name: 'neighbourhood1')
			def neighbourhood2 = Neighbourhood.build(city: city, name: 'neighbourhood2')
			def neighbourhood3 = Neighbourhood.build(city: city, name: 'neighbourhood3')
			
			def activityType1 = ActivityType.build(name: 'activityType1')
			def activityType2 = ActivityType.build(name: 'activityType2')
			
			def activity0, activity1, activity2, activity3
			def now, restOfDay, tomorrow, nextThreeDays, nextWeek,nextMonth
			def realNow = new Date()
			
			use(TimeCategory) {
				now = new Date().clearTime()
				restOfDay = now + 1.days
				tomorrow = now + 2.days
				nextThreeDays = now + 4.days
				nextWeek = now + 1.week + 1.day
				nextMonth = now + 1.months + 1.day

				activity0 = Activity.build(activityDate: realNow + 5.minutes, neighbourhood: neighbourhood2, activityType: activityType2, entity: entity, name: 'Activity0')
				activity1 = Activity.build(activityDate: tomorrow - 5.minutes, neighbourhood: neighbourhood1, activityType: activityType1, entity: entity, name: 'Activity1')
				activity2 = Activity.build(activityDate: nextThreeDays - 5.minutes, neighbourhood: neighbourhood2, activityType: activityType1, entity: entity, name: 'Activity2')
				activity3 = Activity.build(activityDate: nextWeek + 5.hours, neighbourhood: neighbourhood2, activityType: activityType2, entity: entity, name: 'Activity3')
			}
			
		when:
			def allActivities = searchService.activitySearch(null, null, null, null)
			
		then:
			allActivities.size() == 4
	}
}