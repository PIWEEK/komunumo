class View extends Backbone.View
class Model extends Backbone.Model
@View = View
@Model = Model

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
    console.log 'home'

@app = new Komunumo()
