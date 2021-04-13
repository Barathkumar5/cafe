class RemoveTypeFromMenuItems < ActiveRecord::Migration
  def up
    remove_column :menu_items, :type
      end

  def down
    add_column :menu_items, :type, :string
  end
end
