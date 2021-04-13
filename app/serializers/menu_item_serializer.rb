class MenuItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description
  #has_many :cart_items, Serializer: CartItemSerializer
end
