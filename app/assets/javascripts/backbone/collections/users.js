CoffeeChat.Collections.Users = Backbone.Collection.extend({ 
  model: CoffeeChat.Models.User, 
  url: 'http://localhost:4444/users' //productionUrl needed here
});



