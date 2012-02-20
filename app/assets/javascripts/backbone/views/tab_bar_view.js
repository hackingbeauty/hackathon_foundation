CoffeeChat.Views.TabBarView = Backbone.View.extend({
  template: _.template($('#tab_bar_view').html()),    
  events:{
    'click #tab-home #home':'home',
    'click #tab-announce #announce':'announce',
    'click #tab-announce #logout':'logout',
    'click #tab-favorites #favorites':'favorites'
  },
  initialize: function(){
    _.bindAll(this, 'render');
    this.login_view = new CoffeeChat.Views.LoginView();
  },
  home: function(){
    app.navigate("", true);
    return false;
  },
  announce: function(){
    $('#main #container').append(this.login_view.render().el);
  },
  logout: function(){
    alert('logout');
  },
  favorites: function(){
  },
  render: function(){
    $(this.el).html(this.template());
    return this;
  }
});
