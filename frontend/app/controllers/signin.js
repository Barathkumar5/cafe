import Ember from 'ember';
import { UnauthorizedError } from 'ember-ajax/errors';


export default Ember.Controller.extend({
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
      let user = this.store.queryRecord('user', { email: email }).then(function (users) {
        if (users) {
          let new_user = this1.store.createRecord('signin', { email: email });
          new_user.save();
          this1.transitionToRoute('menu_items');
        }
        else {
          console.log("hello");
          alert("Invalid credentials! check your email or if you are a new user signup first");
        }
      }).catch(function (error) {
        if (error instanceof UnauthorizedError) {
          alert("Invalid credentials!");
        }
      });
    }
  }
});
