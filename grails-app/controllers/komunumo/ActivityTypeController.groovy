package komunumo

import org.springframework.dao.DataIntegrityViolationException

class ActivityTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [activityTypeInstanceList: ActivityType.list(params), activityTypeInstanceTotal: ActivityType.count()]
    }

    def create() {
        [activityTypeInstance: new ActivityType(params)]
    }

    def save() {
        def activityTypeInstance = new ActivityType(params)
        if (!activityTypeInstance.save(flush: true)) {
            render(view: "create", model: [activityTypeInstance: activityTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activityType.label', default: 'ActivityType'), activityTypeInstance.id])
        redirect(action: "show", id: activityTypeInstance.id)
    }

    def show(Long id) {
        def activityTypeInstance = ActivityType.get(id)
        if (!activityTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityType.label', default: 'ActivityType'), id])
            redirect(action: "list")
            return
        }

        [activityTypeInstance: activityTypeInstance]
    }

    def edit(Long id) {
        def activityTypeInstance = ActivityType.get(id)
        if (!activityTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityType.label', default: 'ActivityType'), id])
            redirect(action: "list")
            return
        }

        [activityTypeInstance: activityTypeInstance]
    }

    def update(Long id, Long version) {
        def activityTypeInstance = ActivityType.get(id)
        if (!activityTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityType.label', default: 'ActivityType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (activityTypeInstance.version > version) {
                activityTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'activityType.label', default: 'ActivityType')] as Object[],
                          "Another user has updated this ActivityType while you were editing")
                render(view: "edit", model: [activityTypeInstance: activityTypeInstance])
                return
            }
        }

        activityTypeInstance.properties = params

        if (!activityTypeInstance.save(flush: true)) {
            render(view: "edit", model: [activityTypeInstance: activityTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'activityType.label', default: 'ActivityType'), activityTypeInstance.id])
        redirect(action: "show", id: activityTypeInstance.id)
    }

    def delete(Long id) {
        def activityTypeInstance = ActivityType.get(id)
        if (!activityTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityType.label', default: 'ActivityType'), id])
            redirect(action: "list")
            return
        }

        try {
            activityTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'activityType.label', default: 'ActivityType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'activityType.label', default: 'ActivityType'), id])
            redirect(action: "show", id: id)
        }
    }
}
