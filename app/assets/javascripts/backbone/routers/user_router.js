CoffeeChat.Routers.UserRouter = Backbone.Router.extend({
  routes: {
    '':'home',
    'profile/:cid':'profile'
  },
  initialize: function() {
    this.main_container = $('#main #container');
    this.nav = $('#main #nav');
    this.tab_bar_view = new CoffeeChat.Views.TabBarView();
    CoffeeChat.UsersCollection = new CoffeeChat.Collections.Users();//must set this to window because access i cc.facebook.js
    this.user_list_view = new CoffeeChat.Views.UserListView({
      collection: CoffeeChat.UsersCollection //you haven't fetched, so nothing going on here
    });
    $(this.nav).append(this.tab_bar_view.render().el);
    $(this.main_container).append(this.user_list_view.render().el);  
  },
  home: function(){
    $('#user_list').css('margin-left','0%');
  },
  profile: function(cid){  
    console.log('cid is',cid);
    var the_user =  CoffeeChat.UsersCollection.getByCid(cid);
    console.log('the_user',the_user);
    var user_profile_view = new CoffeeChat.Views.UserProfileView({
       model: the_user
    })
    $('.user_profile').remove(); // remove the element .user_profile before appending it to the page
    $(this.main_container).append(user_profile_view.render().el);
    $('#user_list').css('margin-left','-100%');    
    $('.user_profile').css('margin-left','0% !important');
  }
});
