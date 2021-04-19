import Ember from 'ember';
import Cookies from 'ember-cli-js-cookie';
export default Ember.Service.extend({
  accessToken: null,
  authenticate(email) {
    return Ember.$.ajax({
      method: "POST",
      url: "/signins",
      data: { email: email }
    }).then((result) => {
      this.set('accessToken', result.access_token);
      Cookies.set('accessToken', result.access_token);
    });
  },

  invalidate() {
    this.set('accessToken', null);
    Cookies.set('accessToken', null);
  },

  isAuthenticated: Ember.computed.bool('accessToken'),
  initializeFromCookie: function () {
    var access = Cookies.get('accessToken');
    this.set('accessToken', access);
  }.on('init')
});
