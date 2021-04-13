class RemoveCustomerIdFromCarts < ActiveRecord::Migration
  def up
    remove_column :carts, :customer_id
      end

  def down
    add_column :carts, :customer_id, :string
  end
end
