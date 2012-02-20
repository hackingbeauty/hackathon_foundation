CoffeeChat.Facebook = {
  login: function(){
    FB.login(function(response) {
      console.log('inside fb login');
      if (response.authResponse) {
        var button = $('#tab-announce').find('button');
        $(button).attr('id','logout');
        $(button).html('Leave');
        FB.api('/me', function(response) {
          var name = response.name;
          var email = response.email;
          var facebook_id = response.id;
          var user = {
            name: name,
            email: email,
            facebook_id: facebook_id
          }
          CoffeeChat.Communicator.sendCoordinatesAndData(user);
        });
      }
    }, {scope: 'email'});
  },
  logout: function(){
    FB.logout(function(response) {
      var button = $('#tab-announce').find('button');
      $(button).attr('id','announce');
      $(button).html('Announce Yourself');
      $('#users').html('');
    });
  },
  facebookButton: function(response){
    var button = $('#tab-announce').find('button');     
    if (response.status === 'connected') {
      $(button).html('Leave');
      $(button).attr('id','logout');
    } else {
      $(button).html('Announce Yourself');
      $(button).attr('id','announce');
    }
  }
}


