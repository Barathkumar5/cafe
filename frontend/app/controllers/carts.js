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
    }
  }
}
);
