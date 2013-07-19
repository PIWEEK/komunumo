package net.kaleidos.komunumo

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import groovy.time.TimeCategory

class ActivityController {
	static scaffold = true

    def searchService

    def activityMap(String cat, String subcat, String kw) {
        def neighbourhoodId = cat
        def activityTypeId = subcat
        def activityDateOption = kw

        def neighbourhood
        if (neighbourhoodId) {
            neighbourhood = Neighbourhood.get(neighbourhoodId)
            if (!neighbourhood) {
				neighbourhood = null
			}
        }

        def activityType
        if (activityTypeId) {
            activityType = ActivityType.get(activityTypeId)
            if (!activityType) {
                activityType = null
            }
        }

        def endDate, realNow, now
        if (activityDateOption) {

            realNow = new Date()
			now = realNow.clearTime()

            use(TimeCategory) {
				switch (activityDateOption) {
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

        def activitiesList = searchService.activitySearch(neighbourhood, activityType, realNow, endDate)

        String text = 'lat\tlon\ticon\ticonSize\ticonOffset\ttitle\tdescription\tpopupSize\n'

        activitiesList.each { activity ->
            if (activity.latitude && activity.longitude) {
                def domain = "localhost:8080"
                def title = "<a class=\"popup-title\" href=" + "\"" + "http://" + domain + "/komunumo/activity/detail?id=" + activity.id + "\">" + activity.name + "</a>"
                def description = "<span class=\"popup-description\">" + activity.description + "</span>"

                text += activity.latitude + "\t" + activity.longitude + "\t" + "/komunumo/images/marker.png" + "\t" + 25 + "," + 25 + "\t" + -16 + "," + -16 + "\t" + title + "\t" + description + "\t" + 300 + "," + 120 + "\n"
            }
        }

        render text
    }

    def activityDetail(String id) {

        def activity
        if (id) {
            activity = Activity.get(id)
        }

        def activities = Activity.withCriteria {
            eq "neighbourhood.id",  activity.neighbourhood.id
        }-activity

        return render(view:'/activity', model:[activity: activity, activities: activities, neigbourhoodList: Neighbourhood.list(), activityTypeList: ActivityType.list()])
    }

    def activityDetailMap(String cat) {
        def activityId = cat
        def activity

        if (activityId) {
            activity = Activity.get(activityId)
        }

        String text = 'lat\tlon\ticon\ticonSize\ticonOffset\ttitle\tdescription\tpopupSize\n'

        if (activity.latitude && activity.longitude) {
            def domain = "localhost:8080"
            def title = "<a class=\"popup-title\" href=" + "\"" + "http://" + domain + "/komunumo/activity/detail?id=" + activity.id + "\">" + activity.name + "</a>"
            def description = "<span class=\"popup-description\">" + activity.description + "</span>"

            text += activity.latitude + "\t" + activity.longitude + "\t" + "/komunumo/images/marker.png" + "\t" + 25 + "," + 25 + "\t" + -16 + "," + -16 + "\t" + title + "\t" + description + "\t" + 300 + "," + 120 + "\n"
        }

        render text
    }
}
