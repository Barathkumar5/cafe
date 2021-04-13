class AddTypeToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :type, :string

  end
end
