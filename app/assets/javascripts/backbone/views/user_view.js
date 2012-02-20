CoffeeChat.Views.UserView = Backbone.View.extend({
  template: _.template($('#user_view').html()),    
  tagName: 'li',
  className: 'user',
  events:{
    'click .user .data':'go_to_profile'
  },
  initialize: function(){
    _.bindAll(this, 'render');
  },
  render: function(){
    console.log('inside user_view',this.model);
    console.log('inside user_view with toJSON() call', this.model.toJSON());
    $(this.el).html(this.template(this.model.toJSON()));
    $(this.el).addClass(this.options.row)
    return this;
  },
  go_to_profile: function(){
    console.log('this.model is',this.model.cid);
     app.navigate("profile/"+this.model.cid, true);
  }
});
