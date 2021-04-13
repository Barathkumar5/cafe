import DS from 'ember-data';

export default DS.Model.extend({
  quantity: DS.attr('number'),
  cartId: DS.attr('number'),
  menuItemId: DS.attr('number'),
  menuName: DS.attr('string'),
  menuPrice: DS.attr('string'),
  //menuItem: DS.belongsTo('menu-item'),
  cart: DS.belongsTo('cart')
}
);
