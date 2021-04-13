class MenuItem < ActiveRecord::Base
  belongs_to :menu_category
  #has_many :cart_items
end
