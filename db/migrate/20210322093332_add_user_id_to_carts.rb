class AddUserIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :user_id, :bigint

  end
end
