class ListItemView extends Backbone.View

    initialize: ->
        _.templateSettings =
            interpolate : /\{\{(.+?)\}\}/g

        template = _.template($("#activity-template").html());
        @$el.html(template(@model.attributes))
        

class ListCollection extends Backbone.Collection
    model: Backbone.Model
    view: ListItemView


class HomeView extends Backbone.Epoxy.View
    el: 'body'
    
    collection: new ListCollection()

    events: ->
        'click .search-event': 'searchEvents'

    initialize: ->
        element = @
        #Arguments
        #?neighId=2&aTypeId=3&nextDate=30
        
        @initDataRetriever()

        

        #Scroll watcher
        $(window).scroll ->
            headerHeight = $('.home-header').height()
            scrollPosition = $(window).scrollTop()
            if( scrollPosition > (headerHeight*.15) && headerHeight < (scrollPosition*.75) )
                $(".alt-header").fadeIn("slow");
            else
                $(".alt-header").fadeOut("fast");

        
        
    initDataRetriever: ->
        searchUrl = "api/activity/search"
        $.get searchUrl, (data) =>
            @collection.set(data.list)

    searchEvents: ->

        #UpdateSearch
        parameters = $('.search-form').serialize()
        searchUrl = "api/activity/search"

        $.ajax searchUrl,
            data :
                parameters
            success  : (res) ->
                console.log res.list
                #@collection.reset(data.list)
                #@$el.animate({ scrollTop: 670 }, 1000);
                #@$el.find("#activity-template").emty()
                #@ListItemView.initialize()
                

        #Text on select
        neighborhood = @$el.find('.neighborhood-select option:selected').text()
        activity = @$el.find('.activity-select option:selected').text()
        date = @$el.find('.date-select option:selected').text()
        activityDefault = @$el.find('.activity-select .default').text()
        neighborhoodDefault = @$el.find('.neighborhood-select .default').text()
        dateDefault = @$el.find('.date-select .default').text()

        if activity != activityDefault
            @$el.find('.title-activities .activity-search').text(activity)
        else
            @$el.find('.title-activities .activity-search').text('lo que sea')

        if neighborhood != neighborhoodDefault
            @$el.find('.title-activities .neigborhood-search').text('en ' + neighborhood)
        else
            @$el.find('.title-activities .neigborhood-search').text('donde sea')

        if date != dateDefault
            @$el.find('.title-activities .date-search').text(date)
        else
            @$el.find('.title-activities .date-search').text('cuando sea')

        #
        #Update Map
        #neighborhoodVal = @$el.find('.neighborhood-select option:selected').val()
        #activityVal = @$el.find('.activity-select option:selected').text()
        #dateVal = @$el.find('.date-select option:selected').text()
        
        #console.log $('.map');
        #@$el.find('.map').data('filter-category').value(neighborhoodVal)
        #@$el.find('.map').data('filter-subcategory').value(activityVal)
        #@$el.find('.map').data('filter-keywords').value(dateVal)

        #@Macadjan.mapView.refresh()
        ##
            
homeView = new HomeView
