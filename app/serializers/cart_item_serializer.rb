class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :cart_id, :menu_item_id, :menu_name, :menu_price
  has_one :menu_item, Serializer: MenuItemSerializer
  #has_one :cart, Serializer: CartSerializer
  def menu_name
    object.menu_item.name unless object.menu_item.blank?
  end
  def menu_price
    object.menu_item.price unless object.menu_item.blank?
  end
end
