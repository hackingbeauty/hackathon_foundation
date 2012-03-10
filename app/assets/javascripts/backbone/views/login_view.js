CoffeeChat.Views.LoginView = Backbone.View.extend({
  formElem: '#login_form',
  template: _.template(
    '<div id="login_modal">' +
      '<form id="login_form">' +
        '<div class="form_field">' +
          '<label>Email:</label>' +
          '<input id="email" name="email" type="email" />' +
        '</div>' +
        '<div class="form_field">' +
          '<label>Name:</label>' +
          '<input id="name" name="name" />' + 
        '</div>' +
        '<div class="form_field">' +
          '<input id="login_submit" type="submit" value="Announce" />' +
        '</div>' +
      '</form>' +
    '<div>'
  ),    
  events:{
    'click #login_form #login_submit':'loginUser'
  },
  initialize: function(){
    _.bindAll(this, 'render');
  },
  loginUser: function(){
    CoffeeChat.Login.loginUser(this.formElem);
    return false;
  },
  render: function(){
    console.log('inside login view');
    $(this.el).html(this.template());
    return this;
  }
});
