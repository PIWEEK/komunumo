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
      this.initMap();
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

    HomeView.prototype.initMap = function() {};

    HomeView.prototype.searchEvents = function() {
      var activity, activityDefault, date, dateDefault, element, neighborhood, neighborhoodDefault, parameters, searchUrl;
      element = this;
      parameters = $('.search-form').serialize();
      searchUrl = "api/activity/search";
      $.ajax(searchUrl, {
        data: parameters,
        success: function(res) {
          element.collection.reset(res.list);
          console.log(element.collection);
          if (element.collection.length > 0) {
            return $('body').animate({
              scrollTop: 670
            }, 1000);
          } else {
            return element.$('.title-activities').text('Vaya, parece que no hay resultados...');
          }
        }
      });
      neighborhood = this.$el.find('.neighborhood-select option:selected').text();
      activity = this.$el.find('.activity-select option:selected').text();
      date = this.$el.find('.date-select option:selected').text();
      activityDefault = this.$el.find('.activity-select .default').text();
      neighborhoodDefault = this.$el.find('.neighborhood-select .default').text();
      dateDefault = this.$el.find('.date-select .default').text();
      if (activity !== activityDefault) {
        this.$el.find('.title-activities .activity-search').text(activity);
      } else {
        this.$el.find('.title-activities .activity-search').text('lo que sea');
      }
      if (neighborhood !== neighborhoodDefault) {
        this.$el.find('.title-activities .neigborhood-search').text('en ' + neighborhood);
      } else {
        this.$el.find('.title-activities .neigborhood-search').text('donde sea');
      }
      if (date !== dateDefault) {
        return this.$el.find('.title-activities .date-search').text(date);
      } else {
        return this.$el.find('.title-activities .date-search').text('cuando sea');
      }
    };

    return HomeView;

  })(Backbone.Epoxy.View);

  homeView = new HomeView;

}).call(this);
