package net.kaleidos.komunumo

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import groovy.time.TimeCategory

class ActivityController {
	static scaffold = true

    def activityMap(String cat, String subcat, String kw) {
        def neighbourhoodId = cat
        def activityTypeId = subcat
        def activityDateOption = kw

        if (neighbourhoodId) {
            neighbourhood = Neighbourhood.get(neighbourhoodId)
            if (!neighbourhood) {
				neighbourhood = null
			}
        }

        if (activityTypeId) {
            activityType = ActivityType.get(activityTypeId)
            if (!activityType) {
                activityType = null
            }
        }
        if (activityDateOption) {
            use(TimeCategory) {
				switch (activityDateOption) {
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

        def activitiesList = searchService.activitySearch(neighbourhood, activityType, now, nextDate)

        String text = 'lat\tlon\ticon\ticonSize\ticonOffset\ttitle\tdescription\tpopupSize\n'

        activitiesList.each { activity ->
            if (activity.latitude && activity.longitude) {
                def domain = "localhost:8080"
                def title = "<a href=" + "\"" + "http://" + domain + "/activity/show/" + activity.id + "\">" + activity.name + "</a>"
                def description = "<br/>" + activity.description

                text += activity.latitude + "\t" + activity.longitude + "\t" + "/images/marker.png" + "\t" + 32 + "," + 32 + "\t" + -16 + "," + -16 + "\t" + title + "\t" + description + "\t" + 300 + "," + 120 + "\n"
            }
        }

        render text
    }
}
