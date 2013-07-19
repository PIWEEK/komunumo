(function() {
  var HomeView, ListCollection, ListItemView, homeView, _ref, _ref1, _ref2,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ListItemView = (function(_super) {
    __extends(ListItemView, _super);

    function ListItemView() {
      _ref = ListItemView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ListItemView.prototype.initialize = function() {
      var template;
      _.templateSettings = {
        interpolate: /\{\{(.+?)\}\}/g
      };
      template = _.template($("#activity-template").html());
      return this.$el.html(template(this.model.attributes));
    };

    return ListItemView;

  })(Backbone.View);

  ListCollection = (function(_super) {
    __extends(ListCollection, _super);

    function ListCollection() {
      _ref1 = ListCollection.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    ListCollection.prototype.model = Backbone.Model;

    ListCollection.prototype.view = ListItemView;

    return ListCollection;

  })(Backbone.Collection);

  HomeView = (function(_super) {
    __extends(HomeView, _super);

    function HomeView() {
      _ref2 = HomeView.__super__.constructor.apply(this, arguments);
      return _ref2;
    }

    HomeView.prototype.el = 'body';

    HomeView.prototype.collection = new ListCollection();

    HomeView.prototype.events = function() {
      return {
        'click .search-event': 'searchEvents'
      };
    };

    HomeView.prototype.initialize = function() {
      var element;
      element = this;
      this.initDataRetriever();
      return this.scrollWatcher();
    };

    HomeView.prototype.scrollWatcher = function() {
      return $(window).scroll(function() {
        var headerHeight, scrollPosition;
        headerHeight = $('.home-header').height();
        scrollPosition = $(window).scrollTop();
        if (scrollPosition > (headerHeight * .15) && headerHeight < (scrollPosition * .75)) {
          return $(".alt-header").fadeIn("slow");
        } else {
          return $(".alt-header").fadeOut("fast");
        }
      });
    };

    HomeView.prototype.initDataRetriever = function() {
      var searchUrl,
        _this = this;
      searchUrl = "api/activity/search";
      return $.get(searchUrl, function(data) {
        return _this.collection.set(data.list);
      });
    };

    HomeView.prototype.initMap = function() {
      var activityVal, dateVal, map, neighborhoodVal;
      neighborhoodVal = this.$el.find('.neighborhood-select option:selected').val();
      activityVal = this.$el.find('.activity-select option:selected').val();
      dateVal = this.$el.find('.date-select option:selected').val();
      map = this.$el.find('#map-block');
      map.data('filter-category', neighborhoodVal);
      map.data('filter-subcategory', activityVal);
      map.data('filter-keywords', dateVal);
      return Macadjan.mapView.refresh();
    };

    HomeView.prototype.searchEvents = function(event) {
      var element, parameters, searchUrl, target;
      element = this;
      event.preventDefault();
      target = $(event.currentTarget);
      parameters = target.closest($('form')).serialize();
      searchUrl = "api/activity/search";
      return $.ajax(searchUrl, {
        data: parameters,
        success: function(res) {
          element.collection.reset(res.list);
          if (element.collection.length > 0) {
            return $('body').animate({
              scrollTop: 670
            }, 1000, function() {
              element.$('.activity-search').find('.no-results').remove();
              return element.initMap();
            });
          } else {
            return $('body').animate({
              scrollTop: 0
            }, 1000, function() {
              element.$('.activity-search').find('.no-results').remove();
              return element.$('.activity-search').append('<p class="no-results hidden">Vaya, parece que no hay resultados...</p>').fadeIn();
            });
          }
        }
      });
    };

    return HomeView;

  })(Backbone.Epoxy.View);

  homeView = new HomeView;

}).call(this);
