import Ember from 'ember';

export default Ember.Route.extend({
  authManager: Ember.inject.service(),
  before_model() {
    this.get("authmanager.accessToken");
    console.log(this.get("authmanager.accessToken") + 11);
  }
}
);
