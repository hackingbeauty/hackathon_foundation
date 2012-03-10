CoffeeChat.Login = {
  loginUser: function(form){
    var self = this;
    var userData = {
      email: $(form).find('#email').val(),
      name: $(form).find('#name').val()    
    }
    userData['coordinates'] = $.parseJSON($.cookie('coordinates'));
    $.ajax({
      type: "POST", 
      url: "/sessions", 
      data: {
        user: userData
      },
      success: function(response){
        for (item in response){
          var user = new CoffeeChat.Models.User({
            name: response[item].name,
            facebook_id: response[item].facebook_id
          });
          CoffeeChat.UsersCollection.add(user);
        }
        $(CoffeeChat.Views.LoginView.el).remove();
      },
      error: function(res){
        console.log('error res is ',res);
      }
    });
  }
}
