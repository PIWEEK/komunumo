(function() {
  var HomeView, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  HomeView = (function(_super) {
    __extends(HomeView, _super);

    function HomeView() {
      _ref = HomeView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    HomeView.prototype.initialize = function() {
      console.log("Welcome to Komunumo's backboneJS");
      return this.dataRetriever();
    };

    HomeView.prototype.dataRetriever = function() {
      var url;
      url = "https://api.meetup.com/2/categories?&sign=true&fields=cinema&page=20";
      return $.get(url, function(data) {
        return console.log(data);
      });
    };

    return HomeView;

  })(View);

  app.views.HomeView = HomeView;

}).call(this);
