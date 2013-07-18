package net.kaleidos.komunumo

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class EntityController {
	static scaffold = true

    def entityDetail(String entityId) {
        def entity
        if (entityId) {
            entity = Entity.get(entityId)
        }

        return render(view:'/entity', model:[entity: entity])
    }
}
