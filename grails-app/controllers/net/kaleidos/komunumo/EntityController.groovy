package net.kaleidos.komunumo

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class EntityController {
	static scaffold = true

    def entityDetail(String id) {
        def entity
        if (id) {
            entity = Entity.get(id)
        }

        def activities = Activity.withCriteria {
            eq "entity.id",  entity.id
        }

        return render(view:'/entity', model:[entity: entity, activities: activities, neigbourhoodList: Neighbourhood.list(), activityTypeList: ActivityType.list()])
    }

    def entityDetailMap(String cat) {
        def entityId = cat
        def entity

        if (entityId) {
            entity = Entity.get(entityId)
        }

        String text = 'lat\tlon\ticon\ticonSize\ticonOffset\ttitle\tdescription\tpopupSize\n'

        if (entity.latitude && entity.longitude) {
            def domain = "localhost:8080"
            def title = "<a href=" + "\"" + "http://" + domain + "/entity/detail/" + entity.id + "\">" + entity.name + "</a>"
            def description = "<br/>" + entity.description

            text += entity.latitude + "\t" + entity.longitude + "\t" + "/images/marker.png" + "\t" + 32 + "," + 32 + "\t" + -16 + "," + -16 + "\t" + title + "\t" + description + "\t" + 300 + "," + 120 + "\n"
        }

        render text
    }
}
