class HomeView extends View

    initialize: ->
        console.log "Welcome to Komunumo's backboneJS"
        @dataRetriever()

    dataRetriever: ->
    
        //?neighId=2&aTypeId=3&nextDate=30
        url = "http://localhost:8080/komunumo/api/activity/search"
        
        $.get url, (data) ->
            console.log (data)

app.views.HomeView = HomeView
