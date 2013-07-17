class HomeView extends View

    initialize: ->
        console.log "Welcome to Komunumo's backboneJS"
        @dataRetriever()

    dataRetriever: ->
    
        url = "https://api.meetup.com/2/categories?&sign=true&fields=cinema&page=20&key=4a385c722714a33136f38124e661f"
        
        $.get url, (data) ->
            console.log (data)

app.views.HomeView = HomeView
