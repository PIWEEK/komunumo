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
      return this.dataRetriever();
    };

    HomeView.prototype.dataRetriever = function() {
      var aTypeId, neighId, nextDate, url;
      if (typeof /(?:)/ === "function") {
        /(?:)/(neighId = 2 & (aTypeId = 3 & (nextDate = 30)));
      }
      url = "http://localhost:8080/komunumo/api/activity/search";
      return $.get(url, function(data) {
        var item, _i, _len, _ref1, _results;
        _ref1 = data.list;
        _results = [];
        for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
          item = _ref1[_i];
          console.log(item);
          console.log(item["class"]);
          console.log(item.id);
          console.log(item.activityDate);
          console.log(item.activityType);
          _results.push(console.log(item.address));
        }
        return _results;
      });
    };

    return HomeView;

  })(View);

  app.views.HomeView = HomeView;

}).call(this);
