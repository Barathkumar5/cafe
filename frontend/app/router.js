import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('users');
  this.route('menu_items');
  this.route('signin');
  this.route('signup');
  this.route('cart_items');
  this.route('admin_menu');
  this.route('carts');
  this.route('orders');
});

export default Router;
