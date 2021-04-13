class RemoveTypeFromCartItems < ActiveRecord::Migration
  def up
    remove_column :cart_items, :type
      end

  def down
    add_column :cart_items, :type, :string
  end
end
