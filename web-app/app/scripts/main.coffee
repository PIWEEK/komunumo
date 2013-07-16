class View extends Backbone.View
@View = View

$ ->
    view = $("body").data('view')
    if (view)
        viewCls = app.views[view]
        if (viewCls)
            app.main = new viewCls()

class Komunumo extends View
    el: $('body')
    models: {}
    collections: {}
    views: {}
    console.log "Welcome to Komunumo's Backbone"

@app = new Komunumo()
