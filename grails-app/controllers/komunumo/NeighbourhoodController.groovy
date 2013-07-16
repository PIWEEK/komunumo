package komunumo

import org.springframework.dao.DataIntegrityViolationException

class NeighbourhoodController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [neighbourhoodInstanceList: Neighbourhood.list(params), neighbourhoodInstanceTotal: Neighbourhood.count()]
    }

    def create() {
        [neighbourhoodInstance: new Neighbourhood(params)]
    }

    def save() {
        def neighbourhoodInstance = new Neighbourhood(params)
        if (!neighbourhoodInstance.save(flush: true)) {
            render(view: "create", model: [neighbourhoodInstance: neighbourhoodInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'neighbourhood.label', default: 'Neighbourhood'), neighbourhoodInstance.id])
        redirect(action: "show", id: neighbourhoodInstance.id)
    }

    def show(Long id) {
        def neighbourhoodInstance = Neighbourhood.get(id)
        if (!neighbourhoodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'neighbourhood.label', default: 'Neighbourhood'), id])
            redirect(action: "list")
            return
        }

        [neighbourhoodInstance: neighbourhoodInstance]
    }

    def edit(Long id) {
        def neighbourhoodInstance = Neighbourhood.get(id)
        if (!neighbourhoodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'neighbourhood.label', default: 'Neighbourhood'), id])
            redirect(action: "list")
            return
        }

        [neighbourhoodInstance: neighbourhoodInstance]
    }

    def update(Long id, Long version) {
        def neighbourhoodInstance = Neighbourhood.get(id)
        if (!neighbourhoodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'neighbourhood.label', default: 'Neighbourhood'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (neighbourhoodInstance.version > version) {
                neighbourhoodInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'neighbourhood.label', default: 'Neighbourhood')] as Object[],
                          "Another user has updated this Neighbourhood while you were editing")
                render(view: "edit", model: [neighbourhoodInstance: neighbourhoodInstance])
                return
            }
        }

        neighbourhoodInstance.properties = params

        if (!neighbourhoodInstance.save(flush: true)) {
            render(view: "edit", model: [neighbourhoodInstance: neighbourhoodInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'neighbourhood.label', default: 'Neighbourhood'), neighbourhoodInstance.id])
        redirect(action: "show", id: neighbourhoodInstance.id)
    }

    def delete(Long id) {
        def neighbourhoodInstance = Neighbourhood.get(id)
        if (!neighbourhoodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'neighbourhood.label', default: 'Neighbourhood'), id])
            redirect(action: "list")
            return
        }

        try {
            neighbourhoodInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'neighbourhood.label', default: 'Neighbourhood'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'neighbourhood.label', default: 'Neighbourhood'), id])
            redirect(action: "show", id: id)
        }
    }
}
