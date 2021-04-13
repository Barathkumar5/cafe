import DS from 'ember-data';

export default DS.Model.extend({
  userId: DS.attr('string'),
  totalPrice: DS.attr('number'),
  status: DS.attr('string'),
  cartItems: DS.hasMany('cart-item'),
  cartItemIds: DS.attr('number')
}
);
