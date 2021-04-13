class CartSerializer < ActiveModel::Serializer
  embed :ids, :include=> true
  attributes :id, :user_id, :status, :total_price
  has_many :cart_items, :key => :cart_item_ids, :root => :cart_items
end
