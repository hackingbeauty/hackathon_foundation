CoffeeChat.Views.UserProfileView = Backbone.View.extend({
  template: _.template($('#user_profile_view').html()),    
  tagName: 'div',
  className: 'user_profile',
  events:{
  },
  initialize: function(){
    _.bindAll(this, 'render');
  },
  render: function(){
    console.log('inside user_profile render',this.model);
    $(this.el).html(this.template(this.model.toJSON()));
    return this;
  }
});