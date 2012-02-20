CoffeeChat.Ignition = {
  start:function(){
    CoffeeChat.Location.init();
    var user_router = new CoffeeChat.Routers.UserRouter({});    
    window.app = user_router;
    if (!Backbone.history.started) {
      Backbone.history.start({pushState:true});
      Backbone.history.started = true;
    }
  }
}
    

CoffeeChat.Ignition.start(); //starting point of client-side JS app
