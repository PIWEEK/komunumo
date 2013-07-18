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
      this.searchUrl = "api/activity/search";
      this.initDataRetriever();
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
      var _this = this;
      return $.get(this.searchUrl, function(data) {
        return _this.collection.set(data.list);
      });
    };

    HomeView.prototype.searchEvents = function() {
      var activity, activityDefault, activityVal, date, dateDefault, dateVal, neighborhood, neighborhoodDefault, neighborhoodVal, parameters;
      console.log('Komunumo rules');
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
        this.$el.find('.title-activities .date-search').text(date);
      } else {
        this.$el.find('.title-activities .date-search').text('cuando sea');
      }
      this.$el.animate({
        scrollTop: 670
      }, 1000);
      neighborhoodVal = this.$el.find('.neighborhood-select option:selected').val();
      activityVal = this.$el.find('.activity-select option:selected').text();
      dateVal = this.$el.find('.date-select option:selected').text();
      console.log($('.map'));
      this.$el.find('.map').data('filter-category').text(neighborhoodVal);
      this.$el.find('.map').data('filter-subcategory').text(activityVal);
      this.$el.find('.map').data('filter-keywords').text(dateVal);
      this.Macadjan.mapView.refresh();
      parameters = $('.search-form').serialize();
      return $.ajax('api', {
        type: 'GET',
        dataType: 'json'
      }, parameters = parameters, {
        success: function(data) {
          this.collection.reset(data.list);
          this.$el.animate({
            scrollTop: 0
          }, 1000);
          this.$el.find("#activity-template").emty();
          return this.ListItemView.initialize();
        }
      });
    };

    return HomeView;

  })(Backbone.Epoxy.View);

  homeView = new HomeView;

}).call(this);
