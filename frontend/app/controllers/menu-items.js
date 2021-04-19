import Ember from 'ember';

export default Ember.Controller.extend({
  authManager: Ember.inject.service(),
  actions: {
    createCartItem: function (params) {
      var id = params;
      console.log(id);
      var this1 = this;
      let cart_item = this.store.createRecord("cart-item", {
        menuItemId: id,
        quantity: 1
      }
      );
      cart_item.save();
    },
    signOut: function () {
      this.get('authManager').invalidate();
      this.transitionToRoute('index');
      alert("successfully Logged out");
    }
  }
}
);
