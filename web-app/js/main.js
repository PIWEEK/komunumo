(function() {
  var Komunumo, Model, View, _ref, _ref1, _ref2,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  View = (function(_super) {
    __extends(View, _super);

    function View() {
      _ref = View.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    return View;

  })(Backbone.View);

  Model = (function(_super) {
    __extends(Model, _super);

    function Model() {
      _ref1 = Model.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    return Model;

  })(Backbone.Model);

  this.View = View;

  this.Model = Model;

  $(function() {
    var view, viewCls;
    view = $("body").data('view');
    if (view) {
      viewCls = app.views[view];
      if (viewCls) {
        return app.main = new viewCls();
      }
    }
  });

  Komunumo = (function(_super) {
    __extends(Komunumo, _super);

    function Komunumo() {
      _ref2 = Komunumo.__super__.constructor.apply(this, arguments);
      return _ref2;
    }

    Komunumo.prototype.el = $('body');

    Komunumo.prototype.models = {};

    Komunumo.prototype.collections = {};

    Komunumo.prototype.views = {};

    return Komunumo;

  })(View);

  this.app = new Komunumo();

}).call(this);
