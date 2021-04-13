class AddTypeToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :type, :string

  end
end
