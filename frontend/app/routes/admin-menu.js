import Ember from 'ember';


export default Ember.Route.extend({
  model: function () {
    return Ember.RSVP.hash({
      new_menu_item: this.store.createRecord('menu-item'),
      menu_items: this.store.findAll('menu-item')
    });
  }
});
