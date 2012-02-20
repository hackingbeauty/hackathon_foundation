CoffeeChat.Views.UserListView = Backbone.View.extend({
  template:_.template($('#user_list_view').html()),
  id:'user_list',
  events:{
  },
  initialize:function(){
    _.bindAll(this, 'render');
    this.collection.bind('reset', this.render);
    this.collection.bind('add', this.render);
  },
  render:function(){
    $(this.el).html(this.template({}));
    $users = $('#users');
    var count = 0,
        row = "";
    console.log('inside user_list view, collection is',this.collection);
    this.collection.each(function(user){
      if(count%2 == 0){
        row = "even";
      } else {
        row = "odd";
      }
      console.log('this user is',user);
      var user_view = new CoffeeChat.Views.UserView({
        model: user,
        row: row
      });
      $users.append(user_view.render().el);
      count++
    }); 
    return this;
  }
});
