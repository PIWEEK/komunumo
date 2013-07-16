package komunumo

import org.springframework.dao.DataIntegrityViolationException

class EntityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [entityInstanceList: Entity.list(params), entityInstanceTotal: Entity.count()]
    }

    def create() {
        [entityInstance: new Entity(params)]
    }

    def save() {
        def entityInstance = new Entity(params)
        if (!entityInstance.save(flush: true)) {
            render(view: "create", model: [entityInstance: entityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'entity.label', default: 'Entity'), entityInstance.id])
        redirect(action: "show", id: entityInstance.id)
    }

    def show(Long id) {
        def entityInstance = Entity.get(id)
        if (!entityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entity.label', default: 'Entity'), id])
            redirect(action: "list")
            return
        }

        [entityInstance: entityInstance]
    }

    def edit(Long id) {
        def entityInstance = Entity.get(id)
        if (!entityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entity.label', default: 'Entity'), id])
            redirect(action: "list")
            return
        }

        [entityInstance: entityInstance]
    }

    def update(Long id, Long version) {
        def entityInstance = Entity.get(id)
        if (!entityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entity.label', default: 'Entity'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (entityInstance.version > version) {
                entityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'entity.label', default: 'Entity')] as Object[],
                          "Another user has updated this Entity while you were editing")
                render(view: "edit", model: [entityInstance: entityInstance])
                return
            }
        }

        entityInstance.properties = params

        if (!entityInstance.save(flush: true)) {
            render(view: "edit", model: [entityInstance: entityInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'entity.label', default: 'Entity'), entityInstance.id])
        redirect(action: "show", id: entityInstance.id)
    }

    def delete(Long id) {
        def entityInstance = Entity.get(id)
        if (!entityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entity.label', default: 'Entity'), id])
            redirect(action: "list")
            return
        }

        try {
            entityInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'entity.label', default: 'Entity'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'entity.label', default: 'Entity'), id])
            redirect(action: "show", id: id)
        }
    }
}
