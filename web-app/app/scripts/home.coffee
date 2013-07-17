class HomeView extends View

    initialize: ->
        @dataRetriever()

    dataRetriever: ->
    
        //?neighId=2&aTypeId=3&nextDate=30
        url = "http://localhost:8080/komunumo/api/activity/search"
        
        $.get url, (data) ->
            for item in data.list
                console.log(item)
                console.log(item.class)
                console.log(item.id)
                console.log(item.activityDate)
                console.log(item.activityType)
                console.log(item.address)
                

app.views.HomeView = HomeView
