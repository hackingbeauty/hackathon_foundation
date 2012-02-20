CoffeeChat.Login = {
  loginUser: function(form){
    var userData = {
      email: $(form).find('#email').val(),
      name: $(form).find('#name').val()    
    }
    alert('about to call communicator');
    CoffeeChat.Communicator.sendCoordinatesAndData(userData,this.displayUsers);
  },
  displayUsers: function(){
    console.log('boo');
    console.log(this);
    CoffeeChat.UsersCollection.reset(this);
  }  
}
