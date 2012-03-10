CoffeeChat.Login = {
  loginUser: function(form,callingObj){
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
        callingObj.remove(); //remove the login view which is calling this module        
        for (item in response){
          var user = new CoffeeChat.Models.User({
            name: response[item].name,
            facebook_id: response[item].facebook_id
          });
          CoffeeChat.UsersCollection.add(user);
        }
      },
      error: function(res){
        $(callingObj.el).children(':first').html('Ooopsy!  There was a problem.  Try again.');
      }
    });
  }
}
