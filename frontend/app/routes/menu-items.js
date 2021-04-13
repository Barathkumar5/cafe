import Ember from 'ember';


export default Ember.Route.extend({
  model: function () {
    return Ember.RSVP.hash({
      cart_item: this.store.createRecord('cart-item'),
      menu_items: this.store.findAll('menu-item')
    });
  }
});
