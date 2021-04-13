import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    createUser: function () {
      var email = this.get('email');
      var firstname = this.get('firstname');
      var lastname = this.get('lastname');
      var phone = this.get('phone');
      var this1 = this;
      var resident_address = this.get('residentialaddress');
      if (email) {
        var exist = this.get('store').queryRecord('user', { email: email }).then(function (users) {
          if (users) {
            alert("An account with this email is already registered!");
          }
          else {
            var user = this1.get('store').createRecord('user', {
              email: email,
              first_name: firstname,
              last_name: lastname,
              phone: phone,
              residential_address: resident_address
            });
            user.save();
            this1.transitionToRoute('signin');
          }
        })
      }
      else {
        alert("Email field should not be empty");
      }
    }
  }
});
