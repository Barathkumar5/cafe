import Ember from 'ember';


export default Ember.Controller.extend({
  authManager: Ember.inject.service(),
  actions: {
    checkUser: function () {
      var email = this.get('email');
      console.log(email);
      let this1 = this;
      let user = this.store.queryRecord('user', { email: email }).then(function (users) {
        if (users) {
          console.log(users.id);
          console.log(this.store.findRecord('menu_item', 2));
        }
        else {
          console.log(users);
        }
      });
    },
    new_session: function () {
      var email = this.get('email');
      var this1 = this;
      let user = this1.get('authManager').authenticate(email).then(() => {
        alert("success");
        this1.transitionToRoute('menu_items');
      }, (err) => {
        alert('Error obtaining token: ' + err.responseText);
      });
    }/*.catch(function (err) {
        alert('Error obtaining token: ' + err.code);
      });*/
  }
});
