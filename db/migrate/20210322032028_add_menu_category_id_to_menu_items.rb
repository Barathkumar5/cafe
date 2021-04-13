class AddMenuCategoryIdToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :menu_category_id, :bigint

  end
end
