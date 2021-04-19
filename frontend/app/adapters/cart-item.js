import ActiveModelAdapter from 'active-model-adapter';
import Ember from 'ember';
export default ActiveModelAdapter.extend({
  authManager: Ember.inject.service(),

  headers: Ember.computed('authManager.accessToken', function () {
    //console.log(this.get("authManager.accessToken"));
    return {
      "Authorization": `${this.get("authManager.accessToken")}`
    };
  })
}
);
