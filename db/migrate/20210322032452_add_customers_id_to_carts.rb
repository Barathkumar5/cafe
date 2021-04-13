class AddCustomersIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :customer_id, :bigint

    add_column :carts, :total_price, :int

  end
end
