CoffeeChat.Communicator = {
  getCoordinates: function(){
    var coordinates = $.parseJSON($.cookie('coordinates'));
    return coordinates;
  },
  sendCoordinatesAndData: function(userData,callback){
    var self = this;
    userData['coordinates'] = this.getCoordinates();
    $.ajax({
      type: "POST", 
      url: "/sessions", 
      data: {
        user: userData
      },
      success: function(response){
        console.log('successful response!');
        console.log('collection type?',response.constructor == Object);
        for (item in response){
          console.log('response[item]',response[item]['facebook_id']);
          var user = new CoffeeChat.Models.User({
            name: response[item].name,
            facebook_id: response[item].facebook_id
          });
          console.log('inside loop, user is',user);
          alert('success!');
          CoffeeChat.UsersCollection.add(user);
        }
        // callback.call(responseArr);
      },
      error: function(res){
        console.log('error res is ',res);
      }
    });
   }
}
