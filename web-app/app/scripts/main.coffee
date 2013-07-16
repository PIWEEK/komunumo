class View extends Backbone.View
@View = View

class Komunumo extends View
    el: $('body')
    models: {}
    collections: {}
    views: {}
    # Private objects
    _models: {}
    _collections: {}
    _views: {}
    console.log 'Hello'

@app = new Komunumo()

$ ->
    view = $("body").data('view')
    if (view)
        viewCls = app.views[view]
        if (viewCls)
            app.main = new viewCls()
