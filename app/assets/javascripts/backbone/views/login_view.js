CoffeeChat.Views.LoginView = Backbone.View.extend({
  formElem: '#login_form',
  template: _.template(
    '<div id="login_modal">' +
      '<div id="login_modal_container">' +
        '<div id="message">Announce Yourself!</div>' +
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
      '</div>' +
    '<div>'
  ),    
  events:{
    'click #login_form #login_submit':'loginUser'
  },
  initialize: function(){
    _.bindAll(this, 'render');
  },
  loginUser: function(){
    CoffeeChat.Login.loginUser(this.formElem,this);
    return false;
  },
  render: function(){
    $(this.el).html(this.template());
    return this;
  }
});
