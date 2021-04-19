import ActiveModelAdapter from 'active-model-adapter';
import Ember from 'ember';
export default ActiveModelAdapter.extend({
  authManager: Ember.inject.service(),

  headers: Ember.computed('authManager.accessToken', function () {
    return {
      "Authorization": `${this.get("authManager.accessToken")}`
    };
  })
}
);
