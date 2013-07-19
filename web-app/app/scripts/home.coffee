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
        
        @initDataRetriever()
        @scrollWatcher()

    scrollWatcher: ->
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

    initMap: ->
        #Update Map
        neighborhoodVal = @$el.find('.neighborhood-select option:selected').val()
        activityVal = @$el.find('.activity-select option:selected').val()
        dateVal = @$el.find('.date-select option:selected').val()
        
        map = @$el.find('#map-block');
        
        map.attr('data-filter-category', neighborhoodVal)
        map.attr('data-filter-subcategory', activityVal)
        map.attr('data-filter-keywords', dateVal)
        
        Macadjan.mapView.refresh();
        
    searchEvents: (event) ->
        element = @
        event.preventDefault()
        target = $(event.currentTarget)
        
        parameters = target.closest($('form')).serialize()
        searchUrl = "api/activity/search"
        
        $.ajax searchUrl,
            data :
                parameters
            success : (res) ->
                element.collection.reset(res.list)
                
                if element.collection.length > 0
                    $('body').animate {
                        scrollTop: 670
                    }, 1000, ->
                        element.$('.activity-search').find('.no-results').remove()
                        element.initMap()
                else
                    $('body').animate {
                        scrollTop: 0
                    }, 1000, ->
                        element.$('.activity-search').find('.no-results').remove()
                        element.$('.activity-search').append('<p class="no-results hidden">Vaya, parece que no hay resultados...</p>').fadeIn()

        
homeView = new HomeView
