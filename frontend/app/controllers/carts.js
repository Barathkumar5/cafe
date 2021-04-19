import Ember from 'ember';
export default Ember.Controller.extend({
  actions: {
    deleteCartItem: function (params) {
      var id = params;
      console.log(id);
      var this1 = this;
      let cart_item = this.store.findRecord("cart-item", id, { backgroundReload: false }).then(function (cart_item) {
        cart_item.destroyRecord();
      }
      );
    },
    statusUpdate: function (params) {
      console.log(params);
      let id = params;
      let this1 = this;
      let cart = this.store.findRecord("cart", id, { backgroundReload: false }).then(function (cart) {
        cart.set('status', "pending delivery");
        cart.save();
        console.log(cart.get('status'));
        this1.transitionToRoute('menu_items');
      }
      );
    },
    currentCartId: function (params) {
      let this1 = this;
      console.log(params);
      this.store.queryRecord('user', { email: this.get("authManager.accessToken") }).then(function (currentUser) {
        let currentUserId = currentUser.get('id');
        console.log(currentUser.get('id'));
        this1.store.queryRecord('cart', { userId: currentUserId }).then(function (currentCart) {
          console.log(currentCart.get('id'));
          return currentCart.get('id');
        });
      });
    }
  }
}
);
