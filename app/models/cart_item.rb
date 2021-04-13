class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :menu_item
  attr_accessible :cart_id, :quantity, :menu_item_id
end
