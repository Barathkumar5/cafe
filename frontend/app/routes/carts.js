import Ember from 'ember';

export default Ember.Route.extend({
  authManager: Ember.inject.service(),
  model() {
    return this.store.findRecord('cart', 0).catch(() => {
      this.transitionTo('index');
      console.log("error");
    });
  }
});
